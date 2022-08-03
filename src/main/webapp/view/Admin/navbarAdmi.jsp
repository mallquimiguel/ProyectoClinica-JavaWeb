<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, dao.Negocio"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="../../plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="../../js/filtraPac.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/07ee6e2051.js" crossorigin="anonymous"></script><!----Font Awesome ----->
    </head>
    <body style="padding-top: 100px">
        <%
            HttpSession ses=request.getSession();
            String nombreAdm=(String)ses.getAttribute("nombreAdministrador");
        %>
        <!--Inicio navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <!--Logotipo-->
            <a class="navbar-brand" href="#">MediLan</a>
                <!--Menú de navegación-->
                <div class="collpase navbar-collapse" id="menu">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a href="pagGestionDocs.jsp" class="nav-link">Gestionar doctores</a></li>
                        <li class="nav-item"><a href="pagGestionPaciente.jsp" class="nav-link">Gestionar pacientes</a></li>
                        <li class="nav-item"><a href="PagGrafico.jsp" class="nav-link">Gráficos</a></li>
                    </ul>
                </div>
                <!--Formulario de busqueda-->
                <form action="" class="d-flex">
                    <li class=" navbar-collapse nav-item text-white"><i class="fa-solid fa-user" style="padding-right: 20px"></i> <%=nombreAdm%></li>
                    <li class=" navbar-collapse nav-item "><a href="../../index.jsp" class="nav-link text-white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Salir</a></li>
                </form>
            </div>
        </nav>    
        <!--Fin navbar-->
    </body>
</html>
