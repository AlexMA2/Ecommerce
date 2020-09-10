<%@page import="javaFrejoles.DatosPersonales"%>
<%@page import="cad.DatosPersonalesCad"%>
<%@page import="java.util.List"%>
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
        <%! Usuario s;%>
        <%! DatosPersonales dt;%>
        <%
            
            if(session.getAttribute("user") != null){
                
                s = UsuarioCad.convertirAUsuario(session.getAttribute("user").toString());
               
                dt = DatosPersonalesCad.obtener(s.getId());               
                
            }
            else{
                s = new Usuario("", "", "", 0, "", 4);
               
                dt = new DatosPersonales(0, 0, "", "", "", 0);
            }
            

        %>
        <c:choose>
            <c:when test="${UsuarioCad.estaLogeado()}">
                <%@include file="WEB-INF/headerLogeado.jsp"%>
            </c:when>    
            <c:otherwise>
                <%@include file="WEB-INF/header.jsp"%>
            </c:otherwise>
        </c:choose>

        <section id="cart_items">
            <div class="container-checkout">
                <div class="breadcrumbs">
                    <ol class="breadcrumb">
                        <li><a href="Inicio">Home</a></li>
                        <li class="active">Check out</li>
                    </ol>
                </div><!--/breadcrums-->

                <div class="step-one">
                    <h2 class="heading">Proceso de pago</h2>
                </div>

                <div class="shopper-informations">
                    <div class="row">
                        <div class="col-sm-5 clearfix">                            
                            <p class="titulo-form">Datos Personales</p>
                            <div class="form-one">
                                <form class="mi-form">
                                    <input type="text" placeholder="Nombres" id="in-dp-nombres" name="nombres" value="<% if(dt != null) out.print(dt.getNombres()); %>">
                                    <input type="text" placeholder="Apellidos"  id="in-dp-apellidos" name="apellidos" value="<% if(dt != null) out.print(dt.getApellidos()); %>">
                                    <input type="text" placeholder="Email"  id="in-dp-email" name="email"  value="${userEmail}">                                    
                                    <input type="text" placeholder="DNI"  id="in-dp-dni" name="dni" value="<% if(dt != null) out.print(dt.getDNI()); %>">
                                    <input type="text" placeholder="Direccion"  id="in-dp-direccion" name="direccion" value="<% if(dt != null) out.print(s.getDireccion()); %>">
                                    <input type="text" placeholder="Teléfono Móvil"  id="in-dp-telefono" name="telefono" value="<% if(dt != null) out.print(dt.getTelefono()); %>" pattern="[0-9]{9}">
                                </form>
                                
                            </div>

                            <p class="titulo-form">Datos de la tarjeta</p>

                            <div class="form-one">

                                <form class="mi-form-dos">                                    

                                    <div class="form-one">
                                        <select id="tarjetas"  name="tarjeta">
                                            <option>-Tarjeta-</option>
                                            <option> MasterCard </option>
                                            <option> Visa </option>
                                            <option> Tarjeta oh!</option>                                               

                                        </select>
                                    </div>

                                    <input type="text" placeholder="N° de Tarjeta" id="in-dt-NTarjeta" name="numTarjeta">
                                    <input type="text" placeholder="Nombre del titular" id="in-dt-titular" name="titular">
                                    <div class="fila">                                        
                                        <div class="form-one">
                                            <select id="dt-mes" name="mes">
                                                <option>-Mes-</option>
                                                <option>01</option>
                                                <option>02</option>
                                                <option>03</option>
                                                <option>04</option>
                                                <option>05</option>
                                                <option>06</option>
                                                <option>07</option>
                                                <option>08</option>
                                                <option>09</option>
                                                <option>10</option>
                                                <option>11</option>
                                                <option>12</option>

                                            </select>
                                        </div>
                                        <div class="form-one">
                                            <select id="dt-anio" name="anio">
                                                <option>-Año-</option>
                                                <option>2020</option>
                                                <option>2021</option>
                                                <option>2022</option>
                                                <option>2023</option>
                                                <option>2024</option>
                                                <option>2025</option>
                                                <option>2026</option>
                                                <option>2027</option>
                                                <option>2028</option>
                                                <option>2029</option>
                                                <option>2030</option>
                                                <option>2031</option>
                                                <option>2032</option>
                                                <option>2033</option>
                                                <option>2034</option>
                                                <option>2035</option>

                                            </select>
                                        </div>
                                    </div>
                                    <input type="text" placeholder="CVV" id="in-dt-cvv" name="cvv">
                                </form>
                            </div>

                        </div>

                    </div>
                </div>
                <c:forEach items="${sessionScope.cart}" var="pro">
                    <c:set  var="total" value="${total+pro.p.precio*pro.cantidad}"/>        
                    <c:set  var="totalProd" value="${totalProd + pro.cantidad}"/>     
                </c:forEach>
                <div class="aside-productos">
                    <div class="productos-wrapper">
                        <h2> Resumen de tu orden </h2>
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
        </section> <!--/#cart_items-->

        <section id="do_action">
            <div class="container">
                <div class="row">

                    <div class="col-sm-10">
                        <div class="total_area">
                            <ul>
                                <li>Sub Total <span>${total}</span></li>
                                <li>Pago por Envío <span>${(Math.round((total*0.05) * 100) / 100)}</span></li>
                                <li><h3>Total <span>${total+(total*0.05)}</span></h3></li>
                            </ul> <!--/#cart_items-->
                            <a class="btn btn-default check_out" href="Cart">Cancelar pago</a>   
                            <form  class="confirmacion" action="checkout.jsp" method="POST">
                                <input type="submit" class="btn btn-default check_out" id="btn-confirmarpag" name="btnConfirmar" value="Confirmar pago"/>
                            </form>
                        </div>
                    </div>
                </div>
            </div>            

        </section>  
        <div class="overlay-ventana" id="ventana-em">         
            <div class="ventana-emergente">
                <a href="#" id="btn-cerrar-ventana" class="btn-cerrar-ventanaC"><i class="fa fa-times" aria-hidden="true"></i></a>
                <h4> Tu compra ha sido realizada con exito!</h4>              
            </div>                        
        </div>
        <div class="overlay-ventana" id="ventana-err">         
            <div class="ventana-emergente">
                <a href="#" id="btn-cerrar-ventanar" class="btn-cerrar-ventanaC"><i class="fa fa-times" aria-hidden="true"></i></a>
                <h4> Ha habido un error al ingresar algun dato</h4>              
            </div>                        
        </div>                    
        <%             
            if (request.getParameter("btnConfirmar") != null) {
               
               ArrayList<Item> cart = (ArrayList<Item>) session.getAttribute("cart");
               for(int i=0; i<cart.size(); i++){
                   Item item = cart.get(i);
                   Pago.eliminarProducto(item.getP(), item.getCantidad());
                    
               }
               if(session.getAttribute("user") != null){
                   //DatosPersonalesCad.save(s.getId(), , apellido, DNI, telefono);
               }
               session.setAttribute("pagado", "true");
               response.sendRedirect("confirmacion-pago.jsp");               
            }
            
        %>
        <%@include file="WEB-INF/footer.jsp" %>
        <%@include file="WEB-INF/js.jsp" %>

        <script src="js/confirmarPago.js"></script>
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