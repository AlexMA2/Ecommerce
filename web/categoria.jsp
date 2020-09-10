<%@page import="javaFrejoles.Usuario"%>
<%@page import="javaFrejoles.Producto"%>
<%@page import="cad.UsuarioCad"%>
<%@page import="cad.ProductoCad"%>
<%@page import="cad.CategoriaCad"%>
<%@page import="javaFrejoles.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
        <%! int codCategoria;%>
        <%! String tituloCategoria;%>
        <%            String nombreMarca = request.getParameter("cat");
            try {
                codCategoria = Integer.parseInt(nombreMarca);
            } catch (NumberFormatException ex) {
                codCategoria = 0;
            }
            tituloCategoria = CategoriaCad.obtenerCategoria(codCategoria).getNombre();

        %>
        <div class="container">
            <div class="col-sm-12 padding-right">
                <div class="features_items"><!--features_items-->
                    <h2 class="title text-center"><%out.print(tituloCategoria);%></h2>
                    <%! ArrayList<Producto> datos;%>
                    <%
                        if (codCategoria > 0) {
                            datos = ProductoCad.listarProductosPorCategoria(session.getAttribute("moneda").toString(), codCategoria);
                        } else {
                            datos = ProductoCad.listarProductosRecomendados(session.getAttribute("moneda").toString());
                        }
                    %>
                    <c:forEach var="p" items="<%= datos%>">
                        <div class="col-sm-4">
                            <div class="product-image-wrapper">
                                <div class="single-products">
                                    <div class="productinfo text-center">
                                        <img src="foto/${p.img}" alt="" />
                                        <h2 <c:if test="${p.stock==0}"> class="gris" </c:if>>
                                            <c:choose>
                                                <c:when test="${p.precionuevo!=0}">
                                                    ${sessionScope.moneda} ${p.precionuevo} <strike class="gris">${p.precio}</strike>
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${sessionScope.moneda} ${p.precio}
                                                    </c:otherwise>
                                                </c:choose>

                                        </h2>
                                        <p>${p.nombre}</p>                                        
                                        <a href="product-details.jsp?id=${fn:escapeXml(p.webid)}" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                        
                                        <div class=""> 
                                            
                                        </div>
                                    </div>

                                    <c:choose>
                                        <c:when test="${p.precionuevo!=0}">
                                            <img src="images/home/sale.png" class="new" alt="producto en promoción"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:if test="${p.nuevo}">
                                                <img src="images/home/new.png" class="new" alt="producto nuevo"/>
                                            </c:if>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="choose">
                                    <ul class="nav nav-pills nav-justified">
                                        <li><a href=""><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></a></li>
                                        <li><a href="#" <c:if test="${p.stock==0}"> class="gris" </c:if>>
                                                <c:choose>
                                                    <c:when test="${p.stock>0}">
                                                        <i class="fa fa-check-circle"></i>(<c:out value="${p.stock}"/>) Disponible
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa fa-lock"></i>(<c:out value="${p.stock}"/>) Agotado
                                                    </c:otherwise>
                                                </c:choose>


                                            </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div><!--features_items-->
            </div>
        </div>

        <a id="boton-elevar"></a>      
        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>

    </body>
</html>
