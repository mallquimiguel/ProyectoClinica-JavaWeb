package dao;
import util.MySQLConexion;
import java.sql.*;
import java.util.*;
import modelo.*;
import Interface.InterPacienteNavbar;
public class DaoPacienteNavbar implements InterPacienteNavbar{

    @Override
    public List<Cita> lisCitaReservadas(String id) {
        List<Cita> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT c.Cod_Cita,c.Cod_Doctor,c.Fecha_Atencion,c.Fecha_Salida,c.Tipo,c.Total_Pagar,c.Cod_Detalle \n" +
"FROM cita c JOIN paciente p ON c.Cod_Paciente=p.Cod_Paciente \n" +
"JOIN doctor d ON d.Cod_Doctor=c.Cod_Doctor\n" +
"WHERE c.Cod_Paciente=?";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery(); //obtener todo el listado
            while (rs.next()) {
                Cita ct = new Cita();
                ct.setCodCita(rs.getString(1));
                ct.setCodDoctor(rs.getString(2));
                ct.setFechaIni(rs.getString(3));
                ct.setFechaFin(rs.getString(4));
                ct.setTipo(rs.getString(5));
                ct.setTotalPagar(rs.getDouble(6));
                ct.setCodDetalle(rs.getString(7));
                lista.add(ct);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Historial> lisResultadosMedi(String id) {
        List<Historial> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT h.Cod_Historial,h.fecha,h.Motivo,h.Estado,h.Diagnostico,h.Receta,h.Tratamiento  \n" +
"FROM historial h JOIN paciente p ON h.Cod_Paciente=p.Cod_Paciente\n" +
"WHERE p.Cod_Paciente=? and h.Estado=\"Culminado\"";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery(); //obtener todo el listado
            while (rs.next()) {
                Historial h = new Historial();
                h.setCodHistorial(rs.getString(1));
                h.setFecha(rs.getString(2));
                h.setMotivo(rs.getString(3));
                h.setEstado(rs.getString(4));
                h.setDiagnostico(rs.getString(5));
                h.setReceta(rs.getString(6));
                h.setTratamiento(rs.getString(7));
                lista.add(h);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public String BusCodDispModific(String id, String id2) {
        String respuesta = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT d.Cod_Disponibilidad\n" +
"FROM detalle_disponibilidad dd JOIN disponibilidad d ON dd.Cod_Disponibilidad=d.Cod_Disponibilidad\n" +
"JOIN doctor doc ON doc.Cod_Doctor=dd.Cod_Doctor\n" +
"JOIN cita ct ON ct.Cod_Doctor=doc.Cod_Doctor\n" +
"WHERE ct.Cod_Cita=? AND  dd.Cod_detalle=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            st.setString(2, id2);
            ResultSet rs = st.executeQuery();
            if(rs.next()) {
                respuesta = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return respuesta;
    }

    @Override
    public String BusCodTurnModific(String id) {
        String respuesta = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT d.Turno\n" +
"FROM cita c JOIN detalle_disponibilidad dd ON c.Cod_Detalle=dd.Cod_Detalle\n" +
"JOIN disponibilidad d ON d.Cod_Disponibilidad=dd.Cod_Disponibilidad\n" +
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
    public void CambiaDispAnular(Disponibilidad dp) {
        int respuesta=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_CAMBIA_DISPANULAR(?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            //Obtener todo el listado
            st.setString(1, dp.getCodDisponibilidad());
            st.setString(2, dp.getFechaInicio());
            st.setString(3, dp.getFechaFin());
            st.setString(4, dp.getTurno());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
        }
    }

    @Override
    public void EliminarCita(String id) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "DELETE FROM cita WHERE Cod_Cita=?";
            //prepara una instrución para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1,id);
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }

    @Override
    public void EliminarHistorial(String id) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "DELETE FROM historial WHERE Cod_Cita=?";
            //prepara una instrución para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1,id);
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }
    
}
