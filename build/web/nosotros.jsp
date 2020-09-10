
<%@page import="cad.UsuarioCad"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VivaSalud |  Compra los mejores productos para tu salud</title>
        <%@include file="WEB-INF/css.jsp"%>

    </head><!--/head-->    
    <body>
        <%
            if (session.getAttribute("user") != null) {
                UsuarioCad.nombreUsuario = session.getAttribute("user").toString();
            }

        %>

        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="WEB-INF/headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="WEB-INF/header.jsp"%>
            </c:otherwise>
        </c:choose>        
        <div class="panel-izquierdo">

            <ul>
                <li><a href="condicionesUso.jsp" class="activado">Condiciones de Uso</a></li>
                <li><a href="privacidad.jsp">Política de privacidad</a></li>
                <li><a href="reembolso.jsp">Política de reembolso</a></li>
                <li><a href="nosotros.jsp">Nosotros</a></li>
                <li><a href="preguntas-frecuentes.jsp"> Preguntas Frecuentes </a></li>
                <li><a href="garantia.jsp" > Garantia y Devolucion </a></li>
                <li><a href="formas-pago.jsp"> Formas de pago </a></li>
            </ul>
        </div>
        <div class="titulo">
            <h1>Sobre Nosotros</h1>
        </div>  
        <div class="sobre-nosotros">
            <div class="piezas">
                <h2> ¿Quiénes somos?</h2>
                <p>
                    Somos estudiantes de la Universidad Naciona Mayor de San Marcos del quinto ciclo. Hemos creado esta página 
                    como un proyecto universitario, ademas es una forma de mejorar nuestros conocimientos adquiridos
                    en el transcurso de nuestra vida universitaria.
                </p>
            </div>     
            <div class="piezas">
                <h2> ¿Qué ofrecemos?</h2>
                <p>
                    Ofrecemos distintos productos relacionados con la situación actual que esta atravesando el mundo y especialmente nuestro país Perú.
                    Estos productos se pueden ver en la página principal. Son artículos utiles para evitar adquirir virus o bacterias que pueden
                    ser perjudiciales para tu salud.
                </p>
            </div>   

        </div>
        
        <h2> Habla con nosotros! </h2>
        <div class="medios-contacto">            
            <ul>
                <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a></li>
            </ul>            

        </div>    
        <script>
            var element1 = document.querySelector('.shop-menu ul li');
            var i = 0;
            while (element1) {
                subE = element1.firstElementChild;

                if (i === 1) {
                    subE.className += "active";
                } else {
                    subE.className -= "active";
                }
                element1 = element1.nextElementSibling;
                i++;
            }

        </script>
        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>

</html>
