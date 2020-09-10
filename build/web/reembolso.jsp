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
                <li><a href="reembolso.jsp" class="activado">Política de reembolso</a></li>
                <li><a href="nosotros.jsp">Nosotros</a></li>
                <li><a href="preguntas-frecuentes.jsp"> Preguntas Frecuentes </a></li>
                <li><a href="garantia.jsp" > Garantia y Devolucion </a></li>
                <li><a href="formas-pago.jsp"> Formas de pago </a></li>
            </ul>
        </div>
        
        <div class="texto-politica">
            <h1> CAMBIOS Y DEVOLUCIONES  </h1>            
            <h3> GENERALIDADES </h3>
            <p>
                VIVASALUD desea brindarte la mejor experiencia de compra online mediante www.vivanda.com.pe por eso te informamos de nuestras políticas de devolución y cancelación de pedidos.
                Las devoluciones, cambios y cancelaciones deberán ser solicitadas por medio de nuestra Central de Servicio al Cliente 625-8000 opción de lunes a domingo de 8:00am a 10:00pm todos los días, excepto el 1 de enero.
                Para ejercer el derecho de devolución, cambio de producto y/o pedido a devolver, deberá seguir con las siguientes condiciones generales:

            </p>   
            <h3> CONDICIONES GENERALES </h3>
            <p>
                Para abarrotes y productos no perecibles se podrá hacer la solicitud del cambio y/o devolución hasta 24 horas luego de recibir el pedido. Para los productos frescos (frutas y verduras) y pesables se podrá hacer la solicitud del cambio y/o devolución hasta 12 horas luego de recibir el pedido.
                El producto debe estar en su empaque original con sus etiquetas debidamente legibles y sin haber sido utilizado ni consumido.
                El producto no debe estar deteriorado o presentar manipulaciones que afecten su condición de nuevo. Es obligatoria la presentación del ticket de compra original y del documento nacional de identidad.
                Si la devolución y/o o cambio de mercadería se debe a una omisión y/o error del cliente, éste se debe acercar a su tienda más cercana. En caso solicite el recojo en la dirección de entrega del pedido original, asumirá el costo por el recojo del producto. Si el cambio es por un error de SPSA, se realizará el recojo en la dirección del pedido original del cliente sin costo adicional para él.
                La devolución o cambio de mercadería implica la generación de un comprobante de pago vinculado a la transacción original, denominado "Nota de crédito", así mismo implica la entrega física (devolución) de la mercadería por parte del cliente a la tienda.

            </p>
            <h3> DEVOLUCIÓN Y CAMBIOS</h3>
            <p>
                El cliente debe coordinar con nuestra Central de Servicio al Cliente, la fecha y bloque horario para la recolección/cambio del producto, en caso de no encontrarse, indicar la persona autorizada para el cambio y/o devolución.
                De no encontrarse el cliente durante la fecha y hora pactada se dará por anulado el cambio sin derecho a posteriores reclamos por el mismo producto y compra.
                Si el cliente desea podrá hacer el cambio y/o devolución de manera presencial en nuestra cadena de tiendas a nivel nacional presentando el producto, u ticket de compra y DNI durante los 7 días luego de la compra. En el caso de frescos y pesables solo se considerará 24 horas.
                El cliente podrá rechazar la entrega de cualquier producto al momento del despacho si considera que no está en las condiciones requeridas a la hora de generar su orden de compra.
                El personal del transporte que recogerá el producto y entregará el cambio no se encuentra autorizado bajo ninguna circunstancia a revisar y/o manipular el producto, su única función será la de recogerlo y entregar el cambio del producto.
                Las devoluciones de cualquier pago siempre se realizarán a través del mismo medio de pago en el que fue contratado el servicio. En el caso de tarjetas de crédito y débito, el plazo de devolución de dinero para compras efectuadas online con tarjeta de crédito y/o débito, dependerá de las políticas del banco emisor de la tarjeta del cliente. El extorno parcial no aplica para tarjetas de crédito MasterCard.
                En caso el cliente haya cancelado a través de una tarjeta de crédito y solicite la devolución a través de un "Credivoucher", acepta y declara estar en conocimiento de que la venta original mantiene las condiciones de crédito originales, toda vez que no se ha efectuado el extorno correspondiente, debiendo cancelar los intereses bancarios generados por la compra original.

            </p>
            <h3> MODIFICACIÓN Y/O CANCELACIÓN DEL PEDIDO </h3>
            <p>
                Podrá agregar, retirar o modificar productos hasta 8 horas útiles antes del inicio de su bloque horario (8:00am a 10:00pm).
                El cliente podrá hacer la cancelación de la totalidad de su orden hasta con 24 horas de anticipación del inicio de su bloque horario, debiendo 
                esperar la confirmación vía mail de la cancelación del pedido para considerarlo como tal.

            </p>

        </div>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>
</html>
