<%-- 
    Document   : ventas
    Created on : 8 may. 2022, 15:56:39
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="presentacion.Peticion"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link rel="stylesheet" href="style1.css">
    </head>
    <body>
        <br>
        <div class="px-4">
        <h1>Ventas</h1>
        <hr>
        <br>
        <a href="registrarVenta.jsp" class = "btn btn-primary mb-3">Registrar Nueva Venta</a>
    
                
                    <%
                        Peticion pet = new Peticion("getVentas");
                        String[][] res = pet.getVentas();
                        if(res.length<=0){
                        out.println("<center><h2>Sin ventas!</h2></center>");
                        }
                        for (int i = 0; i < res.length; i++) {
                        if(i==0){
                            out.println("<table id = \"sales\" class = \"table mt-4\">\n" +
"        <thead>\n" +
"            <tr>\n" +
"                <th scope=\"col\" class=\"text-primary\">ID</th>\n" +
"                <th scope=\"col\" class=\"text-primary\">Cliente</th>\n" +
"                <th scope=\"col\" class=\"text-primary\">Vendedor</th>\n" +
"                <th scope=\"col\" class=\"text-primary\">Total</th>\n" +
"                <th scope=\"col\" class=\"text-primary\">Fecha</th>\n" +
"                <th scope=\"col\" class=\"text-primary\">Acciones</th>\n" +
"            </tr>\n" +
"        </thead>\n" +
"        <tbody>");
                        }
                            out.println("<tr>\n" +
"                    <td>"+res[i][0]+"</td>\n" +
"                    <td>"+res[i][1]+"</td>\n" +
"                    <td>"+res[i][2]+"</td>\n" +
"                    <td>S/. "+res[i][3]+"</td>\n" +
"                    <td>"+res[i][4]+"</td>\n" +
"                    <td>\n" +
"                                            \n" +
"                            <div class = \"row\"><form action=\"verVenta.jsp\"> <input type=\"hidden\" id=\"id\" name=\"id\" value=\""+res[i][0]+"\"> <button type=\"submit\" class=\"btn btn-success\"><i class=\"fa fa-eye\"></i></a> </form>\n" +
"                            <form action=\"http://127.0.0.1:3000/eliminarVenta\" method=\"POST\"><input type=\"hidden\" id=\"id\" name=\"id\" value=\""+res[i][0]+"\"><button type = \"submit\" class = \"btn btn-danger\"><i class=\"fa fa-trash\"></i></button></div>\n" +
"                        </form>\n" +
"                    </td>\n" +
"                </tr>");
                        }
                        out.println("</tbody> </table>");
                    %>
                    <br>
                <br>
                <button type="button" class="btn btn-danger" onclick="location.href = 'Principal.jsp'" >
            Regresar
        </button>
                <br>
                <br>
        </div>
    </body>
</html>
