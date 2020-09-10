
<%@page import="javaFrejoles.Usuario"%>
<%@page import="cad.UsuarioCad"%>
<%@page import="java.sql.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title> Viva Salud |Inicio de Sesión</title>
        <%@include file="/WEB-INF/css.jsp"%>
        <link href="css/inicioSesionStyle.css" rel="stylesheet">
    </head>
    <body>
        <div class="header_top"><!--header_top-->
            <div class="container-header">

                <div class="contactinfo">
                    <ul class="nav nav-pills">
                        <li><a href="#"><i class="fa fa-phone"></i> +51 903 087 821</a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i> info@vivasalud.com</a></li>
                    </ul>
                </div>

                <div class="social-icons pull-right">
                    <ul class="nav navbar-nav">
                        <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    </ul>
                </div>

            </div>
        </div><!--/header_top-->
        <div class="bloque-total" id="area">

            <div class="left-login">
                <a href="index.jsp"><img src="images/home/vivaLogo.png" alt="" width="260" height="55"/></a>

            </div>
            <div class="right-login">
                <div class="wrapper">
                    <form class="login" action="inicioSesion.jsp" method="POST">
                        <p class="title">Inicia Sesión <a href="registro.jsp">¿No tienes cuenta? Registrate</a></p>                

                        <input type="text" placeholder="Nombre de usuario" name="campoUsuario" autofocus required/>

                        <input type="password" placeholder="Contraseña" name="campoContrasenia" class="contrasenya" required/>

                        <a href="#">¿Olvidaste tu contraseña?</a>

                        <input type="submit" name="btnIngresar" value="Ingresar" id="button">
                    </form>

                </div>
            </div>
        </div>
        <a class="ojo"><i class="fa fa-eye" aria-hidden="true"></i></a>
        <%

            String nombre, contra;

            if (request.getParameter("btnIngresar") != null) {

                nombre = request.getParameter("campoUsuario");
                contra = request.getParameter("campoContrasenia");
                if (UsuarioCad.logear(nombre, contra)) {
                    HttpSession sesion = request.getSession();
                    Usuario usuario = UsuarioCad.obtenerUsuario(nombre);
                    switch (usuario.getNivel()) {
                        case 1:
                            session.setAttribute("user", nombre);
                            session.setAttribute("niveli", "1");
                            session.setAttribute("userEmail", usuario.getEmail());
                            response.sendRedirect("index.jsp");
                            break;
                        case 2:
                            session.setAttribute("user", nombre);
                            session.setAttribute("niveli", "2");
                            session.setAttribute("userEmail", usuario.getEmail());
                            response.sendRedirect("admin");
                            break;
                    }

                } else {
        %>
        <div class="error-mensaje">
            <p>             
                El nombre de usuario y/o la contraseña que has introducido son incorrectos.
            </p>

        </div>
        <%
                }

                /* Probar colocar una alerta*/
            }


        %>
        
        <%@include file="WEB-INF/js.jsp" %>
        <script src="js/fondo-bolitas.js"></script>
    </body>
</html>
