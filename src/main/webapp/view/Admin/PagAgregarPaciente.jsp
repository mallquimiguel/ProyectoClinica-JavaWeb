<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar paciente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
    <body style="padding-top: 120px">
        <%
            String msm=(String)request.getAttribute("msmeAgregarPac");
            String msmError=(String)request.getAttribute("rep");
            String script="",bgcolor="";
            if(msm==null){
                msm="";
            }
            if(msmError=="rep"){
                bgcolor="danger";
            script="Swal.fire({position: 'center',type: 'error',title: 'Dni repetido',text: 'Ingrese otro dni',  showConfirmButton: true,}).then(function() {window.location = 'view/Admin/PagAgregarPaciente.jsp';});";
            msmError="Dni repetido";
            }
            if(msm=="agregarPa"){
            script="Swal.fire({title: 'Se agrego Paciente',type: 'success',}).then(function() {window.location = 'view/Admin/pagGestionPaciente.jsp';});";
            msm="Creado";
            }
        %>
        <form action="../../controlAdministrador?opc=3" method="post">
            <div class="container">
                <div class="row">
                    <div  class="col-4">
                        <h2 class="h4">Agregar nuevo paciente</h2>
                    </div>
                    <div class="col-4"><a class="btn btn-primary" href="pagGestionPaciente.jsp">Regresar</a></div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Cargo</label>
                        <input class="form-control" value="Paciente" name="cargo" readonly>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Dni</label>
                        <input type="number" class="form-control" name="dni" id="dni" oninput="actualizarValorContraseña()" required>
                    </div>
                    <div  class="col-6">
                        <label>Contraseña(Dni)</label>
                        <input type="password" class="form-control" id="dnicontraseña" name="password" readonly>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>
                    <div  class="col-6">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" required>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>telefono</label>
                        <input type="number" name="telefono" class="form-control" required>
                    </div>
                    
                    <div  class="col-6">
                        <label>Correo</label>
                        <input type="email" name="correo" class="form-control" required>
                    </div>
                </div>
                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </form>
        <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        function actualizarValorContraseña() {
			let dni = document.getElementById("dni").value;
			//Se actualiza en municipio inm
			document.getElementById("dnicontraseña").value = dni;
		}
        <%=script%>        
    </script>
    </body>
</html>
