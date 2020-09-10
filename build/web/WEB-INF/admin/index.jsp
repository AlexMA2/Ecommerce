<%@page import="cad.UsuarioCad"%>
<%@page import="cad.MarcaCad"%>
<%@page import="javaFrejoles.Marca"%>
<%@page import="cad.CategoriaCad"%>
<%@page import="javaFrejoles.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Gestion de Productos|  Compra los mejores productos para tu salud</title>
        <%@include file="../../WEB-INF/css.jsp"%>
    </head><!--/head-->

    <body>

        <%
            if (session.getAttribute("user") == null || session.getAttribute("niveli") != "2" ) {
                response.sendRedirect("Inicio");
            }

        %>
        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="../headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="../header.jsp"%>
            </c:otherwise>
        </c:choose>       

        <section class="panel-admin">
            <div class="container">
                <div class="row">

                    <div class="col-sm-10 padding-right">
                        ${mensaje}
                        <h3>Gestionar Producto</h3>
                        <form action="ControlProducto" enctype="multipart/form-data" method="post">
                            <div class="form-one">
                                Nombre: </br>
                                <input type="text" name="nombre" placeholder="Nombre Producto" value="" required/></br>
                                <div class="seccion precio">
                                    <div class="soles">
                                        Precio(S/):</br>
                                        <input type="number" step="any" name="precio" placeholder="Precio" value="0" min="0" id="precio-soles"/></br>
                                        Precio Promo(S/):</br>
                                        <input type="number" step="any" name="precionuevo" placeholder="Precio" value="0" min="0" id="precio-promo-soles"/></br>
                                        <hr/>
                                    </div>

                                    <div class="dolares">
                                        Precio(USD):</br>
                                        <input type="number" step="any" name="preciousd" placeholder="Precio" value="0" min="0" id="precio-dolares"/></br>
                                        Precio Promo(USD):</br>
                                        <input type="number" step="any" name="precionuevousd" placeholder="Precio" value="0" min="0" id="precio-promo-dolares" /></br>
                                        <hr/>
                                    </div>
                                </div>
                                <div class="seccion stock">
                                    Stock: </br>
                                    <input type="number" name="cantidad" placeholder="Cantidad" value="0" min="0"/></br>

                                </div>
                                <div class="seccion">
                                    Marca:</br>
                                    <select name="marca">
                                        <option>Seleccionar Marca</option>
                                        <% for (Marca c : MarcaCad.listarTodoDeMarcas()) {%>

                                        <option value="<%= c.getCodigo()%>"><%= c.getNombre()%></option>
                                        <%}%>

                                    </select></br>
                                </div>
                                <div class="seccion">
                                    Categoria:</br>
                                    <select name="categoria">
                                        <option>Seleccionar Categoria</option>
                                        <% for (Categoria c : CategoriaCad.listarTodoDeCategorias()) {%>

                                        <option value="<%= c.getCodigo()%>"><%= c.getNombre()%></option>
                                        <%}%>
                                    </select></br>
                                </div>
                                <div class="seccion">
                                    Descripcion: </br>
                                    <textarea name="descripcion" rows="4" cols="20" placeholder="Descripcion" required>
                                    </textarea></br>
                                </div>
                                <div class="seccion casillas">
                                    Nuevo: <input type="checkbox" name="nuevo" value="ON" checked="checked" /></br>
                                    Recomendado: <input type="checkbox" name="recomendado" value="ON"/></br>
                                    Visible: <input type="checkbox" name="visible" value="ON" checked="checked" /></br>

                                </div>
                                Seleccionar Imagen:<input type="file" name="imagen" value="Seleccionar una imagen " required />
                                <hr/>

                                <input class="btn btn-success" name="accion" type="submit" value="Registrar" />
                                <input class="btn btn-default" name="accion" type="submit" value="Consultar" />
                                <input class="btn btn-warnings" name="accion" type="submit" value="Actualizar" />
                                <input class="btn btn-danger" name="accion" type="submit" value="Borrar" />
                            </div>
                        </form>


                    </div>
                </div>
            </div>
        </section>

        <%@include file="../../WEB-INF/footer.jsp" %>
        <%@include file="../../WEB-INF/js.jsp" %>

        <script>
            var element1 = document.querySelector('.shop-menu ul li');            
            var i = 0;
            while (element1) {                 
                subE = element1.firstElementChild;                
                
                if(i === 0){
                    subE.className += "active";
                }
                else{
                    subE.className -= "active";
                }
                element1 = element1.nextElementSibling;
                i++;
            }

        </script>
        
    </body>
</html>
