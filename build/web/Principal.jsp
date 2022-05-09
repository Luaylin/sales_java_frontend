<%-- 
    Document   : Principal
    Created on : 26/04/2022, 10:40:28 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <style>
            body{
    background-image: url('principal.jpg');
         }
        </style>
         <script>
            function cerrarse(){
                window.close()
            }
            </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <ul class="nav">
                        <li class="nav-item ">
                            <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown">Registro</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#" onclick="location.href='registroEmpleados.jsp'">Registro Empleado</a> 
                                <a class="dropdown-item" href="#" onclick="location.href='registroClientes.jsp'">Registro Cliente</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown">Mantenimiento</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="#" onclick="location.href='IngresoProductos.jsp'">Ingreso de Productos</a> 
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="location.href='ventas.jsp'">Ventas</a> 
                        </li>
                        <li class="nav-item dropdown ml-md-auto">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown">Mas Opciones</a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="/Sema14_proyectoFinal">Salir</a>

                            </div>
                        </li>
                    </ul>
                    <br>
                    <div class="jumbotron">
                        <h2>
                            <center> Bienvenidos al Sistema de registro de Inventario</center>
                        </h2>
                        <p>
                        <div class="col-md-12">
                            <center><img alt="imgen" src="https://img.freepik.com/vector-gratis/programadores-navegador-windows-pc-tableta-compatibilidad-navegadores-navegadores-cruzados-concepto-compatible-navegadores-sobre-fondo-blanco-ilustracion-aislada-violeta-vibrante-brillante_335657-328.jpg?t=st=1651597823~exp=1651598423~hmac=64a344d2b974fa55311871a04385832b5ab9804f2f0b5544b19c95413245870f&w=1060" /></center>
                        </div>
                        </p>

                    </div>
                </div>
            </div>
        </div>

       
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
