package Interface;

import java.util.List;
import modelo.*;

public interface InterPacienteNavbar {
    List<Cita> lisCitaReservadas(String id);
    List<Historial> lisResultadosMedi(String id);
    String BusCodDispModific(String id,String id2);
    String BusCodTurnModific(String id);
    void CambiaDispAnular(Disponibilidad dp);
    void EliminarCita(String id);
    void EliminarHistorial(String id);
}
