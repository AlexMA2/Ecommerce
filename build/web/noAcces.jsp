
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Viva Salud |Cuenta</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity= "sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
        <link href="css/estilos.css" rel="stylesheet" type="txt/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/7d4952ef47.js" crossorigin="anonymous"></script>
        <link  rel="icon" href="images/favicon.png" type="image/png" sizes="32x32"/>        
        <style>
            .colors{
                background: #1CBACC !important;
                font-weight: bold !important;
                
            }
            #fotos{
                margin-top: 10px !important;
                
            }

        </style>

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light colors">
            <a class="navbar-brand" href="index.jsp">
                <img src="images/home/vivaLogo.png" width="150" height="40"/>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-danger my-2 my-sm-0" type="submit">Buscar</button>
                </form>
                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i>Cuenta
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="administracion.jsp"><i class="fas fa-user"></i>Mi cuenta</a>
                            <a class="dropdown-item" href="Cart"><i class="fas fa-truck"></i>Mis pedidos</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="noAcces.jsp"><i class="fas fa-pencil-alt"></i>Mis Reseñas</a>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="dropdown-item" href="Cart"><i class="fa fa-shopping-cart"></i> VER CARRITO</a>
                    </li>


                </ul>

            </div>
        </nav>
        <div class="container">
            <div class="row">

                <div class="col-4">
                    <button type="button"  onclick="location.href = 'Cart'"class="btn  btn-light "><i class="fas fa-truck"></i> Mis pedidos</button><p>
                        <button type="button" onclick="location.href = 'noAcces.jsp'" class="btn  btn-light "><i class="fas fa-pencil-alt"></i> Mis reseñas</button><p>
                        <button type="button" onclick="location.href = 'noAcces.jsp'" class="btn  btn-light "><i class="fas fa-certificate"></i> Mis cupones</button><p>
                    <hr>
                    <button type="button" onclick="location.href = 'administracion.jsp'" class="btn  btn-light "><i class="fas fa-user-cog"></i>Mis datos personales</button><p>
                        <button type="button" onclick="location.href = 'direccion.jsp'" class="btn  btn-light "><i class="fas fa-map-marked-alt"></i> Mis direcciones</button><p>
                        <button type="button" onclick="location.href = 'noAcces.jsp'" class="btn  btn-light "><i class="fab fa-cc-mastercard"></i> Mis tarjetas</button><p>
                    <hr>
                    <button type="button" onclick="location.href = 'noAcces.jsp'" class="btn  btn-light "><i class="fas fa-bell"></i> Mis suscripciones</button><p>
                        <button type="button" onclick="location.href = 'noAcces.jsp'" class="btn  btn-light "><i class="fas fa-user-plus"></i> Servicios plus</button><p>
                    <hr>
                    <button type="button" onclick="location.href = 'cerrar.jsp'" class="btn  btn-light "><i class="fas fa-sign-out-alt"></i> Salir</button><p>

                </div>
                <div class="col-6">
                    <p class="font-weight-lighter font-weight-bold text-center text-danger">Usted no tiene acceso a esta caraterística</p>
                    <hr>
                    <img id="fotos" src="images/noAccses.png" class="img-fluid " alt="Responsive image" width="400" height="400" >
                </div>




            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

    </body>
</html>
