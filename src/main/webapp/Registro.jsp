<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro de cuenta</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="plugins/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
    </head>
    <body style="padding-top: 20px;background: #edf2f7">
        <%
            String msmError=(String)request.getAttribute("rep");
            String script="",bgcolor="";
            String msmPac=(String)request.getAttribute("registroPac");
            String msmAdmin=(String)request.getAttribute("registroAdmi");
            if(msmError==null){
                msmError="";
                bgcolor="white";
            }
            if(msmError=="rep"){
                bgcolor="danger";
            script="Swal.fire({position: 'center',type: 'error',title: 'Dni repetido',text: 'Ingrese otro dni',  showConfirmButton: true,})";
            msmError="Dni repetido";
            }
            if(msmPac=="Paciente"){
            script="Swal.fire({title: 'Usuario creado',type: 'success',}).then(function() {window.location = 'index.jsp';});";
            msmError="Paciente";
            }
            if(msmAdmin=="Administrador"){
            script="Swal.fire({title: 'Usuario creado',type: 'success',}).then(function() {window.location = 'index.jsp';});";
            msmError="Administrador";
            }
        %>
        <div class="container p-4 ">
            <div class="col p-4 py-6 bg-white">
                <div class="col-4">
                    <label class="h2">Registrate</label>
                </div>
                <div class="col">
                    <form action="controlUsuario?opc=2" method="post">
                        <div class="row">
                            <div class="col-6">
                                <label for="cargo">Cargo</label>
                                <select 
                                        class="form-control"
                                        name="cb" id="cargo">
                                        <option value="Paciente">Paciente</option>
                                        <option value="Administrador">Administrador</option>
                                    </select>
                            </div>
                            <div class="col-6"></div>
                            <div class="col-6 mt-4">
                                <label for="dni" class="text-sm">DNI</label>
                                    <input
                                        type="number"
                                        name="dni"
                                        id="dni"
                                        autofocus
                                        class="form-control"
                                        required
                                        />
                            </div>
                            <div class="col-6 mt-4">
                                        <label for="contraseña" class="text-sm">Contraseña</label>
                                    <input
                                        type="password"
                                        name="pass"
                                        id="contraseña"
                                        class="form-control"
                                        required
                                        />
                            </div>
                            <div class="col-6 mt-4">
                                        <label for="text" class="text-sm">Nombre</label>
                                    <input
                                        type="text"
                                        name="nom"
                                        id="nom"
                                        class="form-control"
                                        required
                                        />
                            </div>
                            <div class="col-6 mt-4">
                                        <label for="apellido" class="text-sm">Apellido</label>
                                    <input
                                        type="text"
                                        name="apellido"
                                        id="apellido"
                                        class="form-control"
                                        required
                                        />
                            </div>
                            <div class="col-6 mt-4">
                                        <label for="telf" class="text-sm">Teléfono</label>
                                    <input
                                        type="number"
                                        name="telf"
                                        id="telf"
                                        class="form-control"
                                        required
                                    />
                            </div>
                            <div class="col-6 mt-4">
                                        <label for="correo" class="text-sm">Correo</label>
                                    <input
                                        type="email"
                                        name="correo"
                                        id="correo"
                                        class="form-control"
                                        required
                                    />
                            </div>
                            <div class="rounded bg-<%=bgcolor%> mt-4">
                                <p class="text-white mt-2 text-center"><%=msmError%></p>
                            </div>
                            <div class="d-grid gap-2 mt-4">
                                            <button type="submit" 
                                                class="btn btn-success btn-block text-uppercase mb-2 rounded shadow-sm"
                                                name="Envia">Crear cuenta</button>
                                        </div>
                            <div class="col">
                            <sapn>¿Tienes cuenta? </span>    
                            <a href="index.jsp">Ingrese aquí</a>
                    </form>
                </div>
            </div>
        </div>
            <script src="plugins/sweetalert2/sweetalert2.all.min.js" type="text/javascript"></script>
        <script type="text/javascript">
         <%=script%>       
    </script>
    </body>
</html>
