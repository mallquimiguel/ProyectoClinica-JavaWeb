<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú</title>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <%
            Negocio obj=new Negocio();
            String codPaciente=(String)ses.getAttribute("codPaciente");
        %>
        
        <div class="container">
            <div class="row ">
                <div class="col-12">
                    <h1 class="h3">Consultas medicas</h1>
                </div>
            </div>
            <div class='row mt-2'>
                <%
                    for(Especialidad x:obj.lisEspecialidad()){
                        out.print("<div class='col-4 mt-2'>"
                        + "<h2 class='h4'>"+x.getNombreEsp()+"</h2>"
                        + "<div><img src='../../img/specialty/"+x.getNombreEsp()+".jpg'>"
                                + "<p class='mt-2 h5'>Precio: "+x.getPrecioEsp()+"</p></div>"
                        + "<div>");
                        
                %>
                <a class="btn btn-primary" href="../../control?opc=1&cod=<%=x.getCodEsp()%>&nomE=<%=x.getNombreEsp()%>">Ver</a>
                </div></div>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
