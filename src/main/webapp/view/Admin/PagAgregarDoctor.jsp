<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Doctor"%>
<%@page import="dao.DaoUsuario"%>
<%@page import="modelo.Especialidad"%>
<%@page import="dao.Negocio"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Doctor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>

    <body style="padding-top: 120px">
        <%
            Negocio obj = new Negocio();
            String msm = (String) request.getAttribute("msmeAgregarDoc");
            String script = "";
            String codEsp = "";
            if (request.getParameter("cbEsp") != null) {
                codEsp = request.getParameter("cbEsp");
            }
            if (msm == null) {
                msm = "";
            }
            if (msm == "agregarDoc") {
                script = "Swal.fire({title: 'Se agrego Doctor',type: 'success',}).then(function() {window.location = 'view/Admin/pagGestionDocs.jsp';});";
                msm = "Creado";
            }
//            enctype="multipart/form-data"
        %>
        <form action="../../controlAdministrador?opc=13" method="post">
            <div class="container">
                <div class="row">
                    <div  class="col-4">
                        <h2 class="h4">Agregar nuevo Doctor</h2>
                    </div>
                    <div class="col-4"><a class="btn btn-primary" href="pagGestionDocs.jsp">Regresar</a></div>
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
                        <label>Especialidad</label>                        
                        <br>
                        <select name="cbEsp" class="form-control">                
                            <option>Elegir</option>
                            <%
                                for (Especialidad e : obj.lisEspecialidad()) {
                                    if (e.getCodEsp().equals(codEsp)) {
                                        out.print("<option value=" + e.getCodEsp() + " selected>" + e.getNombreEsp());
                                    } else {
                                        out.print("<option value=" + e.getCodEsp() + ">" + e.getNombreEsp());
                                    }
                                }
                            %>                      
                        </select>
                    </div>
                    <div  class="col-6">
                        <label>Consultorio</label>
                        <input type="text" name="consultorio" class="form-control" readonly required>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6">
                        <label>Fecha de Ingreso</label>
                        <input name="fechaIng" class="form-control" required>
                    </div>
                    <div  class="col-6">
                        <label>Sexo</label>
                        <select class="form-control" name="sexo" required>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>                       
                    </div>
                </div> 
                <div class="d-grid gap-2 mt-4">
                    <button type="submit" class="btn btn-primary">Enviar</button>                  
                </div>        
        </form>
        <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            <%=script%>
        </script>                  
    </body>
</html>
