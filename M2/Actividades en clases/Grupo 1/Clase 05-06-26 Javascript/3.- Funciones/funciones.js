//                      PARAMETROS
function saludarUsuario(nombre, edad){
    console.log(`¡Hola ${nombre} tienes ${edad} años!`);
}


saludarUsuario("Luis", 37);

let nombrePersona = "Anna";
let edad = 32;

saludarUsuario(nombrePersona, edad);


function sumaTresNumeros(num1, num2, num3){
    /*
    
    */
    let suma = num1 + num2 + num3;
    return suma;
}

console.log(sumaTresNumeros(10, 20, 30))


let edad1 = 21;
let edad2 = 35;
let edad3 = 48;

let resultado = sumaTresNumeros(edad1, edad2, edad3);
console.log(`Resultado es igual a : ${resultado}`);


//Ejmeplo:
//Crear una función que reciba un arreglo de estudiantes (nombre y nota)
//y muestre solo los que tienen nota mayor o igual a 6.0

function mostrarAprobados(estudiantes){
    for(let estudiante of estudiantes){
        if(estudiante.nota >= 6){
            console.log(estudiante.nombre + " está aprobado con nota " + estudiante.nota);
        }
    }
}


let alumnos = [
    {nombre: "Ana", nota:6.5},
    {nombre: "Pedro", nota:5.4},
    {nombre: "Juan", nota:5.6},
];

mostrarAprobados(alumnos);

alumnos.push({
nombre: "Luis", 
nota:3
});

console.log(alumnos);