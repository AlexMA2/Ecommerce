var elements = document.querySelectorAll(".ojo i");

var misContras = document.querySelectorAll(".contrasenya");
var contras = Array.from(misContras);
elements.forEach(
    function (currentValue, currentIndex, listObj) {
        
        currentValue.onclick = function () {
            var miContra = contras[currentIndex];
            
            if (currentValue.className === "fa fa-eye-slash") {
                miContra.type = "password";
                currentValue.className = "fa fa-eye";
            } else {
                
                miContra.type = "text";
                currentValue.className = "fa fa-eye-slash";
            }

        };
    },
    "elemento"
);



