import { HttpHandler, HttpInterceptor, HttpRequest } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { AuthService } from "src/app/pages/auth/auth.service";

@Injectable()
export class OrdenInterceptor implements HttpInterceptor{
    constructor(private authSvc:AuthService){

    }

    intercept(req:HttpRequest<any>, next: HttpHandler):Observable<any>{

        if(req.url.includes('ordenes')){
            const userValue = this.authSvc.userValue;  
            
            const authReq = req.clone({
                setHeaders:{
                    auth:userValue.token, 
                },
            });
            return next.handle(authReq)
        }
        return next.handle(req);
    }
}