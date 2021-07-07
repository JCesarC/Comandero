import { Component, OnInit } from '@angular/core';
import { CartI } from 'src/app/shared/models/CartI.interface';
import { ProductoU } from 'src/app/shared/models/productU.interface';
import { CartService } from '../services/cart.service';
import { CategoriaService } from '../services/categoria.service';
import { MenuService } from '../services/menu.service';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  productos:any = null;
  categorias:any = null;
  cartResponse:any;
  carrito:any;

  constructor(
    private toastr:ToastrService,
    private cartServ: CartService,
    private menuSer: MenuService,
    private catServ: CategoriaService,
    private updS: CartService,
  ) {

    }

  ngOnInit(): void {

    const cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    let clienteId = cliente.clienteId;
    // this.nombreCliente = cliente.nombre;
    let mesa = cliente.mesa;

    let cart : CartI ={
      clienteId: clienteId,
      mesa: mesa
    }

    this.cargarCarrito(cart);

    this.menuSer.getAll().subscribe((producto) =>{
      this.productos = producto;
      
    });

    this.catServ.getAll().subscribe((categoria) =>{
      this.categorias = categoria;
    })
  }

  onAdd(idProducto: number){
    console.log(idProducto);
    let carritoId = JSON.parse(localStorage.getItem('carritoId')!) || null;
    console.log("Carrito->", carritoId);
    let cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    console.log("CLiente->", cliente);
    let clienteId = cliente.clienteId;

    let producto: ProductoU = {
      carritoId: carritoId,
      clienteId: clienteId,
      productoId: idProducto
    }

    this.updS.update(carritoId, producto).subscribe((res) => {
      this.cartResponse = res;
    })
  }
  async cargarCarrito(cart:CartI){
    this.carrito = await this.cartServ.getCart(cart).toPromise();
    console.log("No debe haber problemas con el carrito");

    localStorage.setItem('productos', JSON.stringify(this.carrito.productos));
    localStorage.setItem('productos_id', JSON.stringify(this.carrito.productos_id));
    localStorage.setItem('cantidad_productos', JSON.stringify(this.carrito.cantidad_productos));
    localStorage.setItem('subtotal', JSON.stringify(this.carrito.subtotal));
    localStorage.setItem('carritoId', JSON.stringify(this.carrito.id));

    
  }

  showNotification() {
    this.toastr.success('<span class="now-ui-icons ui-1_bell-53"></span> ¡Producto agregado al carrito! ', '', {
      timeOut: 3000,
      closeButton: true,
      enableHtml: true,
      toastClass: "alert alert-info alert-with-icon",
      positionClass: 'toast-' + 'top' + '-' + 'right'
    })
  }
}
