<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Disponibilidad</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
    <body style="padding-top: 120px">
        <%
            String codigoD= (String)request.getAttribute("codigo");
            String nombreD= (String)request.getAttribute("nombre");
            String msm=(String)request.getAttribute("msmeAgregarHist");
            String script="";
            if(msm==null){
                msm="";
            }
            if(msm=="agregarHistorial"){
            script="Swal.fire({title: 'Se agrego el historial',type: 'success',}).then(function() {window.location = 'controlAdministrador?opc=9&cod="+codigoD+"&nombre="+nombreD+"';});";
            msm="Creado";
            }
        %>
        <form action="controlAdministrador?opc=11" method="post">
            <div class="container">
                <div class="row">
                    <div  class="col-4">
                        <h2 class="h4">Agregar nuevo disponibilidad</h2>
                    </div>
                    <div class="col-4"><a class="btn btn-primary" href="controlAdministrador?opc=9&cod=<%=codigoD%>&nombre=<%=nombreD%>">Regresar</a></div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Codigo Doctor</label>
                        <input class="form-control" value="<%=codigoD%>" name="codD">
                    </div>
                    <div  class="col-6">
                        <label>Nombre Doctor</label>
                        <input class="form-control" value="<%=nombreD%>" name="nomD">
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Fecha inicio</label>
                        <input  class="form-control" name="feini" placeholder="ej:20xx-xx-xx xx:xx:00" required>
                    </div>
                    <div  class="col-6">
                        <label>Fecha fin</label>
                        <input  class="form-control" name="fefin" placeholder="ej:20xx-xx-xx xx:xx:00" required>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Turno</label>
                        <input name="turno" class="form-control" required>
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