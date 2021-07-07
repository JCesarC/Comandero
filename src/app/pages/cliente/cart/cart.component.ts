import { OnDestroy } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Cart, CartResponse } from 'src/app/shared/models/cart.interface';
import { CartI } from 'src/app/shared/models/CartI.interface';
import { OrdenN } from 'src/app/shared/models/ordenN.interface';
import { OrdenesService } from '../../admin/services/ordenes.service';

import { SignupService } from '../../auth/signup.service';
import { CartService } from '../services/cart.service';
import {FormBuilder, FormControl, FormGroup, Validators} from '@angular/forms';
import { ModalClienteComponent } from '../components/modal-cliente/modal-cliente.component';
import { MatDialog } from '@angular/material/dialog';


interface productoCart{
  id:number;
  cantidad:string;
  producto:string;
  subtotal:string; 
}

let cartInterfaz: Array<productoCart> = [];
@Component({
  selector: 'app-cart',
  templateUrl: './cart.component.html',
  styleUrls: ['./cart.component.scss']
})

export class CartComponent implements OnInit, OnDestroy {
  isLinear = true;
  secondFormGroup!:FormGroup;

  public firstFormGroup = new FormGroup({
    firstCtrl: new FormControl('', [
      Validators.required,
    ])
  })

  public nombreCliente = "";
  public totalOrden = 0;
  public mesa = "";
  public productos:string = "";

  total = 0;
  
  arrayProductos: string[] = [];
  // carrito:any = null;
  isEmpty = true;
  ordenResponse:any;
  carrito:any;

  constructor(private dialog:MatDialog, private _formBuilder: FormBuilder, private signSvc:SignupService, private cartSer:CartService, private ordenSer:OrdenesService) { 

  }
  ngOnDestroy(): void {
    cartInterfaz = [];
  }
  displayedColumns: string[] = ['accion','cantidad', 'producto', 'subtotal'];
  dataSource = cartInterfaz;

  arrayCantidad = [];
  arrayProducto = [];
  arraySubtotal = [];

  ngOnInit(): void {
    this.secondFormGroup = this._formBuilder.group({
      seconCtrl:['', Validators.required]
    });
    
    const cliente = JSON.parse(localStorage.getItem('cliente')!) || null;

    let clienteId = cliente.clienteId;
    this.nombreCliente = cliente.nombre;
    this.mesa = cliente.mesa;

    let cart : CartI ={
      clienteId: clienteId,
      mesa: this.mesa
    }

    this.cargarCarrito(cart);
  }

  async confirmar(){
    let cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    let carritoId = JSON.parse(localStorage.getItem('carritoId')!) || null;
    let mesa = cliente.mesa;

    let clienteId = cliente.clienteId;
    let nombre_cliente = cliente.nombre;
    //let productos_id = JSON.parse(localStorage.getItem('productos_id')!) || null;
    // let productos_id = "4,11";
    let productos_id = JSON.parse(localStorage.getItem('productos_id')!) || null;
    let cantidad_productos = JSON.parse(localStorage.getItem('cantidad_productos')!) || null;
    console.log("Cliente almacenado",cliente);

    let hoy = new Date();
    let fechaHoy = hoy.getDate() +'-'+ (hoy.getMonth()+1)+'-'+hoy.getFullYear();
    let horaHoy = hoy.getHours()+':'+hoy.getMinutes()+':'+hoy.getSeconds();

    let orden : OrdenN = {
      clienteId: clienteId,
      nombre_cliente: nombre_cliente,
      productos: productos_id,
      cantidad_productos: cantidad_productos,
      fecha: fechaHoy,
      hora: horaHoy,
      mesa: mesa
    }

    console.log("Orden a enviar->", orden)

    let res = await this.ordenSer.new(orden).toPromise();
      // this.ordenResponse = res;
    console.log("Orden Creada", res);
    // await this.openModal();
    // let cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    // let nombre_cliente = cliente.nombre;
    let carritoUpdate : Cart = {
      id: carritoId,
      clienteId: clienteId,
      nombre_cliente: nombre_cliente,
      productos_id: "",
      cantidad_productos: "",
      total: 0,
      subtotal: "",
      productos: ""
    }

    const dialogRef= this.dialog.open(ModalClienteComponent,{
      height:'400px',
      width:'600px',
      hasBackdrop:false,
      data:{title:'Orden confirmada',cliente:nombre_cliente, message:'Gracias por compra, tu orden será revisada por un administrador y será confirmada enseguida'},
    });
    await dialogRef.afterOpened().subscribe(res =>{
      let result = this.cartSer.deleteProducto(carritoId, carritoUpdate).toPromise();
      console.log(result);
      
    })
    await dialogRef.afterClosed().subscribe(res =>{
      window.location.reload();
    })

    //window.location.reload();
    console.log("Modal cerrado");
    
  }

