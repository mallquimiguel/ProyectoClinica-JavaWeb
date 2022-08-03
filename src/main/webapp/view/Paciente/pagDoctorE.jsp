<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Doctor, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de doctores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/07ee6e2051.js" crossorigin="anonymous"></script><!----Font Awesome ----->
    </head>
    <body style="padding-top: 100px">
        <%
            List<Doctor> lista = (ArrayList) request.getAttribute("dato");
            String nombre = (String) request.getAttribute("nomE");
            String codEsp = (String) request.getAttribute("codEsp");
            HttpSession ses=request.getSession();
            String nombrePac=(String)ses.getAttribute("nombrePaciente");
        %>
        
        <!--Inicio navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <!--Logotipo-->
            <a class="navbar-brand" href="#">MediLan</a>
                <!--Menú de navegación-->
                <div class="collpase navbar-collapse" id="menu">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a href="view/Paciente/PagEspecialidad.jsp" class="nav-link">Reserva online</a></li>
                        <li class="nav-item"><a href="controlPacienteNavbar?opc=3" class="nav-link">Resultados médicos</a></li>
                        <li class="nav-item"><a href="controlPacienteNavbar?opc=1" class="nav-link">Historial de reservas</a></li>
                    </ul>
                </div>
                <!--Formulario de busqueda-->
                <form class="d-flex">
                    <li class=" navbar-collapse nav-item text-white"><i class="fa-solid fa-user" style="padding-right: 20px"></i> <%=nombrePac%></li>
                    <li class=" navbar-collapse nav-item "><a href="index.jsp" class="nav-link text-white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Salir</a></li>
                </form>
            </div>
        </nav>    
        <!--Fin navbar-->
        
        <div class="container">
            <div class="row ">
                <div class="col-6">
                    <h1 class="h3">Consulta medica - <%=nombre%></h1>
                </div>
                <div class="col-4">
                    <a href="view/Paciente/PagEspecialidad.jsp" class="btn btn-primary">
                        Regresar
                    </a>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <h2 class="h3">Lista de Doctores</h2>
                </div>
                <div class="col-12">
                    <table class="table table-hover table-striped">
                        <tr class="bg-primary"><th>Apellido<th>Nombre<th>Fecha de ingreso<th>Imagen<th>ver
                            <%
                                for (Doctor x : lista) {
                                out.print("<tr><td>" + x.getAped() + "<td>" + x.getNomd() + "<td>" + x.getFechai());
                            %>
                            <td><img src="img/doctores/<%=x.getCodd()%>.jpg"  class="rounded-circle" height="100px" accesskey=""onerror="src ='img/doctores/Sin Foto.jpg'"> 
                            <td><a href="control?opc=2&codDoctor=<%=x.getCodd()%>&cod=<%=codEsp%>&nomDoctor=<%=x.getNomd()%>&nomEsp=<%=nombre%>&sexo=<%=x.getSexo()%>" class="btn btn-primary">Mostrar</a>    
                            <%
                                }
                            %>  
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
