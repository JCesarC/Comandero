export interface Producto{
    id:number;
    descripcion:string;
    precio:number;
    cantidad:number;
    categoria:number;
    categoriaDescripcion:string;
}
export interface ProductoResponse{
    message:string;
    productoId:number;
    precio:number;
    categoriaDescripcion:string;
}