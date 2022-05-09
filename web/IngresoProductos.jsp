<%-- 
    Document   : IngresoProductos
    Created on : 27/04/2022, 12:55:41 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="presentacion.Peticion"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingreso de Productos</title>
        <!--JQUERY-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

        <!-- FRAMEWORK BOOTSTRAP para el estilo de la pagina-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <!-- Los iconos tipo Solid de Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/solid.css">
        <script src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>
        <link rel="stylesheet" href="style1.css">
        <style>
            body{
                background-image: url('fondo1.JPG');
            }
        </style>
    </head>
    <body>
        <form action="http://127.0.0.1:3000/createProducts" method="post">
        <section class="form-register"> 
            <h1>Ingresar Producto</h1>
            <input class="controls" type="text" name="codigo" id="codigo" placeholder="Codigo">
            <input class="controls" type="text" name="nombre" id="nombre" placeholder="Nombre">
            <select class="controls" name="tipoproducto" id="tipoproducto">
                <option value="Perifericos">Perifericos</option>
                <option value="Software">Software</option>
            </select>  
            <input class="controls" type="text" name="marca" id="marca" placeholder="Marca">
            <input class="controls" type="text" name="precio" id="precio" placeholder="Ingrese el Precio Unitario">
            <input class="controls" type="text" name="stock" id="stock" placeholder="Ingrese Unidades en Stock">
            <label class="controls" type="text" name="descripcion" id="descripcion" for="descripción" >
                <textarea name="descripcion" id="descripcion" rows="6" cols="100" placeholder="Descripción"></textarea>
            </label>
            <br>
            <button type="submit"> Grabar</button>
        </section>
            </form>
        <br>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>
                                    Codigo
                                </th>
                                <th>
                                    Tipo
                                </th>
                                <th>
                                    Marca
                                </th>
                                <th>
                                    Nombre
                                </th>
                                <th>
                                    Descripcion
                                </th>
                                <th>
                                    Precio
                                </th>
                                <th>
                                    Stock
                                </th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            Peticion pet = new Peticion("getProductos");
                            String[][] res = pet.getProducto();
                            for (int i = 0; i < res.length; i++) {
                                out.println("<tr class=\"table-success\">\n" +
"						<td>\n" +
"							"+res[i][0]+"\n" +
"						</td>\n" +
"						<td>\n" +
"							"+res[i][1]+"\n" +
"						</td>\n" +
"						<td>\n" +
"							"+res[i][2]+"\n" +
"						</td>\n" +
"						<td>\n" +
"							"+res[i][3]+"\n" +
"						</td>\n" +
"                                                 <td>\n" +
"							"+res[i][4]+"\n" +
"						</td>\n" +
"                                                <td>\n" +
"							"+res[i][5]+"\n" +
"						</td>\n" +
"                                                <td>\n" +
"							"+res[i][6]+"\n" +
"						</td>\n" +
"<td> <form action=\"http://127.0.0.1:3000/deleteProducto\" method=\"post\"><input type=\"hidden\" id=\"id\" name=\"id\" value=\""+res[i][0]+"\"> <button type=\"submit\" class=\"btn btn-danger\">Eliminar</button></form></td></tr>");
                            }%>

                        </tbody>
                    </table> 
                    <button type="button" class="btn btn-danger" onclick="location.href = 'Principal.jsp'" >
                        Regresar
                    </button>
                </div>
            </div>
        </div> 

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    </body>
</html>
