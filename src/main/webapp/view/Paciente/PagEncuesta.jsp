<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Encuesta de sastifacción</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
    <body style="padding-top: 100px">
        <%
            String msm=(String)request.getAttribute("resp");
            String script="";
            if(msm==null){
                msm="";
            }
            if(msm=="creado"){
            script="Swal.fire({title: 'Cita reservada',type: 'success',}).then(function() {window.location = 'controlPacienteNavbar?opc=1';});";
            msm="Creado";
            }
        %>    
        <!--Inicio navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
            <div class="container">
                <!--Logotipo-->
            <a class="navbar-brand" href="">MediLan</a>
            </div>
        </nav>    
        <!--Fin navbar-->
        <form action="control?opc=5" method="post">
            <div class="container">
                <div class="row">
                        <div class="col-12 mb-4">
                            <h2 class="h4">Encuesta de satisfacción</h2>
                        </div>
                        <div class="col-12 mb-4">
                            <h2 class="h4">
                                1. ¿Qué tan sastifecho te encuentras con nuestro servicio de reserva online? *
                            </h2>
                        </div>
                    <div class="col-2">
                        <input type="radio" name="rb" value="Muy insastifecho" required>Muy insastifecho
                    </div>
                    <div class="col-2">
                        <input type="radio" name="rb" value="Insastifecho" required>Insastifecho
                    </div>
                    <div class="col-2">
                        <input type="radio" name="rb" value="Regular" required>Regular
                    </div>
                    <div class="col-2">
                        <input type="radio" name="rb" value="Sastifecho" required>Sastifecho
                    </div>
                    <div class="col-2">
                        <input type="radio" name="rb" value="Muy sastifecho" required>Muy sastifecho
                    </div>
                </div>
                <div class="row-12 mt-4">
                    <div class="col-12 mb-4">
                        <h2 class="h4">
                           2. ¿Cómo valoraría nuestro servicio? *
                        </h2>
                    </div>
                    <div class="col-12">
                        <h2 class="h5">
                           Valore de 1 al 10
                        </h2>
                    </div>
                    <div class="col-4">
                        <input class="form-control" type="number" name="valor" max="10" min="1" placeholder="Escriba el valor" required>
                    </div>
                </div>
                <div class="row-12 mt-4">
                    <div class="col-12 mb-4">
                        <h2 class="h4">
                           3. Comentario (Opcional)
                        </h2>
                    </div>
                    <div class="col-4 mb-4">
                        <textarea class="form-control" name="comentario" placeholder="Escriba su comentario .."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary" >Enviar</button>
                </div>
            </div>
        </form>
        <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        <%=script%>
    </script>
    </body>
</html>
