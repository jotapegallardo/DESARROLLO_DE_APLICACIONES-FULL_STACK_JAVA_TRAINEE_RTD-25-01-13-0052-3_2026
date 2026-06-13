/* 
1️⃣ ¿Qué es el DOM? (explicación simple)

El DOM (Document Object Model) es la forma en que JavaScript “ve” la página web.
📌 El HTML se transforma en un árbol de objetos, donde:

<html> es el nodo principal
<body>, <h1>, <p>, <button> son nodos hijos

👉 JavaScript puede:

Leer elementos
Cambiarlos
Eliminarlos
Crear nuevos


2️⃣ ¿Cómo accedemos al DOM?
JavaScript interactúa con el DOM (Document Object Model) a través del objeto document.

🧠 ¿Qué es el objeto document?

    * El objeto document es el puente entre el código HTML (lo que ves en la página web) y JavaScript.
    * Representa todo el contenido de la página: el HTML, los elementos, los atributos y el texto.

En resumen, document es como el “manejador” de todo lo que está en la página web.

🔍 ¿Cómo usamos document?

Con document, podemos seleccionar, leer y modificar los elementos del HTML de la página. 
Existen varias formas de acceder a los elementos del DOM, y aquí te voy a explicar las más comunes.
*/

//3️⃣ Seleccionar elementos del DOM
//============ Por ID (el más usado) ===========
//Selecionamos el elemento html por su id
const titulo = document.getElementById("titulo");
console.log(titulo);
console.log(titulo.textContent);//textContent método que me permite recuperar el texto

//titulo.textContent = "Otro mensaje";

const btnCambiarTitulo = document.getElementById("boton-cambiar-titulo");
console.log(btnCambiarTitulo);

btnCambiarTitulo.addEventListener("click", function(){
    /*👉 textContent Lee o modifica TODO el texto real del elemento,
    tal como está en el HTML, sin importar estilos. 

    ✅ Características
    Devuelve todo el texto
    Incluye texto oculto (display: none)
    No interpreta HTML
    Es más rápido
    Es el más recomendado para cambiar texto
    */
    //titulo.textContent = "¡Título cambiado con textContent!";


    /*La propiedad innerText de un nodo nos permite modificar su nodo de texto. 
    Es decir, acceder y/o modificar el contenido textual de algún elemento del DOM.
    
    👉 Lee o modifica SOLO el texto visible en pantalla.
    ✅ Características
    Respeta CSS (display:none)
    No muestra texto oculto
    Depende del renderizado
    Es más lento
    Se usa cuando importa lo que el usuario ve
    */
    titulo.innerText = "Nuevo texto con innerText";

});

//================ Por clase ==========
//Devuel una colección elementos, no un solo elementos
const textos = document.getElementsByClassName("texto");
console.log(textos);

const btnCambiarTextos = document.getElementById("boton-cambiar-parrafos");


btnCambiarTextos.addEventListener("click", function(){
    // for(let i=0; i < textos.length; i++){
    //     textos[i].classList.add("resaltar");
    // }

    for(let texto of textos){
        texto.style.color = "red";
        texto.style.backgroundColor = "blue";
        texto.style.fontSize = "30px";
    }
});

//================ Nombre de la etiqueta (tag) ===============
const parrafos = document.getElementsByTagName("p");
console.log(parrafos);

const btnCambiarTextos2 = document.getElementById("boton-cambiar-parrafos2");

btnCambiarTextos2.addEventListener("click", function(){
    for(let texto of textos){
        texto.style.color = "green";
        texto.style.fontSize = "50px";
        texto.style.backgroundColor = "orange";
    }
});

//============ Selecionar con querySelector ==============
//Busca el primer elemento que coincida con selector css

/*caracteristicas : 
- Usa selectores css
- Más flexible
- Más moderno
- Más facil de recordar

*/
document.querySelector("#titulo");//Selección por id
document.querySelector(".texto");// Selección por clase
document.querySelector("p");// Selección por nombre de la etiqueta

//Si no encuentra el elemento devuelve null

//============= Selecionar con querySelectorAll() =================
//Busca todos los elementos que coincidad con un selector css

/* 
Carasteristicas: 
- Devuelve un conjunto de nodos o un alista de nodos 
- permite iterar usando bucles, for, while, forEach
- Es más comodo de utilizar que getElementByTagName() y 
getElementsByClassName
*/

const parrafos3 = document.querySelectorAll(".texto");
const btnCambiarTextos3 = document.querySelector("#boton-cambiar-parrafos3");

btnCambiarTextos3.addEventListener("click", function(){
    parrafos3.forEach(parrafo => {
        parrafo.style.color = "blue";
        parrafo.style.fontSize = "120px";
    });
});


//Obtención y manipulación de textos y valores
const mensaje = document.querySelector("#mensaje");

mensaje.innerHTML = "<strong>Hola mundo!!<strong>"


//============ Recuperación desde inputs =================
//Paso 1, selecionar elementos
let numeroUno = document.querySelector("#num-uno");
let numerodos = document.querySelector("#num-dos");
let btnSumar = document.querySelector("#btn-mostrar-suma");
let resultado = document.querySelector("#resultado-suma");

//Paso 2, Darle funcionalidad al botón
btnSumar.addEventListener("click", function(){
    let resultadoSuma = Number(numeroUno.value) + Number(numerodos.value);
    console.log(resultadoSuma);

    resultado.textContent = `El resultado de la suma es ${resultadoSuma}`;
});
