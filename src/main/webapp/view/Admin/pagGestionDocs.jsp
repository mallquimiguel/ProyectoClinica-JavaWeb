<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion De Doctores</title>
    </head>
    <body>
        <%@include file="navbarAdmi.jsp" %>
         <%
            Negocio obj = new Negocio();
            String codDoc = "", codEsp= "";        
            if(request.getParameter("cbEsp")!=null)
                codEsp=request.getParameter("cbEsp");
            if(request.getParameter("cbDoc")!=null)
                codDoc=request.getParameter("cbDoc");
        %>       
        
          <div class="container">
            <div class="row">
                    <div class="col-sm-4 cold-md-6">
                        <h4>Gestion de Doctores:</h4>
                    </div>
              <div class="col-sm-3">
                  <a href="PagGestion.jsp"><button class="btn btn-primary">Regresar</button></a>
              </div>
              <div class="col-sm-3">
                  <h5>Agregar nuevo doctor</h5>
              </div>
               <div class="col-sm-2">
                   <a href="subirImagenDoc.jsp"> <button class="btn btn-success">Agregar</button> </a>
              </div>
            </div>
          </div>
        <br><br>  
        <form> 
           <div class="container">
            <div class="row">
                    <div class="col-md-3">
                        <h6>Buscar por especialidad:</h6>
                    </div>
              <div class="col-sm-6">
                  <select name="cbEsp" onchange="submit()" class="mdb-select md-form">
                        <option>Elegir</option>
                                <%
                                    String NomEsp="";
                                   for(Especialidad e:obj.lisEspecialidad()){
                                       
                                       if(e.getCodEsp().equals(codEsp)){
                                       out.print("<option value=" + e.getCodEsp()+ " selected>" + e.getNombreEsp());
                                       NomEsp=e.getNombreEsp();
                                       
                                       }
                                       else{
                                       out.print("<option value=" + e.getCodEsp()+ ">" + e.getNombreEsp()); 
                                       }
                                       
                                   } 
                                 %>                      
                  </select>
              </div> 
                                 
                <div class="row mt-4"></div> <!--Espacio entre div -->
                
                <div class="col-md-3">
                  <h6>Buscar por doctor:</h6>
              </div>
               <div class="col-sm-2">
                   <select name="cbDoc" onchange="submit()" class="mdb-select md-form">
                        <option>Elegir</option>
                                <%
                                   for(Doctor d:obj.lisDocE(codEsp)){
                                       if(d.getCodd().equals(codDoc))
                                       out.print("<option value=" + d.getCodd()+ " selected>" + d.getNomd());
                                       else
                                       out.print("<option value=" + d.getCodd()+ ">" + d.getNomd());  
                                   } 
                                 %>                      
                  </select>
              </div>
            </div>
          </div>
        </form>
        <br><br>
        <table class="table table-bordered container" style="text-align:center">
                <thead class="thead-dark" style="color:#edf2f7; background: #367AEA">
                  <tr>
                    <th scope="col">Doctor(a)</th>
                    <th scope="col">Imagen</th>
                    <th scope="col">Fecha de Ingreso</th>
                    <th scope="col">Especialidad</th>
                    <th scope="col">Disponibilidad</th>
                    <th scope="col">Anular</th>
                    <th scope="col">Modificar</th>
                  </tr>
                </thead>
                <%
                    String nom="";
                  for(Doctor d:obj.lisDocEBus(codEsp,codDoc)){
                      nom=d.getAped()+", "+d.getNomd();
                         out.print("<tr><td>" + nom);
                   %>              
                   <td><img src="../../img/doctores/<%=d.getCodd()%>.jpg" class="rounded-circle" height="100px" 
                   onerror="src ='../../img/doctores/Sin Foto.jpg'">  
                  <%                       
                    out.print("<td>"+ d.getFechai()+ "<td>" + NomEsp);             
                  %>                    
                    <input type="hidden" id="codigo" value="<%=d.getCodd()%>">
                    <input type="hidden" id="nmDoctor" value="<%=d.getNomd()%>">
                    <td><a href="../../controlAdministrador?opc=9&cod=<%=d.getCodd()%>&nombre=<%=nom%>" class="btn btn-success">Mostrar</a>
                    <td><a><button class="btn btn-danger" id="deleteDoctor" >Eliminar</button></a>
                    <td><a href="../../controlAdministrador?opc=14&cod=<%=d.getCodd()%>"<button class="btn btn-primary">Modificar</button></a>
                  <%      
                    }
                  %>                  
                    
           </table> 
                  <script src="../../plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script type="text/javascript">
//Aquí hago que aparezca la alerta acompañado del valor del "id". 
$(document).ready(function (){
    $("#deleteDoctor").on("click", function () {
var cod = document.getElementById("codigo").value;
        Swal.fire({
            title: 'Está seguro que desea eliminar el código de doctor '+cod,
            text: "No podrá recuperar los datos!",
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
                url: '../../controlAdministrador?opc=1&cod='+cod,
                success: function (rpta) {
                    Swal.fire(
                        'Eliminado!',
                        'El doctor ha sido eliminado.',
                        'success'
                      ).then(function() {
                    window.location = "pagGestionDocs.jsp";
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
</script>
    </body>
</html>
