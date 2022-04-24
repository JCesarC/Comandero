import { AfterViewInit } from '@angular/core';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { takeUntil } from 'rxjs/operators';
import { AuthService } from 'src/app/pages/auth/auth.service';
import { SignupService } from 'src/app/pages/auth/signup.service';
import { UserResponse } from '../../models/user.interface';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit, OnDestroy, AfterViewInit{
  
  private destroy$ = new Subject<any>();
  user='';
  isAdmin :any = null;
  isLogged=false;
  isLoggedCliente = false;
  constructor(private authSvc:AuthService, private signup:SignupService) { }


  ngAfterViewInit(): void {
    let cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    if(cliente){
      this.isLoggedCliente = true;
    }else{
      this.isLoggedCliente = false;
    }
  }
  

  ngOnInit(): void {

    let cliente = JSON.parse(localStorage.getItem('cliente')!) || null;
    if(cliente){
      this.isLoggedCliente = true;
    }else{
      this.isLoggedCliente = false;
    }

    let user = JSON.parse(localStorage.getItem('user')) || null;
    if(user !== null){
      this.isLogged = true;
    }else{
      this.isLogged = false;
    }
    
    this.authSvc.user$
    .pipe(takeUntil(this.destroy$))
    .subscribe((user:UserResponse)=>{
      
      this.isAdmin= user?.role;
    });

    console.log("Cliente", this.isLoggedCliente);

    // this.authSvc.isAdmin$
    // .pipe(takeUntil(this.destroy$))
    // .subscribe((res)=> (this.isAdmin = res));
    
  }
  ngOnDestroy(): void {
    //this.subscription.unsubscribe();

    this.destroy$.next({});
    this.destroy$.complete();
  }

  onLogout(): void{
    
      this.authSvc.logout(); 

    
  }

  onLogoutCliente():void{
    this.signup.logout();
    this.isLoggedCliente = false;
  }
}
