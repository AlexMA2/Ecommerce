
function validarNombre() {
    var nombre = document.getElementById("in-dp-nombres").value;
    if (nombre === null || nombre.length === 0 || /^\s+$/.test(nombre) || !isNaN(nombre)) {
        return false;
    }
    return true;
}  function validarApellido() {
    var apellido = document.getElementById("in-dp-apellidos").value;
    if (apellido === null || apellido.length === 0 || /^\s+$/.test(apellido) || !isNaN(apellido)) {
        return false;
    }
    return true;
}

function validarEmail() {
    var contadorArrobas = 0;
    var contadorPuntos = 0;
    var email = document.getElementById("in-dp-email").value;
    for (var i = 0; i < email.length; i++) {
        if (email.charAt(i) === '@') {
            contadorArrobas++;
        }
        if (email.charAt(i) === '.') {
            contadorPuntos++;
        }

        if (i === email.length - 2) {
            if (contadorPuntos < 1 || contadorArrobas !== 1) {
                return false;
            }
            
        }
    }
    return true;
}

function validarDNI() {
    var dni = document.getElementById("in-dp-dni").value;
    if (dni === null || isNaN(dni) || dni.length !== 8) {
        return false;
    }
    return true;
}

function validarCombobox(id) {
    var indice = document.getElementById(id).selectedIndex;
    if (indice === null || indice === 0) {
        return false;
    }
    return true;
}

function validarDireccion() {
    var direccion = document.getElementById("in-dp-direccion").value;
    if (isNaN(direccion)) {
        return true;
    }
    return false;
}

function validarTelefono() {
    var telefono = document.getElementById("in-dp-telefono").value;
    if (isNaN(telefono) || telefono.length !== 9) {
        return false;
    }
    return true;
}

function validarDatosPersonales() {
    var error = "";
    if (!validarNombre()) {
        error = error + " Nombre";
    }
    if (!validarApellido()) {
        error = error + " Apellido";
    }
    
    if (validarNombre() && validarApellido() && validarEmail() && validarDNI() && validarDireccion() && validarTelefono() && validarCombobox("distritos")) {
        return true;
    }
    return false;
}

function validarNTarjeta() {
    var tarjeta = document.getElementById("in-dt-NTarjeta").value;
    tarjeta = tarjeta.replace(/ /g,"");
    if (isNaN(tarjeta) || tarjeta.length !== 16) {
        return false;
    }
    return true;
}

function validarTitular() {
    var titular = document.getElementById("in-dt-titular").value;
    if (titular === null || titular.length === 0 || /^\s+$/.test(titular) || !isNaN(titular)) {
        return false;
    }
    return true;
}

function validarCVV() {
    var cvv = document.getElementById("in-dt-cvv").value;
    if (isNaN(cvv) || cvv.length !== 3) {
        return false;
    }
    return true;
}

function validarDatosTarjeta() {
    
    if (validarCombobox("tarjetas") && validarNTarjeta() && validarTitular() && validarCombobox("dt-mes") && validarCombobox("dt-anio") && validarCVV()) {
        return true;
    }
    return false;
}

var boton = document.getElementById("btn-confirmarpago");

boton.addEventListener("click", function (e) {
    e.preventDefault();
    if (validarDatosPersonales() && validarDatosTarjeta()) {
        document.getElementById("ventana-em").style.display = "flex";
        
    } else {
        document.getElementById("ventana-err").style.display = "flex";
    }

});

var btnCerrarPopup = document.getElementById("btn-cerrar-ventana");

btnCerrarPopup.addEventListener("click", function (e) {
    e.preventDefault();
    document.getElementById("ventana-em").style.display = "none";
});

var btnCerrarPopupErr = document.getElementById("btn-cerrar-ventanar");

btnCerrarPopupErr.addEventListener("click", function (e) {
    e.preventDefault();
    document.getElementById("ventana-err").style.display = "none";
});