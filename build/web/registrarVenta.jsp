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
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    </head>
    <body>
        <br>
        <div style="padding: 10px 50px 20px">
            <h4>Registrar Venta</h4>
            <hr>
            <br>
        <form action="http://127.0.0.1:3000/crearVenta" method="POST" id="sendPetition">
    <div class = "row">
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
            <div class="form-group">
                <label for="trabajador">Trabajador:</label>
                <select id="trabajador" name="trabajador" class="form-control selectpicker" form = "sendPetition" data-show-subtext="true" data-live-search="true">
                <%
                    Peticion petTra = new Peticion("getTrabajadores");
                    String[][] tra = petTra.getTrabajadores();
                    for (int i = 0; i < tra.length; i++) {
                        out.println("<option value=\""+tra[i][0]+"\">"+tra[i][0]+" - "+tra[i][1]+" "+tra[i][2]+"</option>");
                    }
                %>
                </select>   
            </div>
        </div>
        <div class="col-lg-6 col-sm-6 col-md-6 col-xs-6">
            <div class="form-group">
                <label for="client">Cliente:</label>
                <select id="client" name="client" class="form-control selectpicker" form = "sendPetition" data-show-subtext="true" data-live-search="true">
                <%
                    Peticion petCli = new Peticion("getClientes");
                    String[][] cli = petCli.getClientes();
                    for (int i = 0; i < cli.length; i++) {
                        out.println("<option value=\""+cli[i][0]+"\">"+cli[i][0]+" - "+cli[i][1]+" "+cli[i][2]+"</option>");
                    }
                %>
                </select>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-7 col-sm-7 col-md-7 col-xs-7">
            <div class="form-group">
                <label for="pproductos">Producto:</label>
                <select id="pproductos" name="pproductos" class="form-control selectpicker" form = "sendPetition" data-show-subtext="true" data-live-search="true">
                <%
                    Peticion pet = new Peticion("getProductos");
                    String[][] res = pet.getProducto();
                    for (int i = 0; i < res.length; i++) {
                        out.println("<option value=\""+res[i][0]+"_"+res[i][5]+"_"+res[i][6]+"_"+res[i][3]+" - "+res[i][2]+"\">"+res[i][0]+" - "+res[i][3]+" - "+res[i][2]+"</option>");
                    }
                %>
                </select>                
            </div>
        </div>
        <div class="col-lg-1 col-sm-1 col-md-1 col-xs-12">
            <div class="form-group">
                <label for="quantity">Cantidad:</label>
                <input type="number" step="1" min="1" class="form-control" id="quantity" value="1">
            </div>
        </div>
        <div class="col-lg-3 col-sm-3 col-md-3 col-xs-12">
            <div class="form-group">
                <label for="price">Precio unitario:</label>
                <input type="number" step="any" min="0" class="form-control" id="price" value="0.0" disabled>
            </div>
        </div>
        <div class="col-lg-1 col-sm-1 col-md-1 col-xs-12">
            <div class="form-group">
                <br>
                <button id="bt_add" type="button" class="btn btn-primary">Agregar</button>
            </div>
        </div>
        <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
            <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                <thead style="background-color:#A9D0F5">
                    <th>¿Eliminar?</th>
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
                        <th></th>
                        <th><h4 id="total">S/. 0.00</h4></th>
                    </tr>
                </tfoot>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <div class="col-lg-6 col-sm-6 col-md-6 col-xs-12">
            <div class="form-group">
                <button class="btn btn-primary" id="guardar" type="submit">Guardar</button>
                <a href="ventas.jsp" class="btn btn-danger">Cancelar</a>
            </div>
    </div>
</form>
        </div>
                
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
    <script>
        $(document).ready(function(){
            $("#guardar").hide();
            $("#amount").val(0.0);
            $("#pproductos").change(showValues);
            showValues();
            $('#bt_add').click(function(){
                agregar();
            });
            $('#bt_descont').click(function(){
                aplicarDescuento();
            });
        });

        var cont=0;
        total=0;
        subtotal=[];
        
        function showValues(){
            datos=document.getElementById('pproductos').value.split('_');
            console.log(datos)
            $("#stock").val(datos[3]);
            $("#price").val(datos[1]);
        }

        function agregar(){
            description=document.getElementById('pproductos').value.split('_');
            quantity=$("#quantity").val();
            price=$("#price").val();

            if(description !=="" && (quantity!=="" && quantity>0) && (price!=="" && price>=0)){
                subtotal[cont] = (quantity*price);
                total=total+subtotal[cont];
                var fila='<tr class="selected" id="fila'+cont+'"><td><center><button type="button" class="btn btn-danger" onclick="eliminar('+cont+');">X</button></center></td><td><input type="hidden" name="pid[]" value="'+description[0]+'"><input type="hidden" name="pdescription[]" value="'+description[3]+'">'+description[3]+'</td><td><input type="hidden" name="quantities[]" value="'+quantity+'">'+quantity+'</td><td><input type="hidden" name="prices[]" value="'+price+'">'+price+'</td><td>'+subtotal[cont]+'</td></tr>';
                cont++;
                limpiar();
                $("#amount").val(total);
                $("#total").html("S/. "+total);
                $("#impuest").val((total*0.18).toFixed(2));
                $("#igv").html("S/. "+(total*0.18).toFixed(2));
                evaluar();
                $("#detalles").append(fila);
            } else {
                alert("Revise los datos del articulo a ingresar");
            }
        }

        function aplicarDescuento(){
            //recalcula el total
            descuento = $("#descuento").val();
            if (descuento<total){
                total = 0;
                subtotal.forEach(element => {
                    total+=element
                });
                
                total = total-descuento;
                $("#total").html("S/. "+total);
                $("#igv").html("S/. "+(total*0.18).toFixed(2));
                $("#descuentos").html("S/. "+descuento);
                $("#descont").val(descuento);
                $("#impuest").val((total*0.18).toFixed(2));
                $("#amount").val(total);
            } else {
                alert("Ingrese un descuento menor al precio final")
            }
            
        }

        function limpiar(){
            $("#quantity").val(1);
        }

        function evaluar(){
            if(total>0){
                $("#guardar").show();
            } else{
                $("#guardar").hide();
            }
        }

        function eliminar(index){
            total=total-subtotal[index];
            subtotal.splice(index,1);
            $("#total").html("S/. "+total);
            $("#fila"+index).remove();
            evaluar();
        }
    </script>
    </body>
</html>
