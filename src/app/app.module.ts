import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HeaderComponent } from './shared/components/header/header.component';
import { FooterComponent } from './shared/components/footer/footer.component';
import { MaterialModule } from '../app/material.module';
import { HttpClient, HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { OrdenInterceptor } from './shared/interceptors/orden-interceptor';
import { ClienteInterceptor } from './shared/interceptors/cliente-interceptor';
import { ComponentsModule } from './shared/components/components.module';
import { ToastrModule } from 'ngx-toastr';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MaterialModule,
    HttpClientModule,
    ComponentsModule,
    FormsModule,
    ToastrModule.forRoot(),
    SweetAlert2Module.forRoot()
  ],
  exports:[
    HeaderComponent
  ],
  providers: [
    {provide:HTTP_INTERCEPTORS, useClass:OrdenInterceptor, multi:true},
    
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
