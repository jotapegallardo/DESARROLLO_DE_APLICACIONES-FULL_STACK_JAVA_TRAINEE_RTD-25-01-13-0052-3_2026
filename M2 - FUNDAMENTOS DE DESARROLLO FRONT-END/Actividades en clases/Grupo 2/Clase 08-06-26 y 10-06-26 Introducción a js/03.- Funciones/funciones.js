/*
Una función en JavaScript es un bloque de código reutilizable 
diseñado para realizar una tarea específica o calcular un valor. 
Te permite empaquetar instrucciones lógicas que puedes ejecutar 
cuando las necesites, evitando repetir código en tu programa.
*/

function saludar(){
    console.log(`¡Hola usuario bienvenido!`);
}

saludar();
saludar();
saludar();
saludar();
saludar();
saludar();
saludar();

function saludarConNombre(nombre, edad){
    /*
    DOCUMENTAR
    */    
    console.log(`¡Hola ${nombre} usuario bienvenido tu edad es ${edad}!`);
}

saludarConNombre("Ana", 34);
saludarConNombre("Luis", 37);

let nom = "Ricardo";
let ed = 39;

saludarConNombre(nom, ed);


//Funciones con retorno
function sumarTresNumeros(num1, num2, num3){
    let resultadoSuma = num1 + num2 + num3;
    return resultadoSuma;
}

let resultadoSumaTres = sumarTresNumeros(10, 20, 30);
console.log(resultadoSumaTres);