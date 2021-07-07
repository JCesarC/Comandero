import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ClienteComponent } from './cliente.component';

const routes: Routes = [{ path: '', component: ClienteComponent }, { path: 'menu', loadChildren: () => import('./menu/menu.module').then(m => m.MenuModule) }, { path: 'cart', loadChildren: () => import('./cart/cart.module').then(m => m.CartModule) }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ClienteRoutingModule { }
