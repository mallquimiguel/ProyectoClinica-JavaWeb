package Interface;
import modelo.*;
import java.util.*;
public interface InterAdministrador {
    int eliminar(String codDoc);
    List<Paciente> FiltrarPaciente(String id,String id2);
    List<Historial> lisHistorial(String id);
    Paciente BusPaciente(String cod);
    Historial BusHistorial(String cod);
    void ModificarPaciente(Paciente p);
    void ModificarUsuarioPaciente(Usuario p);
    String BusCodUsuario(String id);
    void ModificarHistorial(Historial h);
    List<Encuesta> lisEncuesta(int an);
    List<Disponibilidad> lisDis(String id);
    void adiDisp(String id, Disponibilidad a);
    void anuladisp(String cod);
    int AdicionarDoctor(Doctor doc);
    Doctor BusDoctor(String cod);
    void ModificarDoctor(Doctor p);
}
