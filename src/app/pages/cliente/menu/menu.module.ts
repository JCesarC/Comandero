import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { MenuRoutingModule } from './menu-routing.module';
import { MenuComponent } from './menu.component';
import { MaterialModule } from 'src/app/material.module';
import { ToastrModule } from 'ngx-toastr';

@NgModule({
  declarations: [
    MenuComponent
  ],
  imports: [
    CommonModule,
    MenuRoutingModule,
    MaterialModule,

  ]
})
export class MenuModule { }
