<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion Pacientes</title>
    </head>
    <body>
        <%@include file="navbarAdmi.jsp" %>
        <div class="container">
            <div class="row">
                <div class="col-4">
                    <h2 class="h4">Buscar por apellido del paciente: </h2>
                </div>
                <div class="col-8 mb-4">
                <input id="txtnom"  class="form-control" placeholder="Ingrese Apellido">    
                </div>
                <div class="col-4">
                    <h2 class="h4">Buscar por dni del paciente: </h2>
                </div>
                <div class="col-8 mb-4">
                <input id="txtdni"  class="form-control" placeholder="Ingrese DNI">    
                </div>
                <div id="tablares" class="col"></div> 
            </div>
        </div>
    </body>
</html>
