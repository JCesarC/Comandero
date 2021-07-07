import { Injectable } from "@angular/core";
import { HttpHandler, HttpInterceptor, HttpRequest } from "@angular/common/http";
import { SignupService } from "src/app/pages/auth/signup.service";
import { Observable } from "rxjs";


@Injectable()
export class ClienteInterceptor implements HttpInterceptor{
    constructor(private sign:SignupService){

    }

    intercept(req:HttpRequest<any>, next: HttpHandler):Observable<any>{
        if(req.url.includes('signup')){
            const clienteValue = this.sign.clienteValue;
            
            const authReq = req.clone({
                setHeaders:{
                    auth:clienteValue.token,
                },
            });
            return next.handle(authReq);
        }
        return next.handle(req);
    }
}