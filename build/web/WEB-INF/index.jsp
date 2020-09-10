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
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>VivaSalud |  Compra los mejores productos para tu salud</title>
        <%@include file="../WEB-INF/css.jsp"%>
    </head>
    <body>

        <%
            if (session.getAttribute("user") != null) {
                UsuarioCad.nombreUsuario = session.getAttribute("user").toString();
            }

        %>

        <%            
            if (session.getAttribute("cerrarSesion") != null && session.getAttribute("user") != null) {
                if (session.getAttribute("cerrarSesion").toString() == "true" && session.getAttribute("user") != null) {
                    UsuarioCad.cerrarSesion(session.getAttribute("user").toString());
                    session.setAttribute("cerrarSesion", null);
                    session.setAttribute("user", null);
                    session.setAttribute("userEmail", null);
                    session.setAttribute("niveli", null);
                    
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

        <%@include file="../WEB-INF/slider.jsp"%>

        <section>
            <div class="supercontainer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-3">

                        </div>
                        <div class="seccion-categorias">

                            <div class="titulo-wavy" data-text="Categoria">
                                <span style="--j:1;">C</span>
                                <span style="--j:2;">A</span>
                                <span style="--j:3;">T</span>
                                <span style="--j:4;">E</span>
                                <span style="--j:5;">G</span>
                                <span style="--j:6;">O</span>
                                <span style="--j:7;">R</span>
                                <span style="--j:8;">Í</span>
                                <span style="--j:9;">A</span>
                                <span style="--j:10;">S</span>
                            </div>
                            <div class="slider-categorias">
                                <span style="--i:1;"><a href="categoria.jsp?cat=5"><img src="images/giratorio/gel-logo.jpg" alt="1"></a></span>
                                <span style="--i:2;"><a href="categoria.jsp?cat=3"><img src="images/giratorio/botiquin.jpg" alt="2"></a></span>
                                <span style="--i:3;"><a href="categoria.jsp?cat=2"><img src="images/giratorio/ProteccionPersonal.jpg" alt="3"></a></span>
                                <span style="--i:4;"><a href="categoria.jsp?cat=4"><img src="images/giratorio/Cuidado.jpg" alt="3"></a></span>
                            </div>
                            <div class="piso primero"></div>

                        </div>
                        <div class="seccion-marcas">

                            <div class="titulo-wavy" data-text="Categoria">
                                <span style="--j:1;">M</span>
                                <span style="--j:2;">A</span>
                                <span style="--j:3;">R</span>
                                <span style="--j:4;">C</span>
                                <span style="--j:5;">A</span>                            
                                <span style="--j:6;">S</span>
                            </div>
                            <div class="slider-categorias">

                                <span style="--i:1;"><a href="marca.jsp?brand=1"><img src="images/fotos-2/sekurlogo2.jpg" alt="1"></a></span>
                                <span style="--i:2;"><a href="marca.jsp?brand=2"><img src="images/fotos-2/3m-logo2.jpg" alt="2"></a></span>
                                <span style="--i:3;"><a href="marca.jsp?brand=3"><img src="images/fotos-2/prosaclogo2.jpg" alt="3"></a></span>
                                <span style="--i:4;"><a href="marca.jsp?brand=4"><img src="images/fotos-2/avallogo2.jpg" alt="3"></a></span>

                            </div>
                            <div class="piso segundo"></div>
                        </div>

                        <div class="col-sm-12 padding-right">
                            <div class="features_items">
                                
                                <%! ArrayList<Producto> datos;%>
                                <h2 class="title text-center"> Protección Personal </h2>
                                <%                                    datos = ProductoCad.listarProductosPorCategoria(session.getAttribute("moneda").toString(), 2);

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
                                                    <a href="product-details.jsp?id=${p.webid}" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                    </div>
                                                    <div class="">
                                                       
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



                            </div>
                            <div class="features_items">

                                <h2 class="title text-center"> Artículos de Botiquín </h2>

                                <%

                                    datos = ProductoCad.listarProductosPorCategoria(session.getAttribute("moneda").toString(), 3);

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
                                                    <a href="product-details.jsp?id=${p.webid}" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                    </div>
                                                    <div class="">
                                                        
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
                                <br/>
                            </div>

                            <div class="features_items">
                                <h2 class="title text-center"> Artículos de cuidado personal </h2>
                                <%

                                    datos = ProductoCad.listarProductosPorCategoria(session.getAttribute("moneda").toString(), 4);

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
                                                    <a href="product-details.jsp?id=${p.webid}" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                    </div>
                                                    <div class="">
                                                        
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
                                <br>
                            </div>

                            <div class="features_items">
                                <h2 class="title text-center"> Gel Antibacterial </h2>
                                <%

                                    datos = ProductoCad.listarProductosPorCategoria(session.getAttribute("moneda").toString(), 5);

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
                                                    <a href="product-details.jsp?id=${p.webid}" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                    </div>
                                                    <div class="">
                                                        
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
                            </div>                            

                            <a id="boton-elevar"></a>                           


                            <div class="recommended_items">
                                <h2 class="title text-center">ARTICULOS RECOMENDADOS</h2>

                                <div id="recommended-item-carousel" class="carousel slide" data-ride="carousel">
                                    <div class="carousel-inner">
                                        <div class="item active">	
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recomendado1.jpg" alt="" />
                                                            <h2>S/40</h2>
                                                            <p>MASCARILLA DE COLORES x4</p>
                                                            <a href="product-details.jsp?id=28" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recomendado2.jpg" alt="" />
                                                            <h2>S/25</h2>
                                                            <p>GEL DUO PACK</p>
                                                            <a href="product-details.jsp?id=29" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recomendado3.jpg" alt="" />
                                                            <h2>S/20</h2>
                                                            <p>MASCARETA SIN DISEÑO</p>
                                                            <a href="product-details.jsp?id=27" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item">	
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recomendado1.jpg" alt="" />
                                                            <h2>S/40</h2>
                                                            <p>MASCARILLA DE COLORESx4u</p>
                                                            <a href="product-details.jsp?id=28" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recomendado2.jpg" alt="" />
                                                            <h2>S/25</h2>
                                                            <p>GEL DUO PACK</p>
                                                            <a href="product-details.jsp?id=29" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-sm-4">
                                                <div class="product-image-wrapper">
                                                    <div class="single-products">
                                                        <div class="productinfo text-center">
                                                            <img src="images/home/recomendado3.jpg" alt="" />
                                                            <h2>S/20</h2>
                                                            <p>MASCARETA SIN DISEÑO</p>
                                                            <a href="product-details.jsp?id=27" class="btn btn-default add-to-cart <c:if test="${p.stock==0}"> disabled </c:if>"><i class="fa fa-shopping-cart"></i>Ver Detalles</a>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a class="left recommended-item-control" href="#recommended-item-carousel" data-slide="prev">
                                        <i class="fa fa-angle-left"></i>
                                    </a>
                                    <a class="right recommended-item-control" href="#recommended-item-carousel" data-slide="next">
                                        <i class="fa fa-angle-right"></i>
                                    </a>			
                                </div>
                            </div>

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

                if (i === 0) {
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
