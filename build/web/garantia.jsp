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
                <li><a href="garantia.jsp" class="activado" > Garantia y Devolucion </a></li>
                <li><a href="formas-pago.jsp"> Formas de pago </a></li>
            </ul>
        </div>
        <div class="texto-politica">
            <h1> POLÍTICA DE GARANTIA Y DEVOLUCION </h1>
            <h3> Condiciones Generales: </h3>
            <p>
                Tener en cuenta que para ejercer el derecho de devolución se debe tener en cuenta los siguientes puntos:

                Todo cambio o devolución se realizará hasta diez (10) días naturales (para productos locales) después de la entrega del pedido. 

                Es indispensable contar con el producto completo, tal y como fue entregado.

                Recuerde que tanto el producto como la documentación original (boleta/factura), es importante para solicitar una devolución. Importante: De no tener la documentación del comprobante de pago, el reclamo de este documento deberá hacerse dentro de las 48 horas luego de recibir el producto.

                En el caso de productos en promoción, se requiere la entrega de todos los productos incluidos en la promoción correspondiente.

                Es importante además la veracidad de la información proporcionada en la solicitud de devolución.

                Condiciones generales para la recolección:

                Por regla general el cliente debe contactarnos a través de correo electrónico para proceder a devolver el producto.

                Si el producto no es enviado posterior a 5 días hábiles desde que se realizó la guía de devolución se considerará como cancelada la solicitud.

                El personal de VIVA SALUD no se encuentra facultado para desarmar o manipular el producto, el producto deberá ser entregado en su empaque original junto con su comprobante de pago

                En caso de que VIVA SALUD considere necesario el recojo, esta será realizada directamente en la dirección donde el producto se entregó.
            </p>
            <h3> Tener en cuenta que: </h3>
            <p>
                El personal encargado del recojo del producto no se encuentra bajo ninguna circunstancia facultado para desarmar ni manipular el producto, su única función será la de recogerlo.
                Si el producto no se encuentra embalado en su empaque original, no se procederá con el recojo. Tampoco se concretará el recojo si el cliente no cuenta con el comprobante de pago 
                (boleta factura), la misma que deberá entregar al personal encargado del recojo.
            </p>
            <h3> Consideraciones Generales: </h3>
            <p>
                Tener en cuenta que de no cumplir con estos requisitos el cambio o devolución podría ser invalidado.

                Los servicios de recojo de productos a solicitud del cliente por motivos ajenos a responsabilidad de VIVA SALUD, tendrán un costo adicional dependiendo del lugar de recojo, tamaño y peso del producto.
            </p>
        
    </div>

    <%@include file="WEB-INF/footer.jsp" %>
    <%@include file="WEB-INF/js.jsp" %>
</body>
</html>
