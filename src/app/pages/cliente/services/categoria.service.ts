import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { Categoria } from 'src/app/shared/models/categoria.interface';
@Injectable({
  providedIn: 'root'
})
export class CategoriaService {

  constructor(private http:HttpClient) {
      
   }

  getAll():Observable<Categoria[]>{
    return this.http
    .get<Categoria[]>(`${environment.API_URL}/categorias`)
    .pipe(catchError(this.handleError));
  }

  getById(categoriaId:number):Observable<Categoria>{
    return this.http.get<any>(`${environment.API_URL}/categorias/${categoriaId}`)
    .pipe(catchError(this.handleError));
  }

  new(categoria:Categoria):Observable<any>{
    return this.http
    .post<Categoria>(`${environment.API_URL}/categorias`, categoria)
    .pipe(catchError(this.handleError));
  }

  update(categoriaId:number, categoria:Categoria):Observable<Categoria>{
    return this.http
    .patch<Categoria>(`${environment.API_URL}/categorias/${categoriaId}`, categoria)
    .pipe(catchError(this.handleError));
  }
  
  delete(categoriaId:number):Observable<{}>{
    return this.http
    .delete<Categoria>(`${environment.API_URL}/categorias/${categoriaId}`)
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
