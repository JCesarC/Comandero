export interface OrdenN{
    
    clienteId:number;
    nombre_cliente:string;
    mesa:string;
    productos:string;
    cantidad_productos:string;
    fecha:String;
    hora:string;

    //createdAt:
}

export interface OrdenNiResponse{
    message:string;
    token:string;
    userId:number;
    role:number;
}