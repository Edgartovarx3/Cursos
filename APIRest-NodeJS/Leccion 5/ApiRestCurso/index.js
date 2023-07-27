const{ Conection }=require("./Database/Conection");//se guarda la funcion en otra constante llamada Conection y se le indica la ruta de donde esta
const express=require("express");// se guardan las funciones de express
const cors=require("cors");//paquete para prevenir errores
 console.log("conectando la base de datos...");

Conection();// se llama el metodo


//----------------------Servidor de node-----------------------------------//

const app=express(); //todos los metodos para el servidor
const puerto=3900;
//configurar cors
app.use(cors());

//convertir body a objeto js
app.use(express.json());

//Crear rutas
app.get("/probando",(req,res)=>{
    console.log("Se ha ejecutado el endpoint probando");
return res.status(200).json({
    curso:"Master en nodejs",
    autor:"Goku",
    url:"www.facebook.com/104568395"
})
});

//Crear servidor y ver peticiones http

app.listen(puerto,()=>{
    console.log("Servidor corriendo en el puerto: "+puerto);
});
//--------------------------------------------.---------------------------//