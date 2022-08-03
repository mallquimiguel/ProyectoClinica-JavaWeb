<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
    </head>
    <body>
        <%@include file="navbarAdmi.jsp" %>
        <div class="container">
            <div class="row ">
                <div class="col-12">
                    <h1 class="h3">Opciones de gestión</h1>
                </div>
            </div>
            <div class="row mt-4"></div>
            <div class="row mt-4">
                <div class="col-4">
                    <h2 class="h4">Gestionar doctores</h2>
                    <div>
                        <img src="../../img/menu/GestiónDoctores.jpg">
                    </div>
                    <div class="mt-4">
                        <a class="btn btn-primary" href="pagGestionDocs.jsp">Ver</a>
                    </div>
                </div>
                <div class="col-4">
                    <h2 class="h4">Gestionar pacientes</h2>
                    <div>
                        <img src="../../img/menu/GestiónMedicamentos.jpg">
                    </div>
                    <div class="mt-4">
                        <a class="btn btn-primary" href="pagGestionPaciente.jsp">Ver</a>
                    </div>
                </div>
                <div class="col-4">
                    <h2 class="h4">Gráficos</h2>
                    <div>
                        <img src="../../img/menu/Gráficos.jpg">
                    </div>
                    <div class="mt-4">
                        <a class="btn btn-primary" href="PagGrafico.jsp">Ver</a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
