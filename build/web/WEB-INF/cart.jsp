<%@page import="cad.UsuarioCad"%>
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
        <%@include file="../WEB-INF/css.jsp"%>
        <script src="https://www.paypalobjects.com/api/chechout.js"></script>
    </head>

    <body>

        <%
            if (session.getAttribute("user") != null) {
                UsuarioCad.nombreUsuario = session.getAttribute("user").toString();
            }

        %>

        <%            if (session.getAttribute("cerrarSesion") != null) {
                if (session.getAttribute("cerrarSesion").toString() == "true" && session.getAttribute("user") != null) {
                    UsuarioCad.cerrarSesion(session.getAttribute("user").toString());
                    session.setAttribute("cerrarSesion", null);
                }
            }

        %>
        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="../WEB-INF/headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="../WEB-INF/header.jsp"%>
            </c:otherwise>
        </c:choose> 

        <section id="cart_items">
            <div class="container">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="#">Carrito</a></li>
                        <li class="active">Lista de productos</li>
                    </ol>
                </div>
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Producto</td>
                                <td class="description"></td>
                                <td class="price text-center">Precio</td>
                                <td class="quantity text-center">Cantidad</td>
                                <td class="total text-center">Total</td>
                                <td></td>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${sessionScope.cart}" var="pro">
                                <c:set  var="total" value="${total+pro.p.precio*pro.cantidad}"/>
                                <tr>
                                    <td class="cart_product">
                                        <img src="foto/${pro.p.img}" width="110" alt="">
                                    </td>
                                    <td class="cart_description">
                                        <h4><a href="">${pro.p.nombre}</a></h4>
                                        <p>ID Referencia Web: ${pro.p.webid}</p>
                                    </td>
                                    <td class="cart_price text-center">
                                        <p>${pro.p.precio}</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <a class="cart_quantity_up" href="?action=ActualizarCantidadMore&id=${pro.p.webid}"> + </a>
                                            <input class="cart_quantity_input" type="text" name="quantity" value="${pro.cantidad}" autocomplete="off" size="2">
                                            <a class="cart_quantity_down" href="?action=ActualizarCantidadLess&id=${pro.p.webid}"> - </a>
                                        </div>
                                    </td>
                                    <td class="cart_total text-center">
                                        <p id="precio_1" class="cart_total_price">
                                            <fmt:setLocale value="es_PE"/>
                                            <fmt:formatNumber value="${pro.p.precio*pro.cantidad}" type="currency"/>

                                        </p>
                                    </td>
                                    <td class="cart_delete">
                                        <a class="cart_quantity_delete" href="?action=delete&id=${pro.p.webid}"><i class="fa fa-times"></i></a>
                                    </td>
                                </tr>    
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </section> 

        <section id="do_action">
            <div class="container">
                <div class="heading">
                    <h3>¿Qué te gustaría hacer ahora?</h3>
                    <p>Te gustaría pagar o seguir comprando?</p>
                </div>
                <div class="row">

                    <div class="col-sm-10">
                        <div class="total_area">
                            <ul>
                                <li>Sub Total <span>${total}</span></li>
                                <li>Pago por Envío <span>${(Math.round((total*0.05) * 100) / 100)}</span></li>
                                <li><h3>Total <span>${total+(total*0.05)}</span></h3></li>
                            </ul>
                            <a class="btn btn-default update" href="Inicio">Seguir comprando</a>
                            <c:choose>
                                <c:when test="${sessionScope.cart.size() > 0}">
                                    <a class="btn btn-default check_out" href="checkout.jsp">Realizar pago</a>
                                </c:when>    
                                <c:otherwise>
                                   
                                </c:otherwise>
                            </c:choose> 
                            
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="../WEB-INF/footer.jsp" %>
        <%@include file="../WEB-INF/js.jsp" %>
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
