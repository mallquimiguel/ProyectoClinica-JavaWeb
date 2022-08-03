<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, modelo.*, dao.Negocio" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/07ee6e2051.js" crossorigin="anonymous"></script><!----Font Awesome ----->
    </head>
    <body style="padding-top: 100px">
        <%
            HttpSession ses=request.getSession();
            String nombrePac=(String)ses.getAttribute("nombrePaciente");%>
        <!--Inicio navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <!--Logotipo-->
            <a class="navbar-brand" href="#">MediLan</a>
                <!--Menú de navegación-->
                <div class="collpase navbar-collapse" id="menu">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a href="../Paciente/PagEspecialidad.jsp" class="nav-link">Reserva online</a></li>
                        <li class="nav-item"><a href="../../controlPacienteNavbar?opc=3" class="nav-link">Resultados médicos</a></li>
                        <li class="nav-item"><a href="../../controlPacienteNavbar?opc=1" class="nav-link">Historial de reservas</a></li>
                        <!--<li class="nav-item"><a href="../../index.jsp" class="nav-link">Salir</a></li>-->
                    </ul>
                </div>
                <!--Formulario de busqueda-->
                <form class="d-flex">
                    <li class=" navbar-collapse nav-item text-white"><i class="fa-solid fa-user" style="padding-right: 20px"></i> <%=nombrePac%></li>
                    <li class=" navbar-collapse nav-item "><a href="../../index.jsp" class="nav-link text-white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Salir</a></li>
                </form>
            </div>
        </nav>    
        <!--Fin navbar-->
    </body>
</html>
