import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Producto} from 'src/app/shared/models/producto.interface'


@Injectable({
  providedIn: 'root'
})
export class MenuService {

  constructor(private http:HttpClient) { 

  }

  getAll():Observable<Producto[]>{
    return this.http
    .get<Producto[]>(`${environment.API_URL}/productos`)
    .pipe(catchError(this.handleError));
  }

  getById(productoId:number):Observable<Producto>{
    return this.http.get<any>(`${environment.API_URL}/productos/${productoId}`)
    .pipe(catchError(this.handleError));
  }

  new(producto:Producto):Observable<any>{
    return this.http
    .post<Producto>(`${environment.API_URL}/productos`, producto)
    .pipe(catchError(this.handleError));
  }

  update(productoId:number, producto:Producto):Observable<Producto>{
    return this.http
    .patch<Producto>(`${environment.API_URL}/productos/${productoId}`, producto)
    .pipe(catchError(this.handleError));
  }
  
  delete(productoId:number):Observable<{}>{
    return this.http
    .delete<Producto>(`${environment.API_URL}/ordenes/${productoId}`)
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
