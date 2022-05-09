/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package presentacion;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import org.json.JSONObject;

/**
 *
 * @author Usuario
 */
public class Peticion {
    private final String backend = "http://127.0.0.1:3000";
    private String method;

    public Peticion(String method) {
        this.method = method;
    }
    
    private JSONObject sendHttpRequest(){
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
                        .uri(URI.create("http://127.0.0.1:3000/"+this.method))
                        .POST(HttpRequest.BodyPublishers.ofString(""))
                        .build();
        HttpResponse<String> response;
        try {
            response = client.send(request,
                HttpResponse.BodyHandlers.ofString());
        } catch (Exception e) {
            response = null;
        }
        JSONObject jo = new JSONObject(response.body());
        //System.out.println(jo.getJSONArray("data").get(0));
        return jo;
    }
    
    public String[][] getTrabajadores(){
        JSONObject response = sendHttpRequest();
        String[][] data = new String[response.getJSONArray("data").length()][9];
        for (int i = 0; i < response.getJSONArray("data").length(); i++) {
            JSONObject response2 = new JSONObject(response.getJSONArray("data").get(i).toString());
            data[i][0]=response2.getString("dni");
            data[i][1]=response2.getString("nombre");
            data[i][2]=response2.getString("apellidos");
            data[i][3]=response2.getString("direccion");
            data[i][4]=String.valueOf(response2.getInt("edad"));
            data[i][5]=response2.getString("nro_celular");
            data[i][6]=response2.getString("cargo");
            data[i][7]=response2.getString("usuario");
            data[i][8]=response2.getString("clave");
        }
        return data;
    }
    
    public String[][] getClientes(){
        JSONObject response = sendHttpRequest();
        String[][] data = new String[response.getJSONArray("data").length()][7];
        for (int i = 0; i < response.getJSONArray("data").length(); i++) {
            JSONObject response2 = new JSONObject(response.getJSONArray("data").get(i).toString());
            data[i][0]=response2.getString("dni_cli");
            data[i][1]=response2.getString("nom_cli");
            data[i][2]=response2.getString("ape_cli");
            data[i][3]=response2.getString("sexo_cli");
            data[i][4]=response2.getString("celular");
            data[i][5]=response2.getString("email_cli");
            data[i][6]=response2.getString("dir_cli");
        }
        return data;
    }
    
    public String[][] getProducto(){
        JSONObject response = sendHttpRequest();
        String[][] data = new String[response.getJSONArray("data").length()][7];
        for (int i = 0; i < response.getJSONArray("data").length(); i++) {
            JSONObject response2 = new JSONObject(response.getJSONArray("data").get(i).toString());
            data[i][0]=response2.getString("idproducto");
            data[i][1]=response2.getString("tipo");
            data[i][2]=response2.getString("marca");
            data[i][3]=response2.getString("nombre");
            data[i][4]=response2.getString("descripcion");
            data[i][5]=response2.getString("precio");
            data[i][6]=String.valueOf(response2.getInt("stock"));
        }
        return data;
    }
    
    public String[][] getVentas(){
        JSONObject response = sendHttpRequest();
        String[][] data = new String[response.getJSONArray("data").length()][5];
        for (int i = 0; i < response.getJSONArray("data").length(); i++) {
            JSONObject response2 = new JSONObject(response.getJSONArray("data").get(i).toString());
            data[i][0]=String.valueOf(response2.getInt("id"));
            data[i][1]=response2.getString("cliente");
            data[i][2]=response2.getString("trabajador");
            data[i][3]=String.valueOf(response2.getDouble("total"));
            data[i][4]=response2.getString("fecha");
        }
        return data;
    }
    
    public String[] getVenta(){
        JSONObject response = sendHttpRequest();
        String[] data = new String[3];
        System.out.println(response);
        data[0] = response.getString("cliente");
        data[1] = response.getString("trabajador");
        data[2] = String.valueOf(response.getDouble("total"));
        return data;
    }
    
    public String[][] getDetallesVenta(){
        JSONObject response = sendHttpRequest();
        String[][] data = new String[response.getJSONArray("data").length()][3];
        for (int i = 0; i < response.getJSONArray("data").length(); i++) {
            JSONObject response2 = new JSONObject(response.getJSONArray("data").get(i).toString());
            data[i][0]=response2.getString("detalle_producto");
            data[i][1]=String.valueOf(response2.getInt("cantidad_producto"));
            data[i][2]=String.valueOf(response2.getDouble("precio_unitario"));
        }
        return data;
    }
}
