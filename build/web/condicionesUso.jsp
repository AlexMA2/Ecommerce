<%@page import="cad.UsuarioCad"%>
<%@page session="true"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>VivaSalud |  Compra los mejores productos para tu salud</title>
        <%@include file="WEB-INF/css.jsp"%>
    </head>
    <body>

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
        
        <div class="texto-politica">
            <h1> Condiciones de uso  </h1>
            <p>
                El acceso y uso de este sitio web se rige por los "Términos y Condiciones" descritos a continuación, así como por la legislación que se aplique en la República de Perú. En consecuencia, todas las visitas y todos los contratos y transacciones que se realicen en este sitio, como asimismo sus efectos jurídicos, quedarán regidos por estas reglas y sometidas a esta legislación. 

                Asimismo, el conjunto de normas dictadas en el marco del Estado de Emergencia (Decreto Supremo N° 044-2020-PCM).

                Los Términos y Condiciones contenidos en este instrumento se aplicarán y se entenderá que forman parte de todos los actos y contratos que se ejecuten o celebren mediante los sistemas de oferta y comercialización comprendidos en este sitio web entre los usuarios de este sitio y VIVASALUD, la cual se denominará en adelante también en forma indistinta como "la empresa", o bien "la empresa oferente", "el proveedor" o "la empresa proveedora", según convenga al sentido del texto. 

                Es requisito para comprar en la Tienda Virtual de VIVASALUD la aceptación de los Términos y Condiciones de ventas descritos a continuación. Cualquier persona que realice una transacción en la Tienda Virtual de VIVASALUD o a través del número telefónico que  VIVASALUD destine para tal efecto, declara y reconoce, por el hecho de efectuar la compra, que conoce y acepta todos y cada uno de los Términos y Condiciones descritos a continuación. Se entenderán conocidos y aceptados los Términos y Condiciones por el solo hecho del registro y/o la compra de productos a través de este sitio. 

                VIVASALUD se reserva el derecho de actualizar y/o modificar los Términos y Condiciones que detallamos a continuación en cualquier momento, sin previo aviso. Por esta razón, recomendamos revisar los Términos y Condiciones cada vez que utilice este Sitio. Los consumidores quedarán sujetos a los Términos y Condiciones del presente sitio, en el momento en el que envíen su solicitud de compra. 

                Realizaremos nuestros mejores esfuerzos para asegurar la disponibilidad, sin interrupciones, de los servicios de la presente página web, así como en la ausencia de errores en cualquier transmisión de información que pudiera tener lugar. No obstante, y debido a la naturaleza misma de internet, no es posible garantizar tales extremos. 

                Asimismo, el acceso a los servicios de la presente página web podría ocasionalmente verse suspendido o restringido a efectos de la realización de trabajos de reparación o mantenimiento, o la introducción de nuevos productos o servicios. Procuraremos limitar la frecuencia y duración de tales suspensiones o restricciones.

                Ponemos en conocimiento de todos nuestros clientes que dado el Estado de Emergencia (Decreto Supremo N° 044-2020-PCM) y la suspensión de actividades económicas, las condiciones de despacho y entrega han sido afectadas, pudiendo surgir eventuales retrasos en las fechas programadas para el despacho y entrega de los productos adquiridos en nuestros canales de venta.

                A continuación detallamos los Términos y Condiciones:

            </p>   
            <h3> 1. REGISTRO DEL USUARIO O CLIENTE. </h3>
            <p>
                Para comprar productos en el sitio, no es necesario estar registrado. El registro de cada usuario se verificará completando y suscribiendo el 
                formulario que aparece en el sitio y su posterior envío, el cual se realiza automáticamente mediante un "click" en el elemento respectivo.
                Los datos necesarios para el registro son los siguientes: Nombre, Apellidos, Email, Clave, País de residencia, Tipo de documento, Número de 
                documento, Género, Fecha de nacimiento, Celular. Para acceder al registro del usuario, se deberán aceptar los términos y condiciones de la web. 
                En caso de no registrarse, el usuario deberá completar los datos que se indican en el formulario de compra con el fin de hacer efectiva la adquisición 
                de productos o servicios.
            </p>
            <h3> 2. CLAVE SECRETA.</h3>
            <p>
                El usuario dispondrá, una vez registrado, de un nombre y contraseña o clave definitiva que le permitirá el acceso personalizado, confidencial 
                y seguro. El usuario tendrá la posibilidad de cambiar la clave de acceso, para lo cual deberá sujetarse al procedimiento establecido en el sitio 
                respectivo. El usuario asume totalmente la responsabilidad por el mantenimiento de la confidencialidad de su clave secreta registrada en este sitio
                web, la cual le permite efectuar compras, solicitar servicios y obtener información. Dicha clave es de uso personal y su entrega a terceros, no
                involucra responsabilidad de VIVASALUD
            </p>
            <h3> 3. DERECHOS DEL USUARIO DE ESTE SITIO. </h3>
            <p>
                El usuario gozará de todos los derechos que le reconoce la legislación correspondiente vigente en el territorio de Perú, y además los que se le otorgan 
                en estos términos y condiciones. Del mismo modo, el usuario deberá tener en consideración los alcances del conjunto de normas decretadas en el marco del
                Estado de Emergencia (Decreto Supremo N° 044-2020-PCM) y la respectiva vigencia en su aplicación La sola visita de este sitio en el cual se ofrecen
                determinados bienes y el acceso a determinados servicios, no impone al consumidor obligación alguna, a menos que haya aceptado en forma inequívoca
                las condiciones ofrecidas por el proveedor, en la forma indicada en estos términos y condiciones.
            </p>
            <h3> 4. PROCEDIMIENTO PARA HACER USO DE ESTE SITIO. </h3>
            <p>
                En los contratos ofrecidos por medio de este sitio, la empresa oferente informará, de manera inequívoca y fácilmente accesible, los pasos que deben 
                seguirse para celebrarlos.
            </p>
        </div>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>
</html>
