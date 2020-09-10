const colores = ["#2196f3", "#e91e63", "#ffeb3b", "#74ff1d"];

function createSquare() {   
   
    const seccion = document.getElementById("area");
    const square = document.createElement("span");
    var tamanio = Math.random() * 30;

    square.style.width = 10 + tamanio + "px";
    square.style.height = 10 + tamanio + "px";

    square.style.top = Math.random() * innerHeight + "px";
    square.style.left = Math.random() * innerWidth + "px";

    var indice = Math.floor(Math.random() * colores.length);
    const bg = colores[indice];

    square.style.background = bg;

    seccion.appendChild(square);

    setTimeout(() => {
        square.remove();
    }, 5000);

}

setInterval(createSquare, 100); 
