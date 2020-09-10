
<%@page import="view.Pago"%>
<%@page import="javaFrejoles.Item"%>
<%@page import="javaFrejoles.Usuario"%>
<%@page import="javaFrejoles.Producto"%>
<%@page import="cad.UsuarioCad"%>
<%@page import="cad.ProductoCad"%>
<%@page import="cad.CategoriaCad"%>
<%@page import="javaFrejoles.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="WEB-INF/headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="WEB-INF/header.jsp"%>
            </c:otherwise>
        </c:choose>

        <%           
            if (session.getAttribute("pagado") == null) {
                response.sendRedirect("index.jsp");

            }
            
        %>

        <div class="container">
            <div class="parrafo-compra">
                <h1> ¡Compra realizada! </h1>
                <p>
                    Gracias por confiar en nosotros.
                    Puedes ver tus pedidos en tu perfil y cancelarlos si lo deseas.                    
                </p>

            </div>

            <div class="resumen-compra">
                <c:forEach items="${sessionScope.cart}" var="pro">
                    <c:set  var="total" value="${total+pro.p.precio*pro.cantidad}"/>        
                    <c:set  var="totalProd" value="${totalProd + pro.cantidad}"/>     
                </c:forEach>
                <div class="aside-productos" style="position: static;">
                    <div class="productos-wrapper">
                        <h2> Productos Comprados </h2>
                        <span class="total-productos">
                            Productos 
                            <span>${totaProd}</span>
                        </span>
                        <span class="total-precio"> s/. ${total}0</span>
                        <div class="contenedor-orden-resumen">
                            <ul class="orden-resumen">
                                <c:forEach items="${sessionScope.cart}" var="pro">
                                    <li class="item-producto">
                                        <img src="foto/${pro.p.img}" width="70" height="70" class="img-producto"/>
                                        <div class="detalles-producto">
                                            <div class="detalles-right">
                                                <span class="nombre-producto">${pro.p.nombre}</span>
                                                <span class="costo-producto">S/. ${pro.p.precio*pro.cantidad}0</span>
                                            </div>
                                            <div class="detalles-left">
                                                <span>ID Referencia Web: ${pro.p.webid}</span>
                                                <span class="cantidad-producto">${pro.cantidad} unidades</span>
                                            </div>
                                        </div>
                                    </li>                                    

                                </c:forEach>

                            </ul>
                            <a href="Cart"> Regresar al carrito</a>
                        </div>
                    </div>                  

                </div>
            </div>

        </div>

        <%            
            session.setAttribute("cart", null);
            session.setAttribute("contador",null);
        %>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>

        <script>
            var element1 = document.querySelector('.shop-menu ul li');
            var i = 0;
            while (element1) {
                subE = element1.firstElementChild;

                if (i === 2) {
                    subE.className += "active";
                } else {
                    subE.className -= "active";
                }
                element1 = element1.nextElementSibling;
                i++;
            }

        </script>
    </body>
</html>