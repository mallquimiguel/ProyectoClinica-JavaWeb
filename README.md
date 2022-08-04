# ProyectoClinica-JavaWeb
Curso: Desarrollo Web Integrado
Integrantes:
- Li Chia, Jimmy
- Mallqui Diaz, Miguel
- Lozano Marroquin, Hector

Fecha de inicio: 23 de enero de 2022
Fecha de fin: 28 de febrero de 2022

Se utiliza java con su complemento de JSP que lo que hace es comunicar el servidor con el fronted sin problemas, en el lado del fronted se esta utilizando Bootstrap para el diseño web que es una manera rápida de hacer diseño. para la base de datos en MYSQL se utiliza Xampp para poder almacenar los usuarios, doctores, horarios, para las alertas se utiliza un plugin con javascript y css de sweetalert2 que nos muestra el mensaje en la misma página de manera más llamativa. 

1) En el cargo puedes selecionar como paciente o administrado, en este caso vamos ingresar como administrador para agregar más horarios a los doctores. 
[![Captura-de-pantalla-2022-08-03-122920.jpg](https://i.postimg.cc/W3p3p3DG/Captura-de-pantalla-2022-08-03-122920.jpg)](https://postimg.cc/f3FZBMfy)
2) En el lado del servidor va a validar si el usuario es correcto o no, en la misma página captura ese mensaje que se le va a enviar y dependiendo mostrara la alerta correspondiente.    
[![Captura-de-pantalla-2022-08-03-122939.jpg](https://i.postimg.cc/wBmPtcNH/Captura-de-pantalla-2022-08-03-122939.jpg)](https://postimg.cc/VSz4pt4H)
3) Nos muestra otro página con 3 opciones.
[![Captura-de-pantalla-2022-08-03-123217.jpg](https://i.postimg.cc/mD5tdHjd/Captura-de-pantalla-2022-08-03-123217.jpg)](https://postimg.cc/JDjr0t9J)
4) Para hacer los gráficos se pide una encuesta al paciente al finalizar la reserva y se almacena en la base de datos. Se utiliza una biblioteca de javascript que se llama Chart.js para hacer gráficos, se le debe pasar un año para que busque en la base de datos una vez encontrado los pasa a diseñar el gráfico y déspues se muestra en la misma página.
[![Captura-de-pantalla-2022-08-03-123333.jpg](https://i.postimg.cc/q7gt2wXt/Captura-de-pantalla-2022-08-03-123333.jpg)](https://postimg.cc/yJ4YHFGB)
5) Pasando a otra página que es buscar pacientes, se utilizar el jquery para capturar mientra se escribe el primer carácter se mostrar los datos buscados sin actualizar la página. 
[![Captura-de-pantalla-2022-08-03-123402.jpg](https://i.postimg.cc/Gp02sR2f/Captura-de-pantalla-2022-08-03-123402.jpg)](https://postimg.cc/qNL0992c)
6) Se busca en el combobox la especialidad y luego se elige el doctor 
[![Captura-de-pantalla-2022-08-03-123423.jpg](https://i.postimg.cc/C1Q9zhMB/Captura-de-pantalla-2022-08-03-123423.jpg)](https://postimg.cc/2bn0tfZr)
7) Como los horarios ya caducaron se creara uno nuevo. Se le da al boton agregar disponibilidad.
[![Captura-de-pantalla-2022-08-03-123727.jpg](https://i.postimg.cc/BnJsWvj4/Captura-de-pantalla-2022-08-03-123727.jpg)](https://postimg.cc/QHYv1hgy)
8) Todos los datos lo almacenara en la base de datos.
[![Captura-de-pantalla-2022-08-03-124041.jpg](https://i.postimg.cc/dVh6V2kB/Captura-de-pantalla-2022-08-03-124041.jpg)](https://postimg.cc/jDrP8Jhw)
[![Captura-de-pantalla-2022-08-03-124116.jpg](https://i.postimg.cc/gjrXHDPt/Captura-de-pantalla-2022-08-03-124116.jpg)](https://postimg.cc/sGdgV5x5)
9) Nos muestra en la base de datos el código de disponibilidad DP029 con un estado en 0 que esta libre y 1 si esta ocupado.
[![Captura-de-pantalla-2022-08-03-124226.jpg](https://i.postimg.cc/MTpvzDXZ/Captura-de-pantalla-2022-08-03-124226.jpg)](https://postimg.cc/McgWD1yg)
10)Regresando a la página nos va a mostrar el listado que tiene la doctora.
[![Captura-de-pantalla-2022-08-03-124239.jpg](https://i.postimg.cc/5tNCt1RM/Captura-de-pantalla-2022-08-03-124239.jpg)](https://postimg.cc/nXgzR8xd)
11) Ingresamos con la ultima paciente para reservar una cita.
[![Captura-de-pantalla-2022-08-03-124411.jpg](https://i.postimg.cc/15GncfxQ/Captura-de-pantalla-2022-08-03-124411.jpg)](https://postimg.cc/jLjSRqdg)
12) Ingresando como paciente.
[![Captura-de-pantalla-2022-08-03-124549.jpg](https://i.postimg.cc/QtKVBMgv/Captura-de-pantalla-2022-08-03-124549.jpg)](https://postimg.cc/hzgK6c50)
[![Captura-de-pantalla-2022-08-03-124602.jpg](https://i.postimg.cc/brXr1j3r/Captura-de-pantalla-2022-08-03-124602.jpg)](https://postimg.cc/VrRzc2yP)
13) Nos muestra un listado de las especialidades
[![Captura-de-pantalla-2022-08-03-124617.jpg](https://i.postimg.cc/RZP0XtXj/Captura-de-pantalla-2022-08-03-124617.jpg)](https://postimg.cc/PCwhqCG4)
14) En ginecilogia nos va a mostrar el listado de los doctores.
[![Captura-de-pantalla-2022-08-03-124633.jpg](https://i.postimg.cc/wBCgGQJb/Captura-de-pantalla-2022-08-03-124633.jpg)](https://postimg.cc/kVv0V8Tx)
15) Aqui nos muestra el listado las disponibilidades del doctor solamente las fechas actuales.
[![Captura-de-pantalla-2022-08-03-124648.jpg](https://i.postimg.cc/jq8kqd3R/Captura-de-pantalla-2022-08-03-124648.jpg)](https://postimg.cc/dDy94vKf)
16) Ponemos el tipo de comprobante y motivo de cita.
[![Captura-de-pantalla-2022-08-03-124720.jpg](https://i.postimg.cc/FKQTCfzV/Captura-de-pantalla-2022-08-03-124720.jpg)](https://postimg.cc/FYDb7HjY)
17) Devemos completar la encuesta para que se envie en la base de datos y mueste el gráfico a los administradores.
[![Captura-de-pantalla-2022-08-03-124746.jpg](https://i.postimg.cc/N04kNpWQ/Captura-de-pantalla-2022-08-03-124746.jpg)](https://postimg.cc/rdD4sCVH)
[![Captura-de-pantalla-2022-08-03-124757.jpg](https://i.postimg.cc/TPRrWnhF/Captura-de-pantalla-2022-08-03-124757.jpg)](https://postimg.cc/tsM1KZ3N)
18) Una vez dado en el boton ok de la alerta nos va a enviar a otra página donde se muestra un listado del historial del paciente. Tambien podemos eliminar la reserva y el estado se vuelve 0 que significa disponible.
[![Captura-de-pantalla-2022-08-03-124829.jpg](https://i.postimg.cc/Y9PgVV8B/Captura-de-pantalla-2022-08-03-124829.jpg)](https://postimg.cc/XGwpBsTs)
19) Regresando a reservar de nuevo con la misma doctora se observa que ya no se encuentra por que ya en la base de datos el estado de esa reserva esta en 1 que significa ocupado.
[![Captura-de-pantalla-2022-08-03-124844.jpg](https://i.postimg.cc/fTCXQJ8v/Captura-de-pantalla-2022-08-03-124844.jpg)](https://postimg.cc/0b6rp2R6)
[![Captura-de-pantalla-2022-08-03-124918.jpg](https://i.postimg.cc/9M2FfBMw/Captura-de-pantalla-2022-08-03-124918.jpg)](https://postimg.cc/QB6r41cj)
