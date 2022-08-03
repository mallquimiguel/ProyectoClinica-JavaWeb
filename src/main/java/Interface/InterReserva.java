package Interface;
import modelo.*;
import java.util.*;
public interface InterReserva {
    //Reserva de una cita medica de manera online
    List<Especialidad> lisEspecialidad();//Listado de especialidades
    List<Doctor> lisDocE(String id);//Listado de doctores según el id de la espc
    List<Disponibilidad> lisDisponibilidad(String id);//Listado de fechas disponibles según el id de doc
    int AdicionarEncuesta(Encuesta ec);//Adicionar encusta cuando termine de llenar la encuesta
    int AdicionarCita(Cita ct);//Adicionar cita cuando termine de llenar la encuesta
    void CambiaDisponibilidad(Disponibilidad dp);//Cambia la disponibilidad de las fecha reservada
    String BusCodDetalle(String id);//Buscar código de detalle
    String BusCodCita(String id);//Buscar código de cita
    int AdicionarHistorial(Historial h);//Adicionar historial
    List<Doctor> lisDocEBus(String id,String id2);
}
