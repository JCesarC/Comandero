import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Orden } from 'src/app/shared/models/orden.interface';
import { OrdenN } from 'src/app/shared/models/ordenN.interface';

import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class OrdenesService {

  constructor(private http:HttpClient) { 
    
  }

  
  
  getAll():Observable<Orden[]>{
    return this.http
    .get<Orden[]>(`${environment.API_URL}/ordenes`)
    .pipe(catchError(this.handleError));
  }

  getById(ordenId:number):Observable<Orden>{
    return this.http.get<any>(`${environment.API_URL}/ordenes/${ordenId}`)
    .pipe(catchError(this.handleError));
  }

  new(orden:OrdenN):Observable<any>{
    return this.http
    .post<Orden>(`${environment.API_URL}/nuevaorden`, orden)
    .pipe(catchError(this.handleError));
  }

  update(ordenId:number, orden:Orden):Observable<Orden>{
    return this.http
    .patch<Orden>(`${environment.API_URL}/ordenes/${ordenId}`, orden)
    .pipe(catchError(this.handleError));
  }
  
  delete(ordenId:number):Observable<{}>{
    return this.http
    .delete<Orden>(`${environment.API_URL}/ordenes/${ordenId}`)
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

