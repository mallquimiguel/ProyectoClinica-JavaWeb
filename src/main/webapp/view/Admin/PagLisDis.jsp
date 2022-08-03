<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*, dao.Negocio"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Disponibilidad</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <script src="https://kit.fontawesome.com/07ee6e2051.js" crossorigin="anonymous"></script><!----Font Awesome ----->
    </head>
    <body style="padding-top: 100px">
         <%
            Negocio obj = new Negocio();
            List<Disponibilidad>lista=(ArrayList)request.getAttribute("dato");
            String nombreD= (String)request.getAttribute("nombre");
            String codigoD= (String)request.getAttribute("codigo");
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
                        <li class="nav-item"><a href="view/Admin/pagGestionDocs.jsp" class="nav-link">Gestionar doctores</a></li>
                        <li class="nav-item"><a href="view/Admin/pagGestionPaciente.jsp" class="nav-link">Gestionar pacientes</a></li>
                        <li class="nav-item"><a href="view/Admin/PagGrafico.jsp" class="nav-link">Gráficos</a></li>
                    </ul>
                </div>
                <!--Formulario de busqueda-->
                <form action="" class="d-flex">
                    <li class=" navbar-collapse nav-item text-white"><i class="fa-solid fa-user" style="padding-right: 20px"></i> <%=nombreAdm%></li>
                    <li class=" navbar-collapse nav-item "><a href="index.jsp" class="nav-link text-white"><i class="fa-solid fa-arrow-right-from-bracket"></i> Salir</a></li>
                </form>
            </div>
        </nav>    
        <!--Fin navbar-->
          <div class="container">
            <div class="row">
                    <div class="col-sm-4 cold-md-6">
                        <h4>Disponibilidad Doctor(a) :<%=nombreD%></h4>
                    </div>
              <div class="col-sm-3">
                  <a href="view/Admin/pagGestionDocs.jsp"><button class="btn btn-primary">Regresar</button></a>
              </div>
              <div class="col-sm-3">
                  <h5>Agregar disponibilidad</h5>
              </div>
               <div class="col-sm-2">
                  <a href="controlAdministrador?opc=10&cod=<%=codigoD%>&nomD=<%=nombreD%>"><button class="btn btn-success">Agregar</button></a>
              </div>
            </div>
          </div>
        <br><br>  
        
        <br><br>
        <table class="table table-bordered container" style="text-align:center">
                <thead class="thead-dark" style="color:#edf2f7; background: #367AEA">
                  <tr>
                    <th scope="col">Código Disponibilidad</th>
                    <th scope="col">Fecha inicio</th>
                    <th scope="col">Fecha fin</th>
                    <th scope="col">Turno</th>
                    <th scope="col">Estado</th>
                    <th scope="col">Anular</th>
                  </tr>
                </thead>
                    <%
                String est="";
                int contador=0;
            for(Disponibilidad x:lista){
                if(x.getEstado()==0){
                    est="Libre";
                }else{est="Ocupado";}
            out.print("<tr><td>"+x.getCodDisponibilidad()+"<td>"+x.getFechaInicio()+"<td>"+x.getFechaFin()+"<td>"
                    +x.getTurno()+"<td>"+est);
                    
             %>
            <input type="hidden" id="codigoD" value="<%=codigoD%>">    
            <input type="hidden" id="nomD" value="<%=nombreD%>">    
            <input type="hidden" id="codDisp" value="<%=x.getCodDisponibilidad()%>">
            <input type="hidden" id="cDisp<%=contador%>" value="<%=x.getCodDisponibilidad()%>">
            <td><button class="btn btn-danger" id="<%=contador%>">Anular</button>
                 <%
                     contador++;
            }
            %>              
           </table> 
                <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
       <script type="text/javascript">
           <%
               for (int i = 0; i <contador; i++) {
                   %>  
                   
             $(document).ready(function (){
    $("#<%=i%>").on("click", function () {
var codD = document.getElementById("codigoD").value;
var nomD = document.getElementById("nomD").value;
var codDisp = document.getElementById("cDisp<%=i%>").value;
        Swal.fire({
            title: 'Está seguro que desea eliminar la disponibilidad: '+codDisp,
            text: "No podrá recuperar los datos!",
            type: 'warning',
            showCloseButton: true,
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, eliminalo!',
            cancelButtonText: 'Cancelar'
        }).then((choice) => {
        if (choice.value === true) {
            $.ajax({
                type: "POST",
                url: 'controlAdministrador?opc=12&cod='+codD+'&nomD='+nomD+'&codDis='+codDisp,
                success: function (rpta) {
                    Swal.fire(
                        'Eliminado!',
                        'La disponibilidad se ha eliminado.',
                        'success'
                      ).then(function() {
                    window.location = "controlAdministrador?opc=9&cod="+codD+"&nombre="+nomD+"";
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
