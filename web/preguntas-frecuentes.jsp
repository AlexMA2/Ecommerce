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
                <li><a href="preguntas-frecuentes.jsp" class="activado"> Preguntas Frecuentes </a></li>
                <li><a href="garantia.jsp" > Garantia y Devolucion </a></li>
                <li><a href="formas-pago.jsp"> Formas de pago </a></li>
            </ul>
        </div>
        
        <div class="texto-politica">
            <h1> Preguntas Frecuentes </h1>
            <h3> 1. ¿Cuanto tiempo demora en llegar un producto?</h3>
            <p> Los productos suelen llegar a las pocas horas de ser comprados gracias a nuestro eficaz sistema de envio de productos donde contamos con 
                varios trabajos listos para hacer llegar llegar los productos que compraste lo más pronto posible a tu hogar.
            </p>
            
            <h3> 2. ¿Qué pasa si mi producto no llega en perfectas condiciones?</h3>
            <p> 
                Los productos que no lleguen en perfectas condiciones entonces pueden ser devueltos mediante nuestro sistema de devoluciones. Se te investigara a que se debio el error para que no vuelva
                a suceder, cuando solicites tu devolucion se te entregará otro producto en un par de horas.
            </p>
            
            <h3> 3. ¿Qué pasa si mi producto nunca llega?</h3>
            <p> 
                Si tu producto no ha llegado aún en el plazo indicado, se realizará una llamada al enviador para avisarte de su posición actual. En caso de un problema en la comunicación con el
                enviador se te enviará otro producto.
            </p>
            
            <h3> 4. ¿Qué sucede si me llego un producto equivocado?</h3>
            <p> 
                Si el producto que te llegó no es el que solicitaste, debes decirselo al enviador para que este revise si efectivamente es o no es el producto que tu solicitaste. En caso de error, el enviador
                te cambiará el producto. En caso de que el enviador ya no este presente, tienes que llamar al número de viva salud para hacer la verificación y el cambio.
            </p>
            
            <h3> 5. ¿Como evito que sigan enviandome ofertas de productos?</h3>
            <p> 
                Para evitar que VIVASALUD le envie ofertas de producto tiene que desabilitar las notificaciones de esta pagina. Esto se puede hacer desde la configuracion de su navegador o en su telefono.
            </p>
           
        </div>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>
</html>
