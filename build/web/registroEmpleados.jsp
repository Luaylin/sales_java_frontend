<%-- 
    Document   : registroEmpleados
    Created on : 27/04/2022, 12:42:15 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="presentacion.Peticion"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Empleados</title>
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
        <form action="http://127.0.0.1:3000/createEmployee" method="post">
            <section class="form-register"> 
                <h1>Registrar Empleado</h1>
                <input class="controls" type="text" name="dni" id="dni" placeholder="Ingrese su DNI">
                <input class="controls" type="text" name="nombres" id="nombres" placeholder="Ingrese sus Nombre">
                <input class="controls" type="text" name="apellidos" id="apellidos" placeholder="Ingrese sus Apellidos">
                <input class="controls" type="text" name="edad" id="edad" placeholder="Ingrese su Edad">
                <input class="controls" type="text" name="direccion" id="direccion" placeholder="Ingrese su Direccion">
                <input class="controls" type="text" name="nro_celular" id="nro_celular" placeholder="Ingrese Numero de Celular">                 
                <select class="controls" name="cargo" id="cargo">
                    <option value="Administrador">Administrador</option>
                    <option value="Empleado">Empleado</option>
                </select>                  
                <input class="controls" type="text" name="usuario" id="usuario" placeholder="Ingrese un Usuario">
                <input class="controls" type="password" name="clave" id="contraseña" placeholder="Ingrese una Contraseña">
                <br>
                <button type="submit"> Ingresar Empleado</button>
            </section>
        </form>
        </br>
        </br>
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
                                    Nombres
                                </th>
                                <th>
                                    Apellidos
                                </th>
                                <th>
                                    DNI
                                </th>
                                <th>
                                    Direccion
                                </th>
                                <th>
                                    Edad
                                </th>
                                <th>
                                    Telefono
                                </th>
                                <th>
                                    Cargo
                                </th>
                                <th>
                                    Usuario
                                </th>
                                <th>
                                    Clave
                                </th>
                                <th>Acciones</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                            Peticion pet = new Peticion("getTrabajadores");
                            String[][] res = pet.getTrabajadores();
                            for (int i = 0; i < res.length; i++) {
                                out.println("<tr class=\"table-warning\">\n" +
"                                <td>\n" +
"                                    "+res[i][0]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][1]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][2]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][0]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][3]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][4]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][5]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][6]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][7]+"\n" +
"                                </td>\n" +
"                                <td>\n" +
"                                    "+res[i][8]+"\n" +
"                                </td>\n" +
"<td> <form action=\"http://127.0.0.1:3000/deleteTrabajadores\" method=\"post\"><input type=\"hidden\" id=\"id\" name=\"id\" value=\""+res[i][0]+"\"> <button type=\"submit\" class=\"btn btn-danger\">Eliminar</button></form></td></tr>");
                            }
                            %>
                        </tbody>
                    </table> 


                </div>
            </div>
        </div>
        </br>
        </br>
        <button type="button" class="btn btn-danger" onclick="location.href = 'Principal.jsp'" >
            Regresar
        </button>
        </br>
        </br>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
