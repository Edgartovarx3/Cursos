function promesa(){
    var saludar=new Promise((resolve,reject)=>{ //Se crea la promesa con dos respuestas de variables, una en caso de que sea correcta y
        //en otro en caso de que sea rechazada o falsa
        setTimeout(()=>{// el setTimeout es para generar una respuesta con un intervalo de tiempo que en este caso es 2000 o 2 segundos
            let saludo="Hola"; //estaes en caso de que sea resolve
            //saludo=false; y esta en caso de ser rechazada o falsa ya que se basa sen si el resultado es falso es reject
            if(saludo){
                resolve(saludo);

            }else{
                reject("No hay saludo disponible");
            }
        });

    },2000);//aqui esta el tiempo asignado al timeout

    saludar.then(resultado=>{// el then es para obtener el resultado positivo de la promesa y la almacena en resultado
       console.log(resultado);
    }).catch(err=>{// el catc  obtiene el resultado false o negativoo sea el reject de la promesa
        console.log(err);
    });
}
promesa();

