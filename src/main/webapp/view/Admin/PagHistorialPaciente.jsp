<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de paciente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body style="padding-top: 100px">
        <%
            List<Historial> lista = (ArrayList) request.getAttribute("dato");
        %>
        <!--Inicio navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <!--Logotipo-->
                <a class="navbar-brand" href="view/Admin/PagGestion.jsp">MediLan</a>
                <!--Menú de navegación-->
                <div class="collpase navbar-collapse" id="menu">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a href="view/Admin/pagGestionDocs.jsp" class="nav-link">Gestionar doctores</a></li>
                        <li class="nav-item"><a href="view/Admin/pagGestionPaciente.jsp" class="nav-link">Gestionar pacientes</a></li>
                        <li class="nav-item"><a href="view/Admin/PagGrafico.jsp" class="nav-link">Gráficos</a></li>
                        <li class="nav-item"><a href="index.jsp" class="nav-link">Salir</a></li>
                    </ul>
                </div>
            </div>      
        </nav>    
        <!--Fin navbar-->   
        <div class="container">
        <div class="row mt-4">
                <div class="col-4">
                    <h2 class="h3">Listado de Historial</h2>
                </div>
                <div class="col">
                    <a href="view/Admin/pagGestionPaciente.jsp" class="btn btn-primary">Regresar</a>
                </div>
                <div class="col-12">
                    <table class="table table-hover table-striped mt-4">
                        <tr><thead class="text-white bg-primary"><th>CodHistorial<th>Nombre de Paciente<th>Fecha<th>Motivo<th>Estado
                            </thead>    
                            <%
                                    String var="";
                                    for (Historial x : lista) {
                                        out.print("<tr><td>" + x.getCodHistorial()+ "<td>" + x.getNombrePaciente()+ "<td>" + x.getFecha()+
                                                "<td>" + x.getMotivo());
                                        switch(x.getEstado()){
                                            case "Pendiente": var="<a href='controlAdministrador?opc=7&cod="+x.getCodHistorial()+"' class='btn btn-danger'>"+x.getEstado()+"</a>";break;
                                            case "Culminado": var="<a href='controlAdministrador?opc=7&cod="+x.getCodHistorial()+"' class='btn btn-success'>"+x.getEstado()+"</a>";break;
                                        }
                                %>
                        <td><%=var%></td>
                                <%
                                    }
                                %>  
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
