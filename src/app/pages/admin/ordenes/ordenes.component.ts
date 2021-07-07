import { AfterViewInit } from '@angular/core';
import { Component, OnInit, ViewChild } from '@angular/core';
import { MatTable, MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { OrdenesService } from '../services/ordenes.service';
import { MatDialog } from '@angular/material/dialog';
import { ModalComponent } from '../components/modal/modal.component';
import { Orden } from 'src/app/shared/models/orden.interface';

import {Sort} from '@angular/material/sort';
import { ToastrService } from 'ngx-toastr';
import { MatPaginator } from '@angular/material/paginator';

export class Ordenes{
  id!: number;
  cliente!: string;
  productos!:string;
  total!:number;
  estado!:string
  
}

export interface OrdenTabla {
  id:number;
  cliente: string;
  productos:string;
  total:number;
  estado:string;

}

@Component({
  selector: 'app-ordenes',
  templateUrl: './ordenes.component.html',
  styleUrls: ['./ordenes.component.scss']
})
export class OrdenesComponent implements OnInit, AfterViewInit{

  ordenesArray: Ordenes[] = [];

  ordenTabla : Ordenes = new Ordenes ();

  displayedColumns: string[] = ['id', 'cliente', 'mesa', 'fecha', 'hora', 'productos', 'total', 'estado', 'actions'];
  dataSource = new MatTableDataSource();
  
  constructor(private toastr: ToastrService, private ordenSvc: OrdenesService, private dialog:MatDialog){

  }
  ngAfterViewInit(): void {
    this.dataSource.sort = this.sort;
    this.dataSource.paginator = this.paginator;
  }
  ngOnInit(): void {
    this.ordenSvc.getAll().subscribe((orden) =>{
      this.dataSource.data = orden;
      this.dataSource.paginator = this.paginator;
      console.log("Ordenes encontradas", orden);
    });
  }

  sortData(sort:Sort){

  }

  onOpenModal(productos:{}):void{
    console.log('Productos->', productos);
    const dialogRef = this.dialog.open(ModalComponent,{
      height:'400px',
      width:'600px',
      hasBackdrop:false,
      data:{title:'Productos', productos},

    });

  }
  @ViewChild(MatTable) table : MatTable<OrdenTabla>;
  @ViewChild(MatSort)
  sort: MatSort = new MatSort;
  @ViewChild(MatPaginator) paginator: MatPaginator;
  searchKey:string;

  async onUpdate(element:any){

    console.log("Cliente: ->", element.clienteId);

    let ord: Orden = {
      id: element.id,
      clienteId: element.clienteId,
      nombre_cliente: element.nombre_cliente,
      mesa: element.mesa,
      productos: element.productos,
      cantidad_productos: element.cantidad_productos,
      total: element.total,
      estado: "CONFIRMADA",
      fecha: element.fecha,
      hora: element.hora
    }

    let res = await this.ordenSvc.update(element.id, ord).toPromise();
    
    this.table.renderRows();
    console.log("Tabla debe actualizarse con async", res);
    window.location.reload();
  }

  async onDelete(id:number){
    let res = await this.ordenSvc.delete(id).toPromise();
    console.log(res);
    window.location.reload();
  }

  showNotification(){
    this.toastr.warning(' <div> <span>¿Desea cancelar esta orden?</span></div> <div> <button mat-raised-button color="warn"> Si</button> </div> ', 'Cancelar Orden', {
      timeOut: 5000,
      closeButton: true,
      enableHtml: true,
      toastClass: "alert alert-info alert-with-icon",
      positionClass: 'toast-' + 'top' + '-' + 'right'
    })
  }
  onSearchClear(){
    this.searchKey = '';
    this.applyFilter();
  }
  applyFilter(){
    this.dataSource.filter = this.searchKey.trim().toLowerCase();
  }

}