  async cargarCarrito(cart: CartI) {

    this.carrito = await this.cartSer.getCart(cart).toPromise();

    console.log("No debe haber problemas con el carrito", this.carrito);
    localStorage.setItem('productos', JSON.stringify(this.carrito.productos));
    localStorage.setItem('productos_id', JSON.stringify(this.carrito.productos_id));
    localStorage.setItem('cantidad_productos', JSON.stringify(this.carrito.cantidad_productos));
    localStorage.setItem('subtotal', JSON.stringify(this.carrito.subtotal));
    localStorage.setItem('carritoId', JSON.stringify(this.carrito.id));

    console.log("Respuesta Carrito->", this.carrito);
    let productos = this.carrito.productos;
    let cantidad = this.carrito.cantidad_productos;
    let subtotal = this.carrito.subtotal;
    let arrayP = productos.split(',');
    console.log(arrayP);
    let arrayC = cantidad.split(',');
    let arrayS = subtotal.split(',');
    for (let i = 0; i < arrayP.length; i++) {
      if (arrayP[i] === "") {
        break
      }
      let producto = {
        id: i,
        cantidad: arrayC[i],
        producto: arrayP[i],
        subtotal: arrayS[i]
      }

      cartInterfaz.push(producto);
    }

    if (productos !== "") {
      this.isEmpty = false;
    } else {
      this.isEmpty = true;
    }
    this.total = this.carrito.total;
    if (this.total === 0) {
      this.firstFormGroup.controls.firstCtrl.setValue("");
    } else {
      this.firstFormGroup.controls.firstCtrl.setValue("$" + this.total + ".00");
      this.totalOrden = this.total;
    }
  }

  async deleteProducto(prodId:number){
    let id = JSON.parse(localStorage.getItem('carritoId')!) || null;
    let cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    let clienteId = cliente.clienteId;
    let nombre_cliente = cliente.nombre;

    let productos = JSON.parse(localStorage.getItem('productos')!) || null;
    let productos_id = JSON.parse(localStorage.getItem('productos_id')!) || null;
    let subtotal = JSON.parse(localStorage.getItem('subtotal')!) || null;
    let cantidad = JSON.parse(localStorage.getItem('cantidad_productos')!) || null;

    
    let arrayP = productos.split(',');
    let arrayPi = productos_id.split(',');
    let arrayC = cantidad.split(',');
    let arrayS = subtotal.split(',');

    arrayP.splice(prodId,1);
    console.log("ar", arrayP);
    arrayPi.splice(prodId,1);
    arrayC.splice(prodId,1);
    arrayS.splice(prodId,1);

    let total = 0;

    productos_id = "";
    productos = "";
    subtotal = "";
    cantidad = "";

    for(let i = 0; i<arrayP.length;i++){
      if(arrayP[i] === ""){
        break;
      }
      productos = productos + arrayP[i]+",";
      productos_id = productos_id + arrayPi[i]+",";
      subtotal = subtotal + arrayS[i]+",";
      cantidad = cantidad + arrayC[i]+",";
      let sub = parseInt(arrayS[i]);
      total = parseInt(""+total) + parseInt(""+sub);
    }
    let carritoUpdate : Cart = {
      id: id,
      clienteId: clienteId,
      nombre_cliente: nombre_cliente,
      productos_id: productos_id,
      cantidad_productos: cantidad,
      total: total,
      subtotal: subtotal,
      productos: productos
    }

    let resp = await this.cartSer.deleteProducto(id, carritoUpdate).toPromise();
    console.log("Respuesta a eliminar, ", resp);
    window.location.reload();

  }

  openModal():void{

  }
}