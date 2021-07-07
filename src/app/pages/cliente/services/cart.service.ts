import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Cart } from 'src/app/shared/models/cart.interface';
import { environment } from 'src/environments/environment';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { CartI } from 'src/app/shared/models/CartI.interface';
import { ProductoU } from 'src/app/shared/models/productU.interface';


@Injectable({
  providedIn: 'root'
})
export class CartService {

  constructor(private http:HttpClient) { 

  }

  getAll():Observable<Cart[]>{
    return this.http
    .get<Cart[]>(`${environment.API_URL}/carritos`)
    .pipe(catchError(this.handleError));
  }

  getCart(cart:CartI):Observable<any>{
    return this.http
    .post<Cart>(`${environment.API_URL}/cart`, cart)
    .pipe(catchError(this.handleError)); 
  }

  deleteProducto(cartId:number, cart:Cart){
    return this.http
    .patch<Cart>(`${environment.API_URL}/cart/${cartId}`, cart)
  }


  getById(carritoId:number):Observable<Cart>{
    return this.http.get<any>(`${environment.API_URL}/carritos/${carritoId}`)
    .pipe(catchError(this.handleError));
  }

  new(producto:Cart):Observable<any>{
    return this.http
    .post<Cart>(`${environment.API_URL}/carritos`, producto)
    .pipe(catchError(this.handleError));
  }

  update(carritoId:number, producto:ProductoU):Observable<Cart>{
    return this.http
    .patch<Cart>(`${environment.API_URL}/carritos/${carritoId}`, producto)
    .pipe(catchError(this.handleError));
  }
  
  delete(carritoId:number):Observable<{}>{
    return this.http
    .delete<Cart>(`${environment.API_URL}/carritos/${carritoId}`)
    .pipe(catchError(this.handleError));
  }

  handleError(error:any):Observable<never>{
    let errorMessage = "Error unknow";
    if(error){
      errorMessage = `Error ${error.message}`;
    }
    window.alert(errorMessage);
    return throwError(errorMessage);
  }

}
