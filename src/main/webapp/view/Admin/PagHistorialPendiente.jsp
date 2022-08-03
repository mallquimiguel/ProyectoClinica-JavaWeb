<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelo.Historial,dao.DaoAdministrador"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Historial Pendiente</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%  
            String msm=(String)request.getAttribute("resHistorial");
            String codP=(String)request.getAttribute("codPac");
            String script="";
            if(msm==null){
                msm="";
            }
            if(msm=="modificado"){
            script="Swal.fire({title: 'Hisotiral modificado',type: 'success',}).then(function() {window.location = 'controlAdministrador?opc=4&cod="+codP+"';});";
            msm="modificado";
            }
            
            String diagnostico = "",tratamiento="",receta="";
            Historial h = (Historial) request.getAttribute("dato");
            String nomPac, nomDoc;
            nomPac = h.getApePac() + ", " + h.getNomPac();
            nomDoc = h.getApeDcotor() + ", " + h.getNombreDcotor();
            switch(h.getEstado()){
                case "Pendiente":   diagnostico="";tratamiento="";receta="";break;
                case "Culminado":   diagnostico=h.getDiagnostico();tratamiento=h.getTratamiento();receta=h.getReceta();break;
            }
        %>
        <form action="controlAdministrador?opc=8" method="post">
            <div class="container mt-2">
                <input type="hidden" name="codHistorial" value="<%=h.getCodHistorial()%>">
                <input type="hidden" name="codPaciente" value="<%=h.getCodPaciente()%>">
                <input type="hidden" name="codCita" value="<%=h.getCodCita()%>">
                <input type="hidden" name="codDoctor" value="<%=h.getCodDoctor()%>">
                <div class="row">
                    <div class="col-4">
                        <h2 class="h4">Atención: <%=h.getCodHistorial()%></h2>
                    </div>
                    <div class="col">
                        <a href="controlAdministrador?opc=4&cod=<%=h.getCodPaciente()%>" class="btn btn-primary">Regresar</a>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col-6">
                        <label class="mb-2">Nombre del Paciente :</label>
                        <input name="nombrePac" value="<%=nomPac%>" class="form-control" readonly>
                    </div>

                    <div class="col-6">
                        <label class="mb-2">Especialista :</label>
                        <input name="nombreDoc" value="<%=nomDoc%>" class="form-control" readonly>
                    </div>
                    <div class="col-6">
                        <label>Especialidad :</label>
                        <input name="especialidad" value="<%=h.getNomEsp()%>" class="form-control" readonly>
                    </div>
                    <div class="col-6">
                        <label>Fecha de cita:</label>
                        <input name="fecha" value="<%=h.getFecha()%>" class="form-control" readonly>
                    </div>
                    <div class="col-6">
                        <label>Motivo de cita :</label>
                        <textarea name="motivo" class="form-control"><%=h.getMotivo()%></textarea>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="col">
                        <h2 class="h4">Resultados medicos</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
                        <label>Diagnostico :</label>
                        <textarea name="diagnostico" class="form-control"><%=diagnostico%></textarea>
                    </div>
                    <div class="col-6">
                        <label>Tratamiento :</label>
                        <textarea name="tratamiento" class="form-control"><%=tratamiento%></textarea>
                    </div>
                    <div class="col-6">
                        <label>Receta :</label>
                        <textarea name="receta" class="form-control"><%=receta%></textarea>

                    </div>

                </div>
                <div class="d-grid gap-2 mt-4">
                    <button class="btn btn-primary">Modificar historial</button>
                </div>
            </div>
        </form>
        <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        <%=script%>
    </script>                
    </body>
</html>
