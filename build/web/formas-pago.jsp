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
                <li><a href="condicionesUso.jsp">Condiciones de Uso</a></li>
                <li><a href="privacidad.jsp">Política de privacidad</a></li>
                <li><a href="reembolso.jsp">Política de reembolso</a></li>
                <li><a href="nosotros.jsp">Nosotros</a></li>
                <li><a href="preguntas-frecuentes.jsp"> Preguntas Frecuentes </a></li>
                <li><a href="garantia.jsp" > Garantia y Devolucion </a></li>
                <li><a href="formas-pago.jsp" class="activado"> Formas de pago </a></li>
            </ul>
        </div>
        <div class="texto-politica">
            <h1> Información general sobre pagos </h1> 
            <h3>¿Es seguro usar mi tarjeta de crédito?¿Está mi información protegida?</h3>
            <p>
                VIVA SALUDestá comprometido a asegurar que tu información personal esté protegida siempre y tiene un número de medidas 
                de prevención de fraude. Se te solicitará que proveas información para asegurar que tu tarjeta no esté siendo utilizada
                de forma fraudulenta.
            </p>
            <h3> ¿Cómo realizo un pago en el sitio? </h3>
            <p>
                Cuando esté listo para proceder con tu compra, sigue los pasos dados para que podamos confirmar todos tus detalles, incluida la autorización para                 
                hacer el pago. Nosotros haremos efectiva tu orden dirigiéndote a la página de confirmación que te permitirá saber si tu pago fue procesado con éxito. 
                También anexaremos la factura, la cual podrás encontrar en tu perfil.
            </p>
            <h3>¿Por qué necesitamos el código de seguridad de tu tarjeta?</h3>
            <p>Pedimos el código de seguridad de tu tarjeta para prevenir el eventual uso fraudulento de tu cuenta. Dicho código lo encontrarás impreso en la parte trasera de tu tarjeta, de modo que solamente la persona que tenga posesión física dela tarjeta debería saber el código.</p>
            <h3>¿Cómo confirmo que un pago ha sido procesado con éxito?</h3>
            <p>Luego de que un pago es procesado, serás redirigido a una pantalla de confirmación que te permitirá saber si tu pago fue procesado con éxito o si hubo algún inconveniente en el proceso. En caso de una operación exitosa, anexaremos la factura que encontrarás en tu perfil. También deberías ver la transacción en el historial de tu cuenta bancaria.</p>
            <h3>¿Qué ocurre con mi Producto Pago seleccionado?</h3>
            <p>Tu producto pago seleccionado será aplicado una vez que se haya gestionado el pago de forma exitosa.</p>
            <h3>¿Dónde puedo encontrar una lista/historial de mis órdenes y pagos en OLX?</h3>
            <p>Puedes encontrar esta información en la sección Mis Órdenes. Encontrarás una lista de todas tus órdenes y pagos realizados en  VIVA SALUD, incluyendo la siguiente información tal como la fecha de la compra o el ID de orden, lo cual es una gran ayuda al momento de contactarte con Atención al usuario de VIVA SALUD.</p>


        </div>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>
</html>
