import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClientModule, HttpClient} from '@angular/common/http';
import { BehaviorSubject, Observable, throwError } from 'rxjs';
import { UserResponse, User, Roles } from 'src/app/shared/models/user.interface';
import { catchError, map } from 'rxjs/operators';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Router } from '@angular/router';

const helper = new JwtHelperService;


@Injectable({
  providedIn: 'root'
})
export class AuthService {

  // private loggedIn = new BehaviorSubject<boolean>(false);
  // private role = new BehaviorSubject<Roles>(null!) ;
  // private userToken = new BehaviorSubject<string>(null!);

  private user = new BehaviorSubject<UserResponse>(null!);


  constructor(private http:HttpClient, private router: Router ) { 
    this.checkToken();
  }

  get user$():Observable<UserResponse>{
    return this.user.asObservable();
  }

  get userValue():UserResponse{
    return this.user.getValue();
  }
  

  // get isLogged():Observable<boolean>{
  //   return this.loggedIn.asObservable();
  // }
  // get isAdmin$():Observable<string>{
  //   return this.role.asObservable();
  // }

  // get userTokenValue():string{
  //   return this.userToken.getValue();
  // }

  login(authData:User): Observable<UserResponse | void>{
    return this.http.post<UserResponse>(`${environment.API_URL}/auth/login`, authData)
    .pipe(
      map( (user:UserResponse) => {
        //console.log('Res->', res);
        this.saveLocalStorage(user);
        this.user.next(user);
        // this.loggedIn.next(true);
        // this.role.next(user.role);
        // this.userToken.next(user.token)

        return user;
      }),
      catchError((err) => this.handlerError(err))
    );
  }

  logout():void{
    localStorage.removeItem('user');
    // this.loggedIn.next(false);
    // this.role.next(null!);
    // this.userToken.next(null!); 

    this.user.next(null!);
    //set userIsLogged = false
    this.router.navigate(['/login']);
  }

  private checkToken():void{


    const user = JSON.parse(localStorage.getItem('user')!) || null;
   
    if(user){
      const isExpired = helper.isTokenExpired(user.token);
      
      if(isExpired){
        this.logout();
      }else{
        this.user.next(user);
        // this.loggedIn.next(true);
        // this.role.next(user.role);
        // this.userToken.next(user.token); 
      }
    }
    

    //console.log('isExpired->', isExpired);
    //set UserisLogged = true or false
    //isExpired ? this.logout() : this.loggedIn.next(true);
    

    // if(isExpired){
    //   this.logout();
    // }else{
    //   this.loggedIn.next(true);
    // }
  }
  private saveLocalStorage(user:UserResponse):void{
    //localStorage.setItem('token', token);
    //console.log(user);
    const {userId, message, ...rest} = user;
    localStorage.setItem('user', JSON.stringify(rest));

  }
  private handlerError(err:any):Observable<never>{
    let errorMessage = ' An error ocurred retrienving data';
    if(err){
      errorMessage= `Error: code ${err.message}`;
    }
    window.alert(errorMessage);
    return throwError(errorMessage);  
  }
}
