import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ClienteRoutingModule } from './cliente-routing.module';
import { ClienteComponent } from './cliente.component';
import { ModalClienteComponent } from './components/modal-cliente/modal-cliente.component';
import { MaterialModule } from 'src/app/material.module';



@NgModule({
  declarations: [
    ClienteComponent,
    ModalClienteComponent
  ],
  imports: [
    CommonModule,
    ClienteRoutingModule,
    MaterialModule,


  ]
})
export class ClienteModule { }
