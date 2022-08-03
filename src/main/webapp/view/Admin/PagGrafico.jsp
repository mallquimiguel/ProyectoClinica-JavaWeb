<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grafico</title>
    </head>
    <body>
        <%@include file="navbarAdmi.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col mb-2">
                    <h2 class="h4">Grafica de sastifación con el servicio de reservas online</h2>
                </div>
            </div>
            <div class="row">
                <form action="GraficoScript.jsp" target="Win">
                    <div class="row mb-4">
                    <div class="col-2">
                        <h2 class="h5">Ingrese año:</h2>
                    </div>
                        <div class="col-4">
                            <input name="anio"  class="form-control">
                        </div>
                    <div class="col-3">
                        <h2 class="h5">Selecione una opción:</h2>
                    </div>
                        <div class="col-3">
                            <input type="radio" name="opc" value="1" onclick="submit()" checked="" class="custom-control-input">Torta
                            <input type="radio" name="opc" value="2" onclick="submit()" class="custom-control-input">Barra
                            <input type="radio" name="opc" value="3" onclick="submit()" class="custom-control-input">Linea
                        </div>
                        </div>
                </form>
                        <iframe name="Win" width="70%" height="400px" ></iframe>
                </div>
            </div>
        </div>
    </body>
</html>
