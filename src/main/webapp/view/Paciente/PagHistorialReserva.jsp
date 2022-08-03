<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial de citas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/07ee6e2051.js" crossorigin="anonymous"></script><!----Font Awesome ----->
    </head>
    <body style="padding-top: 100px">
        <%
            List<Cita> lista = (ArrayList) request.getAttribute("dato");
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
                <div class="col-4">
                    <h1 class="h3">Reserva online</h1>
                </div>
                <div class="col-4">
                    <a href="view/Paciente/PagEspecialidad.jsp" class="btn btn-primary">
                        Regresar
                    </a>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col-12">
                    <h2 class="h3">Lista de Reservas</h2>
                </div>
                <div class="col-12">
                    <table class="table table-hover table-striped ">
                        <tr><thead class="text-white bg-primary"><th>CodCita<th>CodDoctor<th>Fecha Atención<th>Fecha Salida<th>Tipo Comprobante<th>Total<th>Cancelar
                            </thead>    
                            <%
                                int contador=0;
                                for (Cita x : lista) {
                                    out.print("<tr><td>" + x.getCodCita()+ "<td>" + x.getCodDoctor()+ "<td>" + x.getFechaIni()+
                                    "<td>" + x.getFechaFin()+ "<td>" + x.getTipo()+ "<td>" + x.getTotalPagar());
                            %>
                            <input type="hidden" id="codCita<%=contador%>" value="<%=x.getCodCita()%>">
                            <input type="hidden" id="codDetalle<%=contador%>" value="<%=x.getCodDetalle()%>">
                            <input type="hidden" id="fechaIn<%=contador%>" value="<%=x.getFechaIni()%>">
                            <input type="hidden" id="fechaFin<%=contador%>" value="<%=x.getFechaFin()%>">
                            <td><button type="submit" class="btn btn-danger" id="<%=contador%>">Cancelar</button>
                            <%
                                contador++;
                                }
                            %>  
                    </table>
                </div>
            </div>
        </div>
    <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        <%
               for (int i = 0; i <contador; i++) {
                   %>
    //Aquí hago que aparezca la alerta acompañado del valor del "id". 
    $(document).ready(function (){
    $("#<%=i%>").on("click", function () {
    var codCita = document.getElementById("codCita<%=i%>").value;
    var codDetalle = document.getElementById("codDetalle<%=i%>").value;
    var fechaIn = document.getElementById("fechaIn<%=i%>").value;
    var fechaFin = document.getElementById("fechaFin<%=i%>").value;
    Swal.fire({
        title: 'Está seguro que desea eliminar su cita: '+codCita,
        text: "Perdera su turno de reserva online",
        type: 'warning',
        showCloseButton: true,
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Sí, eliminarlo!',
        cancelButtonText: 'Cancelar'
        }).then((choice) => {
        if (choice.value === true) {
            $.ajax({
                type: "POST",
                url: 'controlPacienteNavbar?opc=2&codCit='+codCita+'&codDeta='+codDetalle+'&fi='+fechaIn+'&ff='+fechaFin,
                success: function (rpta) {
                    Swal.fire(
                        'Eliminado!',
                        'Su cita ha sido eliminado.',
                        'success'
                      ).then(function() {
                    window.location = "controlPacienteNavbar?opc=1";
                });
                },
                error: function (req, textStatus, errorThrown) {
                    alert('Ooops, something happened: ' + textStatus + ' ' + errorThrown);
                }
            });
        }
    });
});
});
<%       
                   }
               %>
</script>
    </body>
</html>
