//Selectores
/*
1.- Por ID
    $("#titulo")

2.- Por Clase
    $(".item")

3.- Por etiqueta 
    $("p"), $("li"), $("input")
    
4.- Jerarqui
    Hijo Directo : $("#lista > li")
    Hermanos adyacentes: $("h2 + p")

5.- Selecionar el elemento actual en un evento
$(this) ej: dentro de un evento .on("click"

*/


/* 
Función show()
La función show() muestra un elemento del DOM.
Suponiendo que se encuentre oculto mediante css
(display:none), al seleccionarlo con JQuery y
ejecutar show(), el elemento aparecerá en la
pantalla.
*/
$("#btn1").on("click", function() {
    console.log("Evento click");
    $("p.texto").show(2000);
});

/* 
Función hide()
La función hide() es la inversa a show. Suponiendo
que se encuentre visible mediante css, al
seleccionarlo con JQuery y ejecutar hide(), el
elemento desaparecerá de la pantalla.
*/
$("#btn1Ocultar").on("click", function() {
    console.log("Evento click 2");
    $("p.texto").hide(2000);
});

$("#btn1Toggle").on("click", function() {
    console.log("Evento toggle");
    $("p.texto").toggle(2000);
});

$("#btn1Mixto").on("click", function() {
    console.log("Evento mixto");
    //const estado = $("p.texto").is(":visible");

    if ($("p.texto").is(":visible")){
        //$("p.texto").hide(2000);
        $(this).text("Mostrar Texto");
    }else{
        //$("p.texto").show(2000);
        $(this).text("Ocultar Texto");
    }

    $("p.texto").toggle(2000);
});

/* 
Función fadeIn()
La función fadeIn() tiene el mismo fin que la
función show, solo que en este caso, el elemento
aparece con una transición.
*/
$("#btn2").on("click", function() {
    $("p.texto2").fadeIn(1500);
});

/* 
Función fadeOut()
La función fadeOut() tiene el mismo fin que la
función hide, solo que en este caso, el elemento
desaparece con una transición.
*/
$("#btn2Ocultar").on("click", function() {
    $("p.texto2").fadeOut(1500);
});


//fadeToggle()
$("#btn2Toggle").on("click", function() {
    $("p.texto2").fadeToggle(1500);
});


/* 
La función slideDown() hace aparecer al
elemento haciendo una transición hacia
abajo. Es una alternativa al fadeIn(). Le
aplican los mismos parámetros de velocidad y
callback que a las funciones fadeIn y fadeOut
*/
$("#btn3").on("click", function() {
    $("p.texto3").slideDown(1500);
});


/* 
La función slideUp() hace desaparecer al
elemento haciendo una transición hacia
arriba. Es una alternativa al fadeOut. Le
aplican los mismos parámetros de velocidad
y callback que a las funciones fadeIn y
fadeOut
*/

$("#btn3Ocultar").on("click", function() {
    $("p.texto3").slideUp(1500);
});

/* 
La función slideToggle() hace aparecer o
desaparecer al elemento mediante slide. En
función de que el elemento esté visible o no,
ejecuta slideUp, o slideDown.
*/
$("#btn3Toggle").on("click", function() {
    $("p.texto3").slideToggle(1500);
});

/* 
Scroll a un elemento
JQuery provee una función para desplazar el scroll
automáticamente hasta una posición Y en la
pantalla. Esta función es muy utilizada en
landing-pages donde el usuario va clickeando en el
menú, y se va desplazando entre secciones de la
misma página.
Lo primero que debemos hacer es asignar en HTML
un id al elemento que queremos usar como punto de
destino para desplazar el scroll.
*/

$('a').click( function(e) {
// asociamos la animacion al click en un elemento <a>
$('html, body').animate({
    scrollTop: $("#seccionContacto").offset().top
    }, 2000);
} );