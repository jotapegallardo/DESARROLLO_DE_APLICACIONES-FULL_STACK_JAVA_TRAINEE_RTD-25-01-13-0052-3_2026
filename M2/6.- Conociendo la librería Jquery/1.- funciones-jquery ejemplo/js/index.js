/*click() se ejecuta cada vez que se hace click en un elemento del DOM. 
Bien sea una imagen, un input text, un párrafo, un button, un select, un radio button, etc.*/

/*El hide() método oculta los elementos seleccionados.
Consejo: Esto es similar a la propiedad CSS display: none.
Nota: Los elementos ocultos no se mostrarán en absoluto (ya no afecta al diseño de la página).*/
$("#hide").on("click",function(){
    $("#mostrar1").hide(1000);
});

/*Para mostrar los elementos ocultos, se usa el  método show().*/
$("#show").on("click",function(){
    $("#mostrar1").show(1000);
});

/*toggle() mostrará u ocultará los elementos con id 'mostrar1'. 
Dependiendo del estado (visible u oculto) del elemento con id 'mostrar1' se ocultará o mostrará */
$("#toggle").on("click",function(){
    $("#mostrar1").toggle(1000);
});

/*slideDown(): Muestra un elemento con un efecto de deslizamiento (acordeón). */
$("#slideDown").on("click",function(){
    $("#holamundo").slideDown(1000);
});

/*slideUp(): Oculta un elemento con el efecto de deslizamiento (acordeón).*/
$("#slideUp").on("click",function(){
    $("#holamundo").slideUp(1000);
});

/*slideToggle() mostrará u ocultará los elementos dependiendo del estao en el que se encuentre*/
$("#slideToggle").on("click",function(){
    $("#holamundo").slideToggle(1000);
});

/*fadeIn() muestra un elemento (anteriormente oculto) cambiando su opacidad.*/
$("#fadeIn").on("click",function(){
    $("#div1").fadeIn();
    $("#div2").fadeIn("slow");
    $("#div3").fadeIn(3000);
});

/*fadeOut() oculta un elemento cambiando su opacidad.*/
$("#fadeOut").on("click",function(){
    $("#div1").fadeOut();
    $("#div2").fadeOut("slow");
    $("#div3").fadeOut(3000);
});

/* fadeToggle() muestra u oculta un elemento cambiando su opacidad dependiendo del estado en el que se encuentre*/
$("#fadeToggle").on("click",function(){
    $("#div1").fadeToggle();
    $("#div2").fadeToggle("slow");
    $("#div3").fadeToggle(3000);
});

/*addClass método () para añadir uno o más nombres de clase al elemento seleccionado.
Este método no elimina la propiedad de clases existente, sólo tiene que añadir uno o más 
nombres de clase para el atributo de clase.
Sugerencia: Para agregar más de una clase, utilice los nombres de las clases separadas por espacios. */
$("#addClass").on("click",function(){
    $("#mostrar4").addClass("rojo");
});

/*El método after () inserta el contenido especificado después de los elementos seleccionados.
Sugerencia: Para insertar contenido antes de los elementos seleccionados, utilice el método before ().*/
$("#after").on("click",function(){
    $("#p1").after("<h1>Hello world!!!</h1>");
});

/*El método  append() inserta contenido especificado en el extremo de los elementos seleccionados.
Consejo: Para insertar contenido en el comienzo de los elementos seleccionados, utilice el método prepend().*/
$("#append").on("click",function(){
    $("ol").append("<li>Esto es un item agregado</li>");
});

/*Con el método html() podemos obtener código html de un nodo del DOM o asignárselo.
De esta manera podremos manipular de una manera fácil los diferentes elementos que hay en una página web. */
$("#html").on("click",function(){
    $("#agregahtml").html("<spam style='color:blue;'>Chaooo Mundo!!!</spam>");
});

$("#htmlalert").on("click",function(){
    alert($("<p>Por fin he entendido lo que significa 'upward compatible' (compatible hacia arriba). Significa que mantenemos todos nuestros viejos errores</p>").html());
});

/*El método attr() sirve para acceder a los atributos html de un elemento.*/
$("#attr").on("click",function(){
    $("#naruto").attr("width", "500");
});

/*El método val () devuelve o establece el valor de la propiedad del elemento seleccionado. Ej: un input*/
/*Con text() podemos obtener o asignar el texto que queramos a los diferentes elementos del DOM.*/
$("#valtext").on("click",function(){
    var value = $("#texto" ).val();
    $("#textoreplica").text( value );
});



