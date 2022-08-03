<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Paciente,dao.DaoAdministrador" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar paciente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
    <body style="padding-top: 120px">
        <%  
            Paciente p=(Paciente)request.getAttribute("dato");
            DaoAdministrador daoA=new DaoAdministrador();
            String codU;
            codU=daoA.BusCodUsuario(p.getDni());
            
            String msm=(String)request.getAttribute("msmeModificarPac");
            String script="";
            if(msm==null){
            }
            if(msm=="modificarPa"){
            script="Swal.fire({title: 'Se Modifico Paciente',type: 'success',}).then(function() {window.location = 'view/Admin/pagGestionPaciente.jsp';});";
            }
            
     %>
        <form action="controlAdministrador?opc=6" method="post">
            <div class="container">
                <input type="hidden" name="codPaciente" value="<%=p.getCodPaciente()%>">
                <input type="hidden" name="codUsuario" value="<%=codU%>">
                <div class="row">
                    <div  class="col-4">
                        <h2 class="h4">Modificar paciente</h2>
                    </div>
                    <div class="col-4"><a class="btn btn-primary" href="view/Admin/pagGestionPaciente.jsp">Regresar</a></div>
                </div>
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>Cargo</label>
                        <input class="form-control" value="Paciente" name="cargo" readonly>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>Dni</label>
                        <input type="number" class="form-control" name="dni" value="<%=p.getDni()%>" readonly>
                    </div>
                    <div  class="col-6 mt-2">
                        <label>Contraseña(Dni)</label>
                        <input type="password" class="form-control" value="<%=p.getContrasena()%>" name="password" readonly>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%=p.getNombre()%>" required>
                    </div>
                    <div  class="col-6 mt-2">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" value="<%=p.getApellido()%>" required>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>telefono</label>
                        <input type="number" name="telefono" class="form-control" value="<%=p.getTelefono()%>" required>
                    </div>
                    
                    <div  class="col-6 mt-2">
                        <label>Correo</label>
                        <input type="email" name="correo" class="form-control" value="<%=p.getCorreo()%>" required>
                    </div>
                </div>
                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary">Enviar</button>
                </div>
            </div>
        </form>
    <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script type="text/javascript">
        <%=script%>        
    </script>                
    </body>
</html>
