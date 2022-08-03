package Interface;
import modelo.*;
import java.util.*;

public interface InterLogin {
    int ValidarDni(String id);//Validar dni
    int ValidarUsuario(Usuario us);//Validar usuario si es admi o paciente
    int AdicionarUsuario(Usuario us);//Crear usuario
    int AdicionarAdministrador(Administrador ad);//Crear admi
    int AdicionarPaciente(Paciente pa);//crear paciente
    List<Paciente> lisPac();
    List<Administrador> lisAdm();
}
