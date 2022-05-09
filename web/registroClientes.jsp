<%-- 
    Document   : registroClientes
    Created on : 27/04/2022, 11:39:56 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="presentacion.Peticion"  %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Clientes</title>
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
        <form action="http://127.0.0.1:3000/createClients" method="post">
            <section class="form-register"> 
            <h1>Registrar Clientes</h1>
            <input class="controls" type="text" name="dni" id="dni" placeholder="Ingrese su DNI">
            <input class="controls" type="text" name="nombres" id="nombres" placeholder="Ingrese sus Nombres">
            <input class="controls" type="text" name="apellidos" id="apellidos" placeholder="Ingrese sus Apellidos">        
            <select class="controls" name="sexo" id="sexo">
                            <option value="Femenino">Femenino</option>
                            <option value="Masculino">Masculino</option>
                    </select>   
             <input class="controls" type="text" name="telefono" id="telefono" placeholder="Ingrese Numero de Telefono">
             <input class="controls" type="text" name="email" id="email" placeholder="Ingrese su E-mail"> 
             <input class="controls" type="text" name="direccion" id="direccion" placeholder="Ingrese su Direccion">     
                   <br>
                <button type="submit"> Ingresar Cliente</button>
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
							Nombres
						</th>
						<th>
							Apellidos
						</th>
						<th>
							Genero
						</th>
                                                <th>
							DNI
						</th>
                                                <th>
							Telefono
						</th>
                                                <th>
							Email
						</th>
                                                <th>
							Dirección
						</th>
                                                <th>
                                                    Acciones
                                                </th>
					</tr>
				</thead>
				<tbody>
                                <%
                            Peticion pet = new Peticion("getClientes");
                            String[][] res = pet.getClientes();
                            for (int i = 0; i < res.length; i++) {
                                out.println("<tr class=\"table-success\">\n" +
"        <td>\n" +
"                "+res[i][0]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][1]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][2]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][3]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][0]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][4]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][5]+"\n" +
"        </td>\n" +
"        <td>\n" +
"                "+res[i][6]+"\n" +
"        </td>\n" +
"<td> <form action=\"http://127.0.0.1:3000/deleteCliente\" method=\"post\"><input type=\"hidden\" id=\"id\" name=\"id\" value=\""+res[i][0]+"\"> <button type=\"submit\" class=\"btn btn-danger\">Eliminar</button></form></td></tr>");
                            }
                                
                            %>
					
				</tbody>
			</table> 
			<button type="button" class="btn btn-danger" onclick="location.href='Principal.jsp'" >
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
