<%@page import="cad.MarcaCad"%>
<%@page import="cad.CategoriaCad"%>

<%@page import="javaFrejoles.Categoria"%>

<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="left-sidebar">
    
    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
        <h2>Categorias </h2>
        <div class="brands-name">
            <ul class="nav nav-pills nav-stacked">
                <c:forEach var="m" items="<%= CategoriaCad.listarTodoDeCategorias()%>">
                    <c:set var="cod" value="${m.codigo}"/>
                    <li class="text-center"><a href="categoria.jsp?cat=${fn:escapeXml(m.codigo)}"><span class="pull-right"></span>${m.nombre}</a></li>
                </c:forEach>
            </ul>
        </div>

    </div><!--/category-products-->

    <div class="brands_products"><!--brands_products-->
        <h2>Marcas</h2>
        <div class="brands-name">
            <ul class="nav nav-pills nav-stacked">
                <c:forEach var="m" items="<%= MarcaCad.listarTodoDeMarcas()%>">                    
                    <c:set var="cod" value="${m.codigo}"/>
                    <li class="text-center"><a href="marca.jsp?brand=${fn:escapeXml(m.codigo)}"><span class="pull-right"></span>${m.nombre}</a></li>
                </c:forEach>
            </ul>
        </div>
    </div><!--/brands_products-->

    <div class="shipping text-center"><!--shipping-->
        <img src="images/home/Publicidad.png" alt="" />
    </div><!--/shipping-->

</div>