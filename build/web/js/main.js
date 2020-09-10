/*price range*/

/* global g */

$("#sl2").slider();

var RGBChange = function () {
    $("#RGB").css("background", "rgb(" + r.getValue() + "," + g.getValue() + "," + b.getValue() + ")");
};

/*scroll to top*/

$(document).ready(function () {
    $(function () {
        $.scrollUp({
            scrollName: "scrollUp", 
            scrollDistance: 300, 
            scrollFrom: "top", 
            scrollSpeed: 300, 
            easingType: "linear", 
            animation: "fade", 
            animationSpeed: 200, 
            scrollTrigger: false, 
           
            scrollText: "<i class='fa fa-angle-up'></i>", 
            scrollTitle: false, 
            scrollImg: false, 
            activeOverlay: false, 
            zIndex: 214748
        });
    });
});