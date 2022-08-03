package dao;
import util.MySQLConexion;
import java.util.*;
import java.sql.*;
import Interface.InterReserva;
import modelo.*;
public class Negocio implements InterReserva{

    @Override
    public List<Especialidad> lisEspecialidad() {
        List<Especialidad> lista = new ArrayList<>();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "select Cod_Especialidad,Nombre,Precio from especialidad";
            //prepara una instrución para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            //Obtener todo el listado
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Especialidad ep = new Especialidad();
                ep.setCodEsp(rs.getString(1));
                ep.setNombreEsp(rs.getString(2));
                ep.setPrecioEsp(rs.getDouble(3));
                lista.add(ep);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Doctor> lisDocE(String id) {
        List<Doctor> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT Apellido,Nombre,Fecha_Ingreso,Cod_Doctor,sexo FROM doctor where Cod_Especialidad=?";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery(); //obtener todo el listado
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setAped(rs.getString(1));
                d.setNomd(rs.getString(2));
                d.setFechai(rs.getString(3));
                d.setCodd(rs.getString(4));
                d.setSexo(rs.getString(5));
                lista.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Disponibilidad> lisDisponibilidad(String id) {
        List<Disponibilidad> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT d.Cod_disponibilidad,d.Fecha_Inicio, d.Fecha_Fin, d.Turno, d.Estado  \n" +
            "FROM disponibilidad d JOIN detalle_disponibilidad e ON d.Cod_Disponibilidad=e.Cod_Disponibilidad \n" +
            "WHERE e.Cod_Doctor=? AND Estado=0 AND d.Fecha_Inicio >= NOW();";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();//obtener todo el listado 
            while (rs.next()) {
                Disponibilidad d = new Disponibilidad();
                d.setCodDisponibilidad(rs.getString(1));
                d.setFechaInicio(rs.getString(2));
                d.setFechaFin(rs.getString(3));
                d.setTurno(rs.getString(4));
                d.setEstado(rs.getInt(5));
                lista.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public int AdicionarEncuesta(Encuesta ec) {
        int respuesta=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_ADI_ENCUESTA(?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, ec.getFecha());
            st.setString(2, ec.getNivelSastifacion());
            st.setString(3, ec.getValor());
            st.setString(4, ec.getComentario());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
        return respuesta;
    }

    @Override
    public int AdicionarCita(Cita ct) {
        int respuesta=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_ADI_CITA(?,?,?,?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, ct.getCodPaciente());
            st.setString(2, ct.getFechaIni());
            st.setString(3, ct.getFechaFin());
            st.setString(4, ct.getCodDoctor());
            st.setString(5, ct.getTipo());
            st.setDouble(6, ct.getTotalPagar());
            st.setString(7, ct.getCodDetalle());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
        return respuesta;
    }

    @Override
    public void CambiaDisponibilidad(Disponibilidad dp) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_CAMBIA_DISPONIBILIDAD(?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, dp.getCodDisponibilidad());
            st.setString(2, dp.getFechaInicio());
            st.setString(3, dp.getFechaFin());
            st.setString(4, dp.getTurno());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }

    @Override
    public String BusCodDetalle(String id) {
        String respuesta = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT dd.Cod_Detalle \n" +
            "FROM detalle_disponibilidad dd JOIN disponibilidad d ON dd.Cod_Disponibilidad=d.Cod_Disponibilidad\n" +
            "WHERE d.Cod_Disponibilidad=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                respuesta = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return respuesta;
    }

    @Override
    public String BusCodCita(String id) {
        String respuesta = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT c.Cod_Cita\n" +
        "FROM cita c JOIN paciente p ON c.Cod_Paciente=p.Cod_Paciente\n" +
        "WHERE c.Cod_Detalle=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                respuesta = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return respuesta;
    }

    @Override
    public int AdicionarHistorial(Historial h) {
        int respuesta=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_ADI_HISTORIAL(?,?,?,?,?,?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, h.getCodPaciente());
            st.setString(2, h.getCodDoctor());
            st.setString(3, h.getFecha());
            st.setString(4, h.getCodCita());
            st.setString(5, h.getMotivo());
            st.setString(6, h.getEstado());
            st.setString(7, h.getDiagnostico());
            st.setString(8, h.getReceta());
            st.setString(9, h.getTratamiento());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
        return respuesta;
    }

    @Override
    public List<Doctor> lisDocEBus(String id, String id2) {
        List<Doctor> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT Apellido,Nombre,Fecha_Ingreso,Cod_Doctor,sexo FROM doctor where Cod_Especialidad=? and Cod_Doctor=?";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, id2);
            ResultSet rs = st.executeQuery(); //obtener todo el listado
            while (rs.next()) {
                Doctor d = new Doctor();
                d.setAped(rs.getString(1));
                d.setNomd(rs.getString(2));
                d.setFechai(rs.getString(3));
                d.setCodd(rs.getString(4));
                d.setSexo(rs.getString(5));
                lista.add(d);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }
    
    
}
