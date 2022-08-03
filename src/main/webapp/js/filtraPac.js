//Me permite saber si tengo el jquery instalado
$(document).ready(function () {
    //cuando se escriba el nombre del paciente
    $(document).on('keyup', '#txtnom', function () {
        //Asiganamos un valor
        let valor = $(this).val();
        //llamamos a la función 
        listaPac(valor);

    });
    //Cuando se escriba el dni del paciente
    $(document).on('keyup', '#txtdni', function () {
        //Asiganamos un valor
        let valor2 = $(this).val();
        //llamamos a la función 
        listaPacDni(valor2);

    });

//Ponga una función para el paciente
    function listaPac(consulta) {
        //llamar al servlet
        opc = "2";
        //get o post
        //las comillas son importantes
        //reponse captura el valor
        $.get("../../controlAdministrador", {opc, consulta}, (response) => {
            // a travez de mi varible constante capturo todo esa información
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador
            //variable temporal para poder leer la información
            let template = "";
            //para saber los datos en un emulador
            console.log(misDatos);
            //la comilla especial nos permite colocar las comillas sin tener problemas
            template += ` 
            <div class="col-4">
                    <h2 class="h4">Agregar Paciente: </h2>
                </div>
                <div class="col-2 mb-4">
                    <a href="PagAgregarPaciente.jsp"><img src="../../img/botones/agregar.png" width="50px"></a>    
                </div>
             <table class="table table-hover table-striped"> 
                                    <thead class="text-white bg-dark"> 
                                        <tr> 
                                            <th>Código paciente</th> 
                                            <th>Apellido</th> 
                                            <th>Nombre</th> 
                                            <th>Telefono</th>
                                            <th>Dni</th>
                                            <th>Correo</th>
                                            <th>Historial</th>    
                                            <th>Modificar</th>    
                                           </tr> 
                                    </thead> 
                                    <tbody>`;
            //Leer fila por fila
            misDatos.forEach(midato => {
                template += ` 
                <tr> 
                    <td>${midato.codPaciente}</td> 
                    <td>${midato.apellido}</td> 
                    <td>${midato.nombre}</td> 
                    <td>${midato.telefono}</td>
                    <td>${midato.dni}</td>
                    <td>${midato.correo}</td>
                    <td><a class="btn btn-primary" href="../../controlAdministrador?opc=4&cod=${midato.codPaciente}">Historial</a></td>
                <td><a href="../../controlAdministrador?opc=5&cod=${midato.codPaciente}"><img src="../../img/botones/Edit.gif""></a>
                             </tr>`;
            })
            template += `</tbody></table>`;
            $("#tablares").html(template);

        })
    }
    
//Ponga otro funcion para el dni 
    function listaPacDni(consultaDni) {
        //llamar al servlet
        opc = "2";
        //get o post
        //las comillas son importantes
        //reponse captura el valor
        $.get("../../controlAdministrador", {opc, consultaDni}, (response) => {
            // a travez de mi varible constante capturo todo esa información
            const misDatos = JSON.parse(response);//recuperar la informacion q envio el controlador
            //variable temporal para poder leer la información
            let template = "";
            //para saber los datos en un emulador
            console.log(misDatos);
            //la comilla especial nos permite colocar las comillas sin tener problemas
            template += ` 
            <div class="col-4">
                    <h2 class="h4">Agregar Paciente: </h2>
                </div>
                <div class="col-2 mb-4">
                    <a href="PagAgregarPaciente.jsp"><img src="../../img/botones/agregar.png" width="50px"></a>    
                </div>
             <table class="table table-hover table-striped"> 
                                    <thead class="text-white bg-dark"> 
                                        <tr> 
                                            <th>Código paciente</th> 
                                            <th>Apellido</th> 
                                            <th>Nombre</th> 
                                            <th>Telefono</th>
                                            <th>Dni</th>
                                            <th>Correo</th>
                                            <th>Historial</th>    
                                            <th>Modificar</th>
                                            
                                            </tr> 
                                    </thead> 
                                    <tbody>`;
            //Leer fila por fila
            misDatos.forEach(midato => {
                template += ` 
                <tr> 
                    <td>${midato.codPaciente}</td> 
                    <td>${midato.apellido}</td> 
                    <td>${midato.nombre}</td> 
                    <td>${midato.telefono}</td>
                    <td>${midato.dni}</td>
                    <td>${midato.correo}</td>
                    <td><a class="btn btn-primary" href="../../controlAdministrador?opc=4&cod=${midato.codPaciente}">Historial</a></td>
                    <td><a href="../../controlAdministrador?opc=5&cod=${midato.codPaciente}"><img src="../../img/botones/Edit.gif"></a>
                             </tr>`;
            })
            template += `</tbody></table>`;
            $("#tablares").html(template);

        })
    }
    

})