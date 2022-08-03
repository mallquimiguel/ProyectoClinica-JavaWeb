<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.Negocio, modelo.* "%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página de formulario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body style="padding-top: 100px">
        <%
            String codD=(String)request.getAttribute("codD");
            String nombreD="";
            String codEsp="";
            String nomEsp=(String)request.getAttribute("nomE");
            String fi=(String)request.getAttribute("fechaI");
            String ff=(String)request.getAttribute("fechaF");
            String sx=(String)request.getAttribute("sexo");
            double precioE=0;
            Negocio obj=new Negocio();
            for(Especialidad x:obj.lisEspecialidad()){
                if(x.getNombreEsp().equals(nomEsp)){
                    precioE=x.getPrecioEsp();
                    codEsp=x.getCodEsp();
                }
            }
            //Por sessiones
            HttpSession ses=request.getSession();
            //Obtener el código de paciente
            String tipo=(String)ses.getAttribute("codPaciente");  
            //almacenar el precio
            ses.setAttribute("dato2", precioE);
            ses.setAttribute("dato4", codD);
            ses.setAttribute("dato5", fi);
            ses.setAttribute("dato6", ff);
            
             for(Doctor x:obj.lisDocE(codEsp)){
                if(x.getCodd().equals(codD)){
                    nombreD=x.getNomd();
                }
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
        <form action="control?opc=4" method="post">
        <div class="container">
            <div class="row-6 mb-4">
                <a href="control?opc=2&codDoctor=<%=codD%>&cod=<%=codEsp%>&nomDoctor=<%=nombreD%>&nomEsp=<%=nomEsp%>&sexo=<%=sx%>" class="btn btn-primary">
                        Regresar
                    </a>
            </div>
                <div class="row">
                    <div class="col-4">
                        <label class="mb-2">Tipo de tratamiento</label>
                        <input type="text" class="form-control" value="<%=nomEsp%>" name="esp" readonly> 
                    </div>
                    <div class="col-4">
                        <label class="mb-2">Código Doctor</label>
                        <input type="text" class="form-control" value="<%=codD%>" name="codD" readonly> 
                    </div>
                    <div class="col-4">
                        <label class="mb-2">Precio</label>
                        <input type="text" class="form-control" value="<%=precioE%>"  name="precio" readonly> 
                    </div>
                </div>
            <div class="row mt-4">
                <div class="col-4">
                        <label class="mb-2">Fecha de inicio</label>
                        <input type="datetime" class="form-control" value="<%=fi%>"  name="fechaI" readonly> 
                    </div>
                    <div class="col-4">
                        <label class="mb-2">Fecha final</label>
                        <input type="datetime" class="form-control" value="<%=ff%>"  name="fechaF" readonly> 
                    </div>
                    <div class="col-4">
                        <label class="mb-2">Código Paciente</label>
                        <input type="text" class="form-control" value="<%=tipo%>"  name="codP" readonly> 
                    </div>
            </div>
            <div class="row mt-4">
                    <div class="col-4">
                        <label class="mb-2">Tipo de comprobante</label>
                        <select class="form-control" name="cbC"> 
                            <option value="Factura">Elegir</option>
                            <option value="Boleta">Boleta</option>
                            <option value="Factura">Factura</option>
                        </select>
                    </div>
                        <div class="col-4">
                            <label class="mb-2">Motivo de la cita</label>
                            <textarea class="form-control" name="motivo" required="" "></textarea> 
                        </div>
            </div>
            <div class="d-grid gap-2 mt-4">
                <button type="submit" class="btn btn-primary" >Enviar</button>
            </div>
        </div>    
        </form>    
    </body>
</html>
