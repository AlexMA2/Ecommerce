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
        <title> Viva Salud |Registrate</title>
        <%@include file="WEB-INF/css.jsp"%>
        <link href="css/inicioSesionStyle.css" rel="stylesheet">

    </head>
    <body>
        <div class="header_top"><!--header_top-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="contactinfo">
                            <ul class="nav nav-pills">
                                <li><a href="#"><i class="fa fa-phone"></i> +51 903 087 821</a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i> info@vivasalud.com</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="social-icons pull-right">
                            <ul class="nav navbar-nav">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--/header_top-->
        <div class="bloque-total" id="area">
            <div class="left-login">
                <a href="index.jsp"><img src="images/home/vivaLogo.png" alt="" width="260" height="55"/></a>

            </div>  
            <div class="right-login">
                <div class="wrapper">
                    <form class="login" action="registro.jsp" method="POST">
                        <p class="title">Registrate <a href="inicioSesion.jsp"> ¿Ya tienes cuenta? Inicia Sesión </a></p>                    
                        <input type="text" placeholder="Nombre de usuario" name="campoUsuario" autofocus required/>
                        <input type="email" placeholder="Correo Electrónico" name="campoCorreo" required/>
                        <input type="password" placeholder="Contraseña" class="contrasenya" name="campoContrasenia" required/>                    
                        <input type="password" placeholder="Contraseña repetida"  class="contrasenya" name="campoContraseniaRepetida" required/>     
                        <input type="submit" name="btnRegistrar" value="Registrarte" id="button">
                    </form>


                </div>
            </div>
        </div>        
        <a class="ojo ojo-reg-uno"><i class="fa fa-eye" aria-hidden="true"></i></a>
        <a class="ojo ojo-reg-dos"><i class="fa fa-eye" aria-hidden="true"></i></a>   
        <%

            String nombre, contra, contraRepetida, email;

            if (request.getParameter("btnRegistrar") != null) {
                nombre = request.getParameter("campoUsuario");
                email = request.getParameter("campoCorreo");
                contra = request.getParameter("campoContrasenia");
                contraRepetida = request.getParameter("campoContraseniaRepetida");
                if (contra.equals(contraRepetida)) {
                    Usuario user = new Usuario(email, nombre, contra, 1);
                    if (UsuarioCad.registrar(user)) {
                        HttpSession sesion = request.getSession();
                        session.setAttribute("user", nombre);
                        session.setAttribute("niveli", "1");
                        session.setAttribute("userEmail", email);

                        response.sendRedirect("index.jsp");
                    } else {
        %>
        <div class="error-mensaje error-datos">
            <p>El nombre de usuario y/o el email ya esta uso. Porfavor, utiliza otra</p>
        </div>
        <%
            }
        } else {
        %>
        <div class="error-mensaje error-contra">
            <p>Las contraseñas son diferentes. Debes colocar el mismo texto en los campos "contraseña" y "contraseña repetida"</p>
        </div>
        <%
                }

            }
        %>
        <%@include file="WEB-INF/js.jsp" %>
        <script src="js/fondo-bolitas.js"></script>
    </body>
</html>
