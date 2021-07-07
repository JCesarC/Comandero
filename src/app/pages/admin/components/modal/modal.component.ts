import { Inject } from '@angular/core';
import { OnDestroy } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';


interface PeriodicElement {
  name: string;
  position: number;
  weight: number;
  symbol: string;
}

interface ProductModal{
  cantidad:string;
  producto:string;
  subtotal:string;
}

const ELEMENT_DATA: PeriodicElement[] = [
  {position: 1, name: 'Hydrogen', weight: 1.0079, symbol: 'H'},
  {position: 2, name: 'Helium', weight: 4.0026, symbol: 'He'},
  {position: 3, name: 'Lithium', weight: 6.941, symbol: 'Li'},
  {position: 4, name: 'Beryllium', weight: 9.0122, symbol: 'Be'},
  {position: 5, name: 'Boron', weight: 10.811, symbol: 'B'},

];

let productoInterfaz: Array<ProductModal> = [];

@Component({
  selector: 'app-modal',
  templateUrl: './modal.component.html',
  styleUrls: ['./modal.component.scss']
})
export class ModalComponent implements OnInit, OnDestroy{

  constructor(@Inject(MAT_DIALOG_DATA) public data:any) { 
    
  }
  ngOnDestroy(): void {
    productoInterfaz = [];
  }

  displayedColumns: string[] = ['cantidad', 'producto', 'subtotal'];
 

  dataSource = productoInterfaz;

  arrayCantidad = [];
  arrayProductos = [];
  arraySubtotal = [];


  productoModal:any=null;

  ngOnInit(): void {
    

    let productos = this.data?.productos?.productos;
    let cantidad = this.data?.productos?.cantidad_productos;
    let subtotal = this.data?.productos?.subtotal_productos;
    let arrayP = productos.split(',');
    let arrayC = cantidad.split(',');
    let arrayS = subtotal.split(',');

    var prod = {}, produc = [];

   

    for(let i=0;i<arrayP.length;i++){
      let producto ={
        cantidad: arrayC[i],
        producto:arrayP[i],
        subtotal:arrayS[i]
      }

      productoInterfaz.push(producto);
    }

  } 

}
