export interface Cart{
    id:number;
    clienteId:number;
    nombre_cliente:string;
    productos_id:string;
    cantidad_productos:string;
    total:number;
    subtotal:string;
    productos:string;
}

export interface CartResponse{
    message:string;
    id:number;
    clienteId:number;
    nombre_cliente:string;
    productos_id:number;
    productos:string;
    cantidad_productos:string;
    subtotal:string;

}