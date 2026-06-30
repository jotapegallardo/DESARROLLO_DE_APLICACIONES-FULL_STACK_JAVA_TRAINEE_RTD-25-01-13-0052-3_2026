/*========================
1) Evento click
=========================*/
$("#btnClick").on("click", function(){
    console.log("Se presiono el botón con click");
    Swal.fire({
    icon: "success",
    title: "Sweet!",
    text: "Modal with a custom image.",
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 1500,
    timerProgressBar: true,
    })
});

/*========================
2) Evento dblclick
=========================*/
$("#btnDblClick").on("dblclick", function(){
    if($(this).hasClass("btn-secondary")){
        $(this).removeClass("btn-secondary").addClass("btn-danger");
    }else{
        $(this).removeClass("btn-danger").addClass("btn-secondary");
    }
});

/*========================
3) Evento mouseenter
=========================*/
$("#btnMouse").on("mouseenter", function(){
    $(this).addClass("btn-lg");
});

/*========================
4) Evento mouseleave
=========================*/
$("#btnMouse").on("mouseleave", function(){
    $(this).removeClass("btn-lg");
});

/*========================
5) Evento keydown, keyup y keypress
=========================*/
$("#txtTeclado").on("input", function(){
    let texto = $(this).val();
    $("#textoprevio strong").text(texto);
})

$("#txtTeclado").on("keydown", function(){
    $("#eventoteclado strong").text("Evento keydown");
})

$("#txtTeclado").on("keyup", function(){
    $("#eventoteclado strong").text("Evento keyup");
})

$("#txtTeclado").on("keypress", function(){
    $("#eventoteclado strong").text("Evento keypress");
})


/* =========================
6) SUBMIT (formulario)
========================= */

$("#formDemo").on("submit", function(e){
    e.preventDefault();// evitar que se recargue la página

    let nombre = $("#txtNombre").val().trim();

    //El usuario no ingreso nada
    if(nombre === ""){
        $("#msgForm")
        .removeClass("d-none")
        .removeClass("alert-success")
        .addClass("alert-danger")
        .text("⚠️ El nombre es obligatior.");
        return;
    }

    $("#msgForm")
    .removeClass("d-none")
    .removeClass("alert-danger")
    .addClass("alert-success")
    .text("✅ Formulario enviado correctamente!")

})

const userObj = {
  username : "Maria",
  email: "maria@mail.com",
  cuantaSantander: 51245878,
  saldoCtaSantander: 100000,
}

localStorage.setItem('user', JSON.stringify(userObj))


const storedUserData = localStorage.getItem('user')

if (storedUserData) {
  const userData = JSON.parse(storedUserData)

  userData.saldoCtaSantander += 50000;

  $("#msgUser").text(userData.saldoCtaSantander);
  // You can use userData here...
} else {
  console.log('User data not found in local storage')
}


localStorage.removeItem("user");

/*
window.location.href = "./home.html"

window.location.href = "./login.html"

Swal.fire({
    icon: "success",
    title: "Sweet!",
    text: "Modal with a custom image.",
    toast: true,
    position: 'top-end',
    showConfirmButton: false,
    timer: 1500,
    timerProgressBar: true,
}).then(() => window.location.href = "./home.html");*/

