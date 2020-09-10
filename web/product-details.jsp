<%@page import="cad.MarcaCad"%>
<%@page import="javaFrejoles.Usuario"%>
<%@page import="javaFrejoles.Producto"%>
<%@page import="cad.UsuarioCad"%>
<%@page import="cad.ProductoCad"%>
<%@page import="cad.CategoriaCad"%>
<%@page import="javaFrejoles.Categoria"%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Product Details | E-Shopper</title>
        <%@include file="WEB-INF/css.jsp"%>
    </head><!--/head-->

    <body>

        <%!Producto producto;%>

        <%

            int id = Integer.parseInt(request.getParameter("id"));
            producto = ProductoCad.obtenerProducto(id);

        %>


        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="WEB-INF/headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="WEB-INF/header.jsp"%>
            </c:otherwise>
        </c:choose>   
        <section>
            <div class="container">
                <div class="row">
                    <div class="col-sm-3">
                        <%@include file="WEB-INF/izquierda.jsp"%>
                    </div>

                    <div class="col-sm-9 padding-right">
                        <div class="product-details"><!--product-details-->


                            <div class="col-sm-5">
                                <div class="view-product">
                                    <img src="foto/<%=producto.getImg()%>" alt="" width="330" height="306" />
                                    
                                </div>
                                <div id="similar-product" class="carousel slide" data-ride="carousel">

                                    <!-- Wrapper for slides -->


                                  
                                </div>

                            </div>
                            <div class="col-sm-7">
                                <div class="product-information"><!--/product-information-->
                                    
                                    <h2> <%=producto.getNombre()%> </h2>
                                    <p>Web ID: <%=producto.getWebid()%>  </p>
                                    <img src="images/product-details/rating.png" alt="" />
                                    <span>
                                        <span>${sessionScope.moneda} <%=producto.getPrecio()%></span>
                                        
                                        <button type="button" class="btn btn-light cart">
                                            <a href="Cart?id=<%=producto.getWebid()%>&action=order" class="btn btn-default add-to-cart">
                                                <i class="fa fa-shopping-cart"></i>
                                                Añadir al carrito
                                            </a>
                                        </button>

                                    </span>
                                    <p><b>Disponible: </b> <%=producto.getStock()%></p>
                                    <p><b>Condición: </b> <%out.print((producto.isNuevo()?"Nuevo":"No tan nuevo"));%> </p>
                                    <p><b>Marca: </b> <%=MarcaCad.obtenerMarca(producto.getCodigo_marca()).getNombre()%> </p>
                                    <a href=""><img src="images/product-details/share.png" class="share img-responsive"  alt="" /></a>
                                </div><!--/product-information-->
                            </div>

                        </div><!--/product-details-->

                        <div class="category-tab shop-details-tab"><!--category-tab-->
                            <div class="col-sm-12">
                                <ul class="nav nav-tabs">
                                    
                                    <li class="active"><a href="#reviews" data-toggle="tab">Reseñas </a></li>
                                </ul>
                            </div>
                            <div class="tab-content">
                      
                                <div class="tab-pane fade active in" id="reviews" >
                                    <div class="col-sm-12">
                                        <ul>
                                            <li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
                                            <li><a href=""><i class="fa fa-clock-o"></i>1:53 PM</a></li>
                                            <li><a href=""><i class="fa fa-calendar-o"></i>05 AGO 2020</a></li>
                                        </ul>
                                        <p> 
                                            Excelente servicio!. El producto ha llegado bastante rapido y sin problemas. He comprado este producto ayer y me ha llegado hoy. Exactamente luego de
                                            9 horas de haberlo solicitado. El producto esta en perfectas condiciones, no tenia ningun defecto y estaba tal y como muestra en la imagen.
                                        </p>
                                        <p><b>Escribe tu reseña</b></p>

                                        <form action="#">
                                            <span>
                                                <input type="text" placeholder="Tu nombre" required/>
                                                <input type="email" placeholder="Direccion de correo electrónico" required/>
                                            </span>
                                            <textarea></textarea>

                                            <b>Popularidad: </b> <img src="images/product-details/rating.png" alt="" />
                                            <button type="submit" class="btn btn-default pull-right">
                                                Enviar
                                            </button>
                                        </form>
                                    </div>
                                </div>

                            </div>
                        </div><!--/category-tab-->


                    </div>
                </div>
            </div>
        </section>

        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>
    </body>
</html>