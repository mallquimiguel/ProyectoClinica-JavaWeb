<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.*,dao.*" %>
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
            Negocio obj = new Negocio();
            Doctor d = (Doctor)request.getAttribute("dato");

            String codEsp = "";
            if (request.getParameter("cbEsp") != null) {
                codEsp = request.getParameter("cbEsp");
            }

            String msm = (String) request.getAttribute("msmeModificarDoc");
            String script = "";
            if (msm == null) {
            }
            if (msm == "modificarDoc") {
                script = "Swal.fire({title: 'Se Modifico Doctor',type: 'success',}).then(function() {window.location = 'view/Admin/pagGestionDocs.jsp';});";
            }

        %>
        <form action="controlAdministrador?opc=15" method="post">
            <div class="container">
                <input type="hidden" name="codDoc" value="<%=d.getCodd()%>">               
                <div class="row">
                    <div  class="col-4">
                        <h2 class="h4">Modificar Doctor</h2>
                    </div>
                    <div class="col-4"><a class="btn btn-primary" href="view/Admin/pagGestionDocs.jsp">Regresar</a></div>
                </div>               
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>CodigoDoctor</label>
                        <input type="text" class="form-control" name="codDoc" value="<%=d.getCodd()%>" readonly>
                    </div>                    
                </div>
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>Nombre</label>
                        <input type="text" name="nombre" class="form-control" value="<%=d.getNomd()%>" required>
                    </div>
                    <div  class="col-6 mt-2">
                        <label>Apellido</label>
                        <input type="text" name="apellido" class="form-control" value="<%=d.getAped()%>" required>
                    </div>
                </div>
                <div class="row">
                    <div  class="col-6 mt-2">
                        <label>Especialidad</label>
                        <br>
                        <select name = "cbEsp" class="form-control">                      
                             <!--<option>Elegir</option>-->
                            <%
                                for (Especialidad e : obj.lisEspecialidad()) {
                                    if (e.getCodEsp().equals(d.getCesp())) {
                                        out.print("<option value=" + e.getCodEsp() + " selected>" + e.getNombreEsp());
                                    }else{
                                        out.print("<option value=" + e.getCodEsp() + ">" + e.getNombreEsp());
                                    }
                                }
                            %>                                
                        </select>                       
                    </div>
                    <div  class="col-6 mt-2">
                        <label>Consultorio</label>
                        <input type="text" name="codCon" class="form-control" value="<%=d.getCcon()%>"  readonly required>
                    </div>
                </div>
                <div class="row">                    
                    <div  class="col-6 mt-2">
                        <label>Fecha de Ingreso</label>
                        <input type="text" name="fechaIng" class="form-control" value="<%=d.getFechai()%>"readonly required>
                    </div>
                    <div  class="col-6 mt-2">
                        <label>Sexo</label>
                        <select class="form-control" name="sexo" required>
                          <%
                                String selet1="",selet2="";
                                switch(d.getSexo()){
                                    case "M": selet1="selected";selet2="";break;
                                    case "F": selet2="selected";selet1="";break;
                                }
                            %>
                            <option value="M" <%=selet1%>>Hombre</option>
                            <option value="F" <%=selet2%>>Mujer</option>
                            
                        </select>                       
                    </div>
                            <div class="d-grid gap-2 mt-4">
                <button type="submit" class="btn btn-primary">Enviar</button>
            </div>
                </div>    
            </div>
        <!--</div>-->
    </form>
    <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        <%=script%>
    </script>                
</body>
</html>
