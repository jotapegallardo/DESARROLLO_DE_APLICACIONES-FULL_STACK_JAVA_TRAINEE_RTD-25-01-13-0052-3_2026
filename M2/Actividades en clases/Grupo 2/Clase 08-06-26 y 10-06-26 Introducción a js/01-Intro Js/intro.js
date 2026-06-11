//============== INTRODUCCIÓN A JAVASCRIPT =============

//ESTO ES UN COMENTARIO DE UN LÍNEA

/* 
este 
es
un 
comentario
de
más
de
una
línea
*/

//======== Variables ==============
// Una variable en JavaScript es un espacio de memoria 
// con un nombre para almacenar datos que se pueden utilizar y modificar a lo largo del código.

// PARA DECLARAR VARIABLES 
// No deben contener espacios; se
// recomienda usar _ o camelCase.

var nombre_alumno;
var nombreAlumno;
var direccionAlumno;

//USAMOS EL = PARA ASIGNAR UN VALOR
nombreAlumno = "Pedro Salazar";

var nombreMascota = "Boby";
//Declaración de variables
// var: Era la forma tradicional de declarar variables en JavaScript, pero se ha vuelto
// menos común con la introducción de let y const.

var edad = 25;

/*
let: let permite declarar variables con alcance de bloque, es decir, solo existen dentro
del bloque donde se definen, como en funciones, bucles o condicionales.
pensemos en {   } como bloques
*/

let nombre = "Luis";/*

const: const se utiliza para declarar constantes, es decir,
variables que no pueden cambiar su valor una vez asignado. Al igual que let, const tiene
un alcance de bloque.
*/

const pi = 3.1416;
nombre = "Pedro";

//? Tipos de datos en Javascript https://www.w3schools.com/js/js_datatypes.asp


//==================== Funciones Nativas ==================

/*
Esta función se utiliza para imprimir mensajes en la consola del navegador o en la consola del
entorno de desarrollo. Es útil para realizar pruebas y depurar el código, ya que puedes imprimir
valores y mensajes para verificar el flujo de ejecución.
*/
console.log("Hola Mundo!!");//Imprime Hola mundo

/*
La función alert() muestra una ventana emergente en el navegador con un mensaje para el usuario.
Es útil para mostrar mensajes de advertencia, notificaciones o solicitar confirmación del usuario.
*/
alert("¡Hola, mundo!");

/*
La función confirm() muestra una ventana emergente en el navegador con un mensaje y botones de
confirmación ("Aceptar" y "Cancelar"). Es útil para obtener la confirmación del usuario en situaciones
específicas.
*/
confirm("¿Está seguro de eliminar este elemento?");

/*
El prompt en JavaScript es una función que muestra un cuadro de diálogo al usuario para solicitar una
entrada de datos. Proporciona una forma sencilla de obtener información del usuario a través de una
ventana emergente en el navegador.
*/
prompt("Por favor, ingrese su nombre:")

/*
Estas funciones se utilizan para convertir una cadena de texto en un número entero o de punto
flotante, respectivamente. Son útiles cuando se necesita manipular datos numéricos
ingresados como cadenas de texto.
*/
parseInt("10");
parseFloat("3.14");

//============== Concatenación ===============
let primerNombre; 
primerNombre = "Juan";

let primerApellido = "Perez";

let nombreCompleto = primerNombre + " " + primerApellido + " Salazar";

console.log(nombreCompleto);

//Interpolación
let nombreDos = "Juan";
let mensaje = `Hola, ${nombreDos}`;

console.log(mensaje);

//=============== expresiones aritméticas =============
let num1 = 5;
let num2 = 3;

let suma = num1 + num2;
console.log("La suma de num1 + num2 es igual a: " + suma);

let resta = num1 - num2;
console.log("La resta de num1 - num2 es igual a: " + resta);

let multiplicacion = num1 * num2;
console.log("La multiplicación de num1 * num2 es igual a: " + multiplicacion);

let division = num1 / num2;
console.log("La división de num1 / num2 es igual a: " + division);

let resto = num1 % num2;
console.log("La división modular de num1 % num2 es igual a: " + resto);

let exponente = num1 ** num2;
console.log("Exponente es igual a: " + exponente);

//=============== Operadores de incremento y decremento ============
/* 
En JavaScript, existen operadores especiales que
permiten aumentar (++) o disminuir (--) el valor de una
variable de forma abreviada, en lugar de escribir una
suma o resta manualmente.
Estos operadores son muy útiles en bucles y en
situaciones donde es necesario modificar el valor de
una variable de manera sencilla.
*/

let variable1 = 10;
variable1 = variable1 + 1;// Forma bareviada variable1 += 1500;
console.log(variable1);

variable1++;//Incrementando en 1
console.log(variable1);

variable1 = variable1 - 1;
console.log(variable1);

variable1--;
console.log(variable1);


//============ Operadores de asignación ==========
let num3 = 10;

num3 += 5; //15 ;  num3 = num3 + 5
console.log(num3);

num3 -= 3;//12
console.log(num3);

num3 *= 2;//24
console.log(num3);

num3 /= 4;//6   num3 = num3 / 4
console.log(num3);

num3 %= 2;//0   
console.log(num3);

//===================== Operadores Lógicos ==============
let v1 = 5; //number
let v2 = "5"; //String

/* 
Igualdad (==):
Compara si dos valores son iguales, sin tener en
cuenta el tipo de dato.
*/

//  un solo = asignación
let resultado = v1 == v2;
console.log(resultado);

/* 
Igualdad estricta (===):
Compara si dos valores son iguales, teniendo en
cuenta tanto el valor como el tipo de dato.
Devuelve true si son iguales en valor y tipo, y false
si no lo son.
*/

console.log(v1 === v2);


/* 
Desigualdad (!= o !==):
Compara si dos valores no son iguales. Devuelve
true si son diferentes y false si son iguales.
El operador !== también verifica el tipo de dato.
Tanto la comparación x != y como x !== y devuelven
true porque los valores son diferentes.
*/

let v3 = 10;//number
let v4 = "10";//String

console.log(v3 != v4);//false  
console.log(v3 !== v4);//true

let v5 = 5;
let v6 = 10;

console.log(v5 > v6);//false
console.log(v5 < v6);//true
console.log(v5 >= v6);//false
console.log(v5 <= v6);//true


/*
Operador AND (&&):
El operador AND devuelve true si ambos
operandos son true, y devuelve false en cualquier
otro caso.
El operador && se utiliza para evaluar dos
expresiones lógicas y devuelve true si ambas
expresiones son verdaderas.
*/

//? true (verdadero) && true (Verdadero)  ===> true (verdadero)
//? false (falso)    && true (Verdadero)  ===> false
//? false (falso)    && false (falso)   ===> false
//? true (Verdadero) && false (falso)   ===> false

let v7 = 5;
let v8 = 10;

//?          true  &&  false  ====> false
console.log(v7 > 0 && v8<0);//false

/* 
Operador OR (||):
El operador OR devuelve true si al menos uno
de los operandos es true, y devuelve false solo
si ambos operandos son false.
El operador || se utiliza para evaluar dos
expresiones lógicas y devuelve true si al menos
una de las expresiones es verdadera.
*/

//? true (verdadero) || true (Verdadero)  ===> true
//? false (falso)    || true (Verdadero)  ===> true
//? false (falso)    || false (falso)   ===> false
//? true (Verdadero) || false (falso)   ===> true

let v7 = 5;
let v8 = 10;
//           false  ||  false   =====>  false    
console.log(v7 < 0 || v8 < 0);//

/*
Operador NOT (!):
El operador NOT invierte el valor de una expresión
booleana. Si la expresión es true, el operador NOT
devuelve false, y si la expresión es false, el operador
NOT devuelve true.
El operador ! se utiliza para negar una expresión
lógica. Convierte true en false y viceversa.
*/

console.log(!(v7 > 0));

//================ Sentencias condicionales ==============
/* 
Sentencia if-else:
La sentencia if-else es una estructura de control en programación que permite tomar
decisiones basadas en una condición. A diferencia de la sentencia if, que ejecuta un
bloque de código si una condición es verdadera y luego continúa con el resto del
programa, la sentencia if-else permite ejecutar un bloque de código si la condición es
verdadera y otro bloque de código si la condición es falsa.
*/

let v9 = 15;

if (v9 < 0) {
    console.log("Hola Mundo!!");
} 

let hora = 10;

if (hora < 12) {
    console.log("Buenos días");
}else{
    console.log("Buenas tardes");
}


let fruta = "Manzana";

if (fruta == "Platano"){
    console.log("El valor del platano es de $1200");
}
else if (fruta == "Sandía"){
    console.log("El valor del la Sandía es de $4200");
}
else if (fruta == "Manzana"){
    console.log("El valor del la Manzana es de $2200");
}
else{
    console.log("No contamos con la fruta que esta buscando.");
}

/* 
Operador AND (&&) con IF/ELSE:
El operador && devuelve true si ambas condiciones
son verdaderas. Si alguna de las condiciones es
falsa, devuelve false.
La condición dentro del if utiliza el operador &&
para verificar si la edad es mayor o igual a 18 y si
tiene Licencia es true. Si ambas condiciones son
verdaderas, se muestra el mensaje "puedes
conducir legalmente". Si alguna de las condiciones
es falsa, se muestra el mensaje "No cumples con
los requisitos para conducir".
*/

let edadConductor = 25;
let tieneLicencia = false;

if (edadConductor >= 18 && tieneLicencia){//tieneLicencia == true
    console.log("Puedes conducir legalmente");
}else{
    console.log("No puedes conducir legalmente");
}

/* 
Operador OR (||) con IF/ELSE:
El operador || devuelve true si al menos una de las
condiciones es verdadera. Solo devuelve false si
ambas condiciones son falsas.
La condición dentro del if utiliza el operador || para
verificar si esEstudiante es true o si esEmpleado es
true. Si al menos una de las condiciones es
verdadera, se muestra el mensaje "Tenes acceso a
descuentos especiales". Si ambas condiciones son
falsas, se muestra el mensaje "No tenes acceso a
descuentos especiales".
*/


let esEstudiante = false;
let esEmpleado = false;

if (esEstudiante || esEmpleado){
    console.log("Tienes acceso a descuentos");
}else{
    console.log("No tienes acceso a descuentos");
}


/* Switch
La sentencia switch en JavaScript es una estructura de control condicional 
que permite ejecutar diferentes bloques de código basándose en el valor de 
una expresión, sirviendo como una alternativa más organizada y 
legible a múltiples if...else if anidados, evaluando una variable y 
comparándola con varios case (casos), ejecutando el bloque del caso 
coincidente y un default (predeterminado) opcional si no hay coincidencias, 
siendo clave la sentencia break para evitar la "caída" (ejecución de casos posteriores). 

*/

let fruta2 = "Platanos";

switch (fruta2) {
    case "Naranjas":
        console.log("El valor del las Naranjas es de $2200");
        break;//NO OLVIDAR PONER EL BREAK ¡¡IMPORTANTE!!

    case "Platanos":
        console.log("El valor del los Platanos es de $1500");
        break;

    case "Manzanas":
        console.log("El valor del las Manzanas es de $900");
        break;

    case "Cerezas":
        console.log("El valor del las Cerezas es de $1900");
        break;
    
    default:
        console.log(`No contamos con la fruta que esta buscando (${fruta2}).`);
}

let opcion = 2;

switch (opcion) {
    case 1:
        console.log("Menú 1");
        break;
    case 2:
        console.log("Menú 2");
        break;
    case 3:
        console.log("Menú 3");
        break;

    default:
        console.log("Opción de menú no válida");
}


//============ Operador ternario ==============

let num7 = 10;
let num8 = 25;

let respuesta = num7 < num8 ? "el 1" : "el 2";
console.log(respuesta);

/* COMPARACIÓN DE OPERADOR TERNARIO CON IF ELSE 

let resultado;

if (num7 < num8) {
    resultado = "el 1";
}else {
    resultado = "el 2";
}

*/