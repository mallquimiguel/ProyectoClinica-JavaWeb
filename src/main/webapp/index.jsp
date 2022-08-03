<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
        <style type="text/css">
            .login,
            .image {
                min-height: 100vh;
            }
            .bg-image {
                background-image: url('https://media.gettyimages.com/photos/patient-in-the-hospital-picture-id1136865476?s=2048x2048');
                background-size: cover;
                background-position: center;
            }
        </style>
    </head>
    <body>
        <%
            HttpSession ses=request.getSession();
            String nombrePac=(String)ses.getAttribute("nombrePaciente");
            String nombreAdm=(String)ses.getAttribute("nombreAdministrador");
            String msmError=(String)request.getAttribute("error");
            String script="";
            String msmPac=(String)request.getAttribute("Paciente");
            String msmAdmin=(String)request.getAttribute("Administrador");
            if(msmError==null){
                msmError="";
            }
            if(msmError=="error"){
            script="Swal.fire({position: 'center',type: 'error',title: 'Cuenta incorrecta',  showConfirmButton: true,})";
            msmError="Credenciales incorrectas";
            }
            if(msmPac=="Paciente"){
            script="Swal.fire({title: 'Bienvenid@ "+nombrePac+"',type: 'success',}).then(function() {window.location = 'view/Paciente/PagEspecialidad.jsp';});";
            msmError="";
            }
            if(msmAdmin=="Administrador"){
            script="Swal.fire({title: 'Bienvenid@ "+nombreAdm+"',type: 'success',}).then(function() {window.location = 'view/Admin/PagGestion.jsp';});";
            msmError="";
            }
        %>
        
        <div class="container-fluid">
            <div class="row no-gutter">
                <!-- The image half -->
                <div class="col-md-6 d-none d-md-flex bg-image"></div>
                <!-- The content half -->
                <div class="col-md-6 bg-light">
                    <div class="login d-flex align-items-center py-5">
                        <!-- Demo content-->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-12 text-center">Inicio de sesión</h3>
                                    <form id="id_form" action="controlUsuario?opc=1" method="post">
                                        <div class="form-group mb-3">
                                            <label class="mb-2 h6">Cargo</label>
                                            <select class="form-control" name="cb">
                                                <option value="Paciente">Paciente</option>
                                                <option value="Administrador">Administrador</option>
                                            </select>
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="id_dni" class="mb-2 h6">Dni</label>
                                            <input id="id_dni" type="text" name="dni" placeholder="" required class="form-control ">
                                        </div>
                                        <div class="form-group mt-3">
                                            <label for="password" class="mb-2 h6">Contraseña</label>
                                            <input id="password" type="password" name="password" placeholder="**********" required="" class="form-control">
                                        </div>
                                        <div class="custom-control custom-checkbox mt-3 mb-3">
                                            <input id="customCheck1" type="checkbox" class="custom-control-input">
                                            <label for="customCheck1" class="custom-control-label">Recuérdame</label>
                                        </div>
                                        <div class="bg-danger">
                                            <p class="text-white mb-4 text-center"><%=msmError%></p>
                                        </div>
                                        <div class="d-grid gap-2">
                                            <button type="submit" 
                                                    class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm"
                                                    name="Envia"
                                                    id="Login">Inicia sesión</button>
                                        </div>
                                        <div class="">
                                            <p class="text-center">¿No cuentas con una cuenta? <a href="Registro.jsp" class="text-success">Regístrate</a></p>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><!-- End -->

                    </div>
                </div><!-- End -->

            </div>
        </div>
        <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        <%=script%>
    </script>
    </body>
</html>
