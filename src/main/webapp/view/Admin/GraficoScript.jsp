<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.DaoAdministrador, modelo.Encuesta" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grafico de encuesta</title>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <div class="row">
            <div class="col-6">
                <h2 class="h4">Tabla de encuestados</h2>
            <table class="table table-hover table-striped">
                <tr>
                    <th>Cantidad de Encuetados</th>
                    <th>Nivel de satisfación</th>
                </tr>
        <%
            DaoAdministrador obj = new DaoAdministrador();
            int op = Integer.parseInt(request.getParameter("opc"));
            String tipo = "";
            if (op == 1) {
                tipo = "pie";
            }
            if (op == 2) {
                tipo = "bar";
            }
            if (op == 3) {
                tipo = "line";
            }
            int an = Integer.parseInt(request.getParameter("anio"));
            String leyenda = "", datos = "";
            for (Encuesta x : obj.lisEncuesta(an)) {
                datos += x.getValor()+ ",";
                leyenda += "'" + x.getNivelSastifacion()+ "',";
                out.print("<tr><td>"+x.getValor()+"<td>"+x.getNivelSastifacion());
            }
            datos = "[" + datos.substring(0, datos.length() - 1) + "]";
            leyenda = "[" + leyenda.substring(0, leyenda.length() - 1) + "]";
        %>
        </table>
        </div>
            <div class="col-6">
                <h2 class="h4">Gráfico empleando Chart.js</h2>
            <canvas id="myChart" width="600" height="300"></canvas>
            </div>
        </div>
    </body>
    <script>
        const ctx = document.getElementById('myChart').getContext('2d');
        const myChart = new Chart(ctx, {
        type: '<%=tipo%>',
                data: {
                labels: <%=leyenda%>,
                        datasets: [{
                        label: 'Encuestados',
                                data: <%=datos%>,
                                backgroundColor: [
                                        'orange',
                                        'blue',
                                        'red',
                                        'cyan',
                                        'rgba(153, 102, 255, 0.2)',
                                        'rgba(255, 159, 64, 0.2)'
                                ]
                        }]//dataset    
                }//data
        });
    </script>
</html>
