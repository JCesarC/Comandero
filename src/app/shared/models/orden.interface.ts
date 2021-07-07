export interface Orden{
    id:number;
    clienteId:number;
    nombre_cliente:string;
    mesa:string;
    productos:string;
    cantidad_productos:string;
    total:number;
    estado:string;
    fecha:string;
    hora:string;
}

export interface OrdenResponse{
    message:string;
    token:string;
    userId:number;
    role:number;
}