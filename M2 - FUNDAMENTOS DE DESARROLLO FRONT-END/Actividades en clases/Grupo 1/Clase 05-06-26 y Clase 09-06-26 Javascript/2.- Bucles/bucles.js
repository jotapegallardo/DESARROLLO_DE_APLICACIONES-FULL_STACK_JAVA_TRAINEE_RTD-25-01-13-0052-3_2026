/*
Los bucles (o ciclos) en JavaScript son estructuras que permiten ejecutar un bloque de código repetidamente 
mientras se cumpla una condición específica. Ayudan a automatizar tareas repetitivas y a procesar colecciones 
de datos de forma eficiente.
*/

//1. Bucle for

/*
    for(inicio; condición; incremento/decremento) {
        código que se repite
    }
*/

//   INICIO ; CONDICION ; INCREMENTO O DECREMENTO
for(let i=1; i<=10; i++){
    console.log(i);
}

//2. Bucle while

let contador = 0;
while(contador <= 5){
    console.log("El valor de contador es " + contador);
    contador++;
}

/*
El bucle while(true) en JavaScript crea un ciclo infinito que ejecuta 
su bloque de código indefinidamente. Como la condición siempre es verdadera, 
requiere una instrucción como break para detener la ejecución; de lo contrario, 
el navegador o entorno de servidor se bloqueará.
*/

/*
while (true) {
    if (condicionParaSalir) {
        break;
    }
}
*/

let menu = false;
while(true){
    if (menu){
        break;
    }
    console.log("El valor de contador es " + contador);
    menu = true;
}

//3. Bucle do...while
/*
Similar al while, pero garantiza que el bloque de código se ejecute al menos una vez, 
ya que la condición se evalúa después de la primera ejecución.
*/

let cont = 6

do{
    console.log("El valor de contador es " + cont);
    cont++
}while(cont<=5);

//Menú
do{
    //1° Capturar lo que ingrese el usuario
    let opcion = prompt(
        "Eliga una opción \n" +
        "1) Sumar \n" +
        "2) Restar \n" +
        "3) Multiplicar \n" +
        "4) Dividir \n" +
        "5) Modulo \n" +
        "6) Salir"
    );

    switch(opcion){
        case "1":
            console.log("Resultado num1 + mun2 :" + (num1 + num2));
            break;
        case "2":
            console.log("Resultado num1 - mun2 :" + (num1 - num2));
            break;
        case "3":
            console.log("Resultado num1 * mun2 :" + (num1 * num2));
            break;
        case "4":
            console.log("Resultado num1 / mun2 :" + (num1 / num2));
            break;
        case "5":
            console.log("Resultado num1 % mun2 :" + (num1 % num2));
            break;
        default:
            console.log("La opción ingresada no es correcta");
    }

}while(opcion != 6);

//Arreglos (Array)
/*
Un array (también conocido como arreglo o vector) es una estructura de 
datos fundamental en programación que permite almacenar una colección 
de elementos bajo un mismo nombre de variable.
*/

//                     0        1       2
let nombresAlumnos = ["Ana", "Pedro", "Juan"];
//            0   1  2   3   4   5   
let numero = [0, 20, 30, 40, 50, 60];

console.log(nombresAlumnos[2]);

let largoArray = numero.length;//length nos permite recuperar la cantidad de elementos del array
console.log(largoArray);


let frutas = ["Manzana", "Frutilla", "Plátano", "Sandía", "Naranja"];

/* NO ES LO CORRECTO
console.log(frutas[0]);
console.log(frutas[1]);
console.log(frutas[2]);
console.log(frutas[3]);
console.log(frutas[4]);
console.log(frutas[5]);*/

for (let indice = 0; indice < frutas.length; indice++){
    console.log(`Fruta ${frutas[indice]} en el indice ${indice}`);
}


console.log("========= Recorriendo Frutas con While =============");
let contador2 = 0;
while (contador2 < frutas.length) {
    console.log("Fruta " + frutas[contador2] + " en el indice " + contador2);
    contador2++;
}

//otra forma de recorrer los elementos de un array
let colores = ["Azul", "Rojo", "Verde", "Amarillo", "Celeste"];

for(let color of colores){
    console.log(color);
}

//================= Métodos de Js para trabajar con arrays ====================

//1.- Métodos para agregar y quitar elementos
let numeros2 = [1, 4, 8, 54, 108, 96];
console.log(numeros2);

//push() --> agregar un elememto al final del array
numeros2.push(125);
console.log(numeros2);

//pop() --> elimina el último elemento del array
numeros2.pop();
console.log(numeros2);

numeros2.pop();
console.log(numeros2);

//unshif() --> agrega un elemento al inicio
numeros2.unshift(82);
console.log(numeros2);

//shif() --> elimina el primer elemento
numeros2.shift();
console.log(numeros2);


//2.- Métodos para recorrer un array
let frutas2 = ["Manzana", "Frutilla", "Plátano", "Sandía", "Naranja"];

//forEach() -> recorre sin devolver un nuevo array
frutas2.forEach(function(fruta) {
    console.log(fruta);
});

//map() -> transforma elementos y devuelve un nuevo array
let numeros2 = [2,4,6,8,10];

let dobles = numeros2.map(function(numero){
    return numero * 2;
});
console.log(dobles);

//filter() -> filtra elementos
let notas = [5.5, 4.3, 6, 4.9, 6.8, 7, 3.2, 2, 3.9];
console.log(notas);
let aprobados = notas.filter(function(nota){
    return nota >= 4;
});
console.log(aprobados);

//🔹 find() → busca el primer elemento que cumpla condición
let edades = [12, 15, 18, 20];

let mayor = edades.find(function(edad) {
    return edad >= 18;
});

console.log(mayor); // 18

//3️⃣ Métodos para REDUCIR datos
let numeros4 = [1, 2, 3, 4];

let suma = numeros4.reduce(function(total, num) {//🧠 Ideal para sumas, promedios, totales
    return total + num;
}, 0);

console.log(suma); // 10

//4️⃣ Métodos para BUSCAR información
//🔹 includes() → verifica si existe un valor
let colores2 = ["Rojo", "Azul", "Verde"];
console.log(colores2.includes("Azul")); // true

//🔹 indexOf() → posición del elemento
console.log(colores.indexOf("Verde")); // 2

//5️⃣ Métodos para ORDENAR y REVERTIR
//🔹 sort() → ordena (¡ojo con números!)
let numeros5 = [3, 1, 10, 2];

numeros5.sort(function(a, b) {
    return a - b;
});

console.log(numeros5); // [1, 2, 3, 10]
/*
❗ ¿Qué pasó?
Por defecto, sort() ordena como texto, no como números.
Es decir:

"10" va antes que "2" porque "1" es menor que "2" al comparar letras.
👉 Por eso necesitamos decirle a JavaScript cómo comparar números.


La función le dice a JavaScript cómo decidir el orden entre dos valores.

🔍 ¿Qué son a y b?
a = un número del arreglo
b = otro número del arreglo

JavaScript va tomando pares de números y los compara.
Ejemplo de pares posibles:

(3, 1)
(1, 10)
(10, 2)

etc.


🧮 ¿Qué significa return a - b?

El resultado de la resta le indica a sort() qué hacer:

Resultado	Significado	Orden
Negativo	a es menor que b	a va antes
Positivo	a es mayor que b	b va antes
0	        Son iguales	        No cambia

*/

//🔹 reverse() → invierte el orden
numeros5.reverse();
console.log(numeros5);

//6️⃣ Métodos para COPIAR o EXTRAER

//🔹 slice() → copia una parte
/* 
🧠 Regla fundamental de slice(inicio, fin)
👉 slice() copia desde la posición inicio
👉 hasta la posición fin, pero SIN incluir fin
📢 El segundo número NO se incluye
*/
let letras = ["a", "b", "c", "d"];

let copia = letras.slice(1, 3);

console.log(copia); // ["b", "c"]

//🔹 splice() → elimina o agrega en cualquier posición
let frutas3 = ["Manzana", "Plátano", "Naranja"];
frutas3.splice(1, 1); // elimina 1 desde la posición 1
console.log(frutas3); // ["Manzana", "Naranja"]

//7️⃣ Métodos para UNIR y CONVERTIR
//🔹 join() → convierte array en texto
let palabras = ["Hola", "mundo"];
let frase = palabras.join(" ");
console.log(frase); // "Hola mundo"

//🔹 concat() → une arrays
let a = [1, 2];
let b = [3, 4];

let unido = a.concat(b);
console.log(unido); // [1, 2, 3, 4]

//Objetos (objetos literales no POO, como variable)
let user = {
    nombres: "Sofía Reyes", 
    edad: 12, 
    direccion: "av siempre viva 1234"
};

console.log("Nombre de usuario: " + user.nombres);
console.log("Edad: " + user.edad);
console.log("Dirección: " + user.direccion);

user.edad = 13;

console.log("La nueva edad de " + user.nombres + " es: " + user.edad);

let usuarios = [
    {
        nombre: "Ana", 
        edad: 34
    },
    {
        nombre: "Pedro",
        edad: 28
    },
    14,
    "Hola munda"    
];

console.log(usuarios[1].nombre);


