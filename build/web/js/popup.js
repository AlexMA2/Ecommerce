var btnAbrirRese=document.getElementById("btn-rese"),
    overlay=document.getElementById("overlay"),
    rese=document.getElementById("rese"),
    btnCerrarRese=document.getElementById("btn-cerrar-rese");
    
btnAbrirRese.addEventListener("click",function(){
    overlay.classList.add("active");
    rese.classList.add("active");
});
btnCerrarRese.addEventListener("click",function(){
    overlay.classList.remove("active");
    rese.classList.remove("active");
});
var btnAbrirRese2=document.getElementById("btn-rese2"),
    overlay2=document.getElementById("overlay2"),
    rese2=document.getElementById("rese2"),
    btnCerrarRese2=document.getElementById("btn-cerrar-rese2");
    
btnAbrirRese2.addEventListener("click",function(){
    overlay2.classList.add("active");
    rese2.classList.add("active");
});
btnCerrarRese2.addEventListener("click",function(){
    overlay2.classList.remove("active");
    rese2.classList.remove("active");
});


var btnAbrirdatos=document.getElementById("btn-datos"),
    overlay3=document.getElementById("overlay3"),
    datos=document.getElementById("datos"),
    btnCerrardatos=document.getElementById("btn-cerrar-datos");
    
btnAbrirdatos.addEventListener("click",function(){
    overlay3.classList.add("active");
    datos.classList.add("active");
});
btnCerrardatos.addEventListener("click",function(){
    overlay3.classList.remove("active");
    datos.classList.remove("active");
});