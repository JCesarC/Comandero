import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { OrdenesRoutingModule } from './ordenes-routing.module';
import { OrdenesComponent } from './ordenes.component';
import { MaterialModule } from 'src/app/material.module';
import {MatSortModule} from '@angular/material/sort';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import {MatPaginatorModule} from '@angular/material/paginator';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
@NgModule({
  declarations: [
    OrdenesComponent
  ],
  imports: [
    CommonModule,
    OrdenesRoutingModule,
    MatSortModule,
    ReactiveFormsModule,
    FormsModule,
    MaterialModule,  MatPaginatorModule,
    SweetAlert2Module.forRoot()
  ]
})
export class OrdenesModule { }
