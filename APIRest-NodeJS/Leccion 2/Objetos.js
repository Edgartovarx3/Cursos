
function Objetos() {
    var Pokemon = {// asi se crea un objeto dentro de javascript
        nombre: "Pikachu",
        elemento: "Electricidad",
        ps: 600,
        ataque: 200,
        MostrarTodo() {// esta es una funcion asignada dentro del mismo objeto
            console.log( this.nombre, this.elemento, this.ps, this.ataque);

        },
        Descripcion: "Si es un pokemon :u"

    }
   Pokemon.MostrarTodo();// aqui se llama la funcion para mostrar los datos de este objeto
}
Objetos();
