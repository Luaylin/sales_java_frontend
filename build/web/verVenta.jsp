<%-- 
    Document   : verVenta
    Created on : 8 may. 2022, 19:00:42
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
        <%
String id=request.getParameter("id");
Peticion petVen = new Peticion("getVenta/"+id);
String[] ven = petVen.getVenta();
petVen = new Peticion("getDetallesVenta/"+id);
String[][] det = petVen.getDetallesVenta();
%>
<div style="padding: 10px 50px 20px">
    <br>
    <h4>Detalles de Venta</h4>
    <hr>
 <div class = "row">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <div class="form-group">
                <label for="typeDoc">Cliente:</label>
                <input type="text" class="form-control" id="typeDoc" disabled value="<%=ven[0]%>">
            </div>
        </div>
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <div class="form-group">
                <label for="document">Vendedor:</label>
                <input type="text" name="document" id="document" class="form-control" disabled value="<%=ven[1]%>">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
            <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                <thead style="background-color:#A9D0F5">
                    <th>Artículo</th>
                    <th>Cantidad</th>
                    <th>Precio Unitario</th>
                    <th>SubTotal</th>
                </thead>
                <tfoot>
                    <tr>
                        <th>Total</th>
                        <th></th>
                        <th></th>
                        <th><h4 id="total"><%="S/. "+ven[2]%></h4></th>
                    </tr>
                </tfoot>
                <tbody>
                    <% 
                        for(int i=0; i<det.length; i++){
                            out.println("<tr>\n" +
"                            <td>"+det[i][0]+"</td>\n" +
"                            <td>"+det[i][1]+"</td>\n" +
"                            <td>"+det[i][2]+"</td>\n" +
"                            <td>S/. "+String.valueOf(Double.parseDouble(det[i][1])*Double.parseDouble(det[i][2]))+"</td>\n" +
"                        </tr>");
                        }
                    %>    
                </tbody>
            </table>
        </div>
    </div>
    <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <div class="form-group">
                <a href="ventas.jsp" class="btn btn-success">Volver</a>
            </div>
    </div>
    </div>
    </body>
</html>
