import { ResolveStart } from "@angular/router";
export type Roles = 'ADMIN' | 'CLIENTE';

export interface User{
    username: string;
    password: string;
}

export interface UserResponse{
    message: string;
    token: string;
    userId: number;
    role: Roles;
}

