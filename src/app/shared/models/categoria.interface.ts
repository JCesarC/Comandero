export interface Categoria{
    id:number;
    descripcion:string;
}

export interface CategoriaResponse{
    message:string;
    categoriaId:number;
    categoriaDescripcion:string;
}