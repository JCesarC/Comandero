import { Component, OnInit } from '@angular/core';
import { AuthService } from '../auth.service';
import { FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { SignupService } from '../signup.service';

interface Mesa{
  value:string;
  viewValue:string;
}

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})
export class SignupComponent implements OnInit, OnDestroy  {

  selectedValue:string | undefined;
  
  mesas: Mesa[]=[
    {value:'MESA-1', viewValue:'Mesa 1'},
    {value:'MESA-2', viewValue:'Mesa 2'},
    {value:'MESA-3', viewValue:'Mesa 3'},
    {value:'MESA-4', viewValue:'Mesa 4'},
    {value:'MESA-5', viewValue:'Mesa 5'},
    {value:'MESA-6', viewValue:'Mesa 6'},
    {value:'MESA-7', viewValue:'Mesa 7'},
    {value:'MESA-8', viewValue:'Mesa 8'},
    {value:'MESA-9', viewValue:'Mesa 9'},
    {value:'MESA-10', viewValue:'Mesa 10'},
    {value:'MESA-11', viewValue:'Mesa 11'}
  ];
  

  private subscription: Subscription = new Subscription();

  loginForm = this.fb.group({
    nombre:[''],
    mesa:[''],  
  });

  constructor(private signS:SignupService, private fb: FormBuilder, private router: Router) { }

  ngOnInit(): void {

  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
   }

  onLogin():void{
    
    const formValue = this.loginForm.value;

    console.log(formValue);
    
    this.subscription.add(
      this.signS.login(formValue).subscribe((res)=>{
        if(res){
          this.router.navigate(['/cliente/menu']);
        }
      })
    );
  }


}
