<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>       
        <%
            String mensaje = "";
            if (request.getAttribute("dato") != null)
                mensaje = (String)request.getAttribute("dato");
        %>
        <h1>Subir una imagen del Doctor</h1>
        <form name="fr" action="../../controlImagen" method="post" enctype="multipart/form-data">
            <div class="col-xs-12">
                <div class="form-group">
                    <input type="file" name="img" accept="image/png, .jprg, .jpg, image/gif" required>
                    <input type="submit" class="btn btn-primary"> 
                    <br>
                    <label>Formato de imágenes admitido png,jpg, gif y .jpeg. Tamaño máximo 5MB</label>
                    <br><%=mensaje%>
                    <div class="col-4"><a class="btn btn-primary" href="view/Admin/PagAgregarDoctor.jsp">Siguiente</a></div>
                </div>
            </div>
        </form>
    </body>
</html>
