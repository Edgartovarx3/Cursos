const mongoose = require("mongoose");// aqui es basicamente donde se toman las funciones que tiene mongoose en una constante llamada mongoose



const Conection=async()=>{
    try{// se añade un try catch por si existe un error al conectar la ejecucion no se detenga y 
        //de una respuesta mas clara del porque no se establecio la conexion

        await mongoose.connect("mongodb://127.0.0.1:27017/Blog");
        //apartir de la version 17  localhost no funciona
        console.log("Conexion establecida");

    }catch(error){
        console.log(error);
        throw new Error("No se establecion la conexion");
    }
}

    module.exports={ // esto se usa para exportar un  const para usarlo fuera,
        // por ejemplo este conection se llama en index.js
        Conection
    }
