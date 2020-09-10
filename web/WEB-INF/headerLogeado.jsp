<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header id="header">
          
    <div class="header-middle">
        <div class="container-header">


            <div class="logo">
                <a href="index.jsp"><img src="images/home/vivaLogo.png" alt="" width="260" height="55"/></a>
            </div>
          
            <div class="shop-menu pull-right">
                <ul class="nav navbar-nav">
                    <li><a href="Inicio" class="active"><i class="fa fa-home"></i>INICIO</a></li>
                    <li><a href="nosotros.jsp"><i class="fa fa-book"></i>NOSOTROS</a></li>                    
                    <li><a href="Cart"><i class="fa fa-shopping-cart">
                                <%if(session.getAttribute("contador") != null){
                                %><span class="number-products">${fn:escapeXml(contador)}</span><%                                
                                }
                                else{
                                %><span class=""></span><%                             
                                }%></i> VER CARRITO</a></li>
                    <li><a href="#"><i class="fa fa-user"></i> MI CUENTA</a>
                        <ul class="sub-nav">
                            <div class="subnav-data">
                                <span> 
                                    ${user}
                                </span>
                                <span>
                                    ${userEmail}
                                </span>
                            </div>
                            <li><a href="administracion.jsp"> Ver perfil </a></li>
                            <li><a href="formas-pago.jsp"> Métodos de pago </a></li>
                            
                            <li><a href="Cart"> Historial de compras </a></li>
                            
                            <li><a href="cerrar.jsp"> Cerrar Sesion </a></li>
                        </ul>                                    
                    </li>        
                </ul>
            </div>

        </div>
    </div><!--/header-middle-->
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

</header><!--/header-->