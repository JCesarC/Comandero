import { Injectable } from '@angular/core';
import { JwtHelperService } from '@auth0/angular-jwt';
import { HttpClient } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { ClienteResponse, Cliente} from 'src/app/shared/models/cliente.interface';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';

import { environment } from 'src/environments/environment';
import { throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';

const helper = new JwtHelperService;

@Injectable({
  providedIn: 'root'
})
export class SignupService {

  private cliente = new BehaviorSubject<ClienteResponse>(null!);
  isLogged:boolean = false;

  constructor(private http:HttpClient, private router:Router) {
      this.checkToken();
  }

  get cliente$():Observable<ClienteResponse>{
    return this.cliente.asObservable();
  }

  get clienteValue():ClienteResponse{
    return this.cliente.getValue();
  }

  login(authData:Cliente):Observable<ClienteResponse | void>{
    // this.isLogged = true;
    return this.http.post<ClienteResponse>(`${environment.API_URL}/signup/signupCliente`, authData)
    .pipe(
      map((cliente:ClienteResponse) =>{
        this.saveLocalStorage(cliente);
        this.cliente.next(cliente);
        
        return cliente;
      }),
      catchError((err) =>this.handleError(err))
    );
  }

  logout():void{
    localStorage.removeItem('cliente');
    localStorage.removeItem('productos');
    localStorage.removeItem('cantidad_productos');
    localStorage.removeItem('subtotal');
    localStorage.removeItem('carritoId');
    // this.isLogged = false;
    this.cliente.next(null!);
    this.router.navigate(['/signup']);
  }

  private checkToken():void{
    const cliente = JSON.parse(localStorage.getItem('cliente')!) || null;

    if(cliente){
      const isExpired = helper.isTokenExpired(cliente.token);

      if(isExpired){
        this.logout();
      }else{
        this.cliente.next(cliente);
      }
    }
  }

  private saveLocalStorage(cliente:ClienteResponse):void{
    const {id, message,...rest} = cliente;

    localStorage.setItem('cliente', JSON.stringify(rest));
  }

  private handleError(err:any):Observable<never>{
    let errorMessage = ' An error ocurred retrienvig data';
    if(err){
      errorMessage = `Error: code ${err.message}`;
    }
    window.alert(errorMessage);
    return throwError(errorMessage);
  }
}

