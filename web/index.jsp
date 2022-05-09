<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="presentacion.Peticion"  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form action="http://127.0.0.1:3000/login" method="post">
        <section class="form-register">
            <h4>Formulario de ingreso</h4>
            <input class="controls" type="text" name="user" id="user" value="" placeholder="Ingrese su Usuario">
            <input class="controls" type="password" name="pass" id="pass" value="" placeholder="Ingrese su Contraseña">
            <button type="submit" class="btn btn-primary btn-lg btn-block"> Ingresar </button>            
        </section>
        </form>
</button>
    </body>
</html>
