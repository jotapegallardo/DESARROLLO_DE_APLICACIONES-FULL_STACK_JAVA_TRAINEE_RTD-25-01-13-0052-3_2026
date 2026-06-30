console.log("================== DEMO Js ================");

//1° Capturar los números y almacenar en variables
let num1 = prompt("Ingrese el primer número (num1): ");
let num2 = prompt("Ingrese el primer número (num2): ");

console.log(`La variable num1 es ${num1}`);
console.log(`La variable num2 es ${num2}`);
console.log(`La variable num1 es del tipo ${typeof(num1)}`);
console.log(`La variable num2 es del tipo ${typeof(num2)}`);

//comprobar si son valores vacíos
if(Number.isNaN(num1) || Number.isNaN(num2)){
    console.log("Debe ingresar valores validos!!");
    alert("Debe ingresar valores validos!!");
}else {
    num1 = Number(num1);
    num2 = Number(num2);

    let opcion = prompt(
        "Eliga una opción \n" +
        "1) Sumar \n" +
        "2) Restar \n" +
        "3) Multiplicar \n" +
        "4) Dividir \n" +
        "5) Modulo"
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

}