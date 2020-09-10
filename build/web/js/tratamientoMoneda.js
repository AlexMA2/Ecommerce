const cambioDolar = 3.55;
var datoSol = document.getElementById("precio-soles");
var datoDolar = document.getElementById("precio-dolares");

var datoPromoSol = document.getElementById("precio-promo-soles");
var datoPromoDolar = document.getElementById("precio-promo-dolares");

function cambiaADolar(){
    datoDolar.value = Math.floor((datoSol.value / cambioDolar).toFixed(2));
    
}

function cambiaASol(){
    datoSol.value = Math.floor((datoDolar.value * cambioDolar).toFixed(2));
    
}
function cambiaAPromoDolar(){
    datoPromoDolar.value = Math.floor((datoPromoSol.value / cambioDolar).toFixed(2));
    
}

function cambiaAPromoSol(){
    datoPromoSol.value = Math.floor((datoPromoDolar.value * cambioDolar).toFixed(2));
    
}

datoSol.onkeyup = cambiaADolar;
datoDolar.onkeyup = cambiaASol;

datoPromoSol.onkeyup = cambiaAPromoDolar;
datoPromoDolar.onkeyup = cambiaAPromoSol;
