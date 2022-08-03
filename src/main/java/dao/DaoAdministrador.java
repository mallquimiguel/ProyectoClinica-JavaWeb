package dao;
import util.MySQLConexion;
import java.sql.*;
import java.util.*;
import modelo.*;
import Interface.InterAdministrador;
public class DaoAdministrador implements InterAdministrador{

    @Override
    public int eliminar(String codDoc) {
        int res=0;
            try {
            String sql = "delete from doctor where Cod_Doctor=?";
            Connection cn = MySQLConexion.getConexion();
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, codDoc);     
            st.executeUpdate();          
         } catch (Exception e) {
            e.printStackTrace();
         }    
            return res;
    }

    @Override
    public List<Paciente> FiltrarPaciente(String id, String id2) {
        List<Paciente> lista=new ArrayList();
     try{
      Connection cn=MySQLConexion.getConexion();
      String sql="SELECT p.Cod_Paciente,p.Nombre,p.Apellido,p.Dni,p.Correo,p.Telefono\n" +
"FROM paciente p\n" +
"WHERE p.Apellido LIKE ? OR p.Dni LIKE ? ";
      //preparar una instruccion para ejecutar el sql
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1,id+"%");
      st.setString(2,id2+"%");
      ResultSet rs=st.executeQuery();//obtener todo el listado 
      while(rs.next()){
          Paciente p=new Paciente();
          p.setCodPaciente(rs.getString(1));
          p.setNombre(rs.getString(2));
          p.setApellido(rs.getString(3));
          p.setDni(rs.getString(4));
          p.setCorreo(rs.getString(5));
          p.setTelefono(rs.getString(6));
          lista.add(p);
      }
     }catch(Exception ex){
         ex.printStackTrace();
     }
  return lista;
    }

    @Override
    public List<Historial> lisHistorial(String id) {
        List<Historial> lista = new ArrayList();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT h.Cod_Historial,p.Nombre,h.fecha,h.Motivo,h.Estado\n" +
"FROM historial h JOIN paciente p ON h.Cod_Paciente=p.Cod_Paciente\n" +
"WHERE h.Cod_Paciente=?";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery(); //obtener todo el listado
            while (rs.next()) {
                Historial h = new Historial();
                h.setCodHistorial(rs.getString(1));
                h.setNombrePaciente(rs.getString(2));
                h.setFecha(rs.getString(3));
                h.setMotivo(rs.getString(4));
                h.setEstado(rs.getString(5));
                lista.add(h);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public Paciente BusPaciente(String cod) {
        Paciente p=null;
     try{
      Connection cn=MySQLConexion.getConexion();
      String sql="SELECT p.Cod_Paciente,p.Nombre,p.Apellido,p.Telefono,p.Dni,p.Correo,p.Contrasena\n" +
"FROM paciente p\n" +
"WHERE p.Cod_Paciente=?";
      //preparar una instruccion para ejecutar el sql
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, cod);
      ResultSet rs=st.executeQuery();//obtener todo el listado 
      if(rs.next()){
          p=new Paciente();
          p.setCodPaciente(rs.getString(1));
          p.setNombre(rs.getString(2));
          p.setApellido(rs.getString(3));
          p.setTelefono(rs.getString(4));
          p.setDni(rs.getString(5));
          p.setCorreo(rs.getString(6));
          p.setContrasena(rs.getString(7));
      }
     }catch(Exception ex){
         ex.printStackTrace();
     }
  return p;        
    }

    @Override
    public Historial BusHistorial(String cod) {
        Historial h=null;
     try{
      Connection cn=MySQLConexion.getConexion();
      String sql="SELECT h.Cod_Historial,h.Cod_Paciente,h.Cod_Doctor,h.fecha,h.Cod_Cita,h.Motivo,h.Estado,h.Diagnostico,h.Receta,h.Tratamiento,\n" +
"d.Nombre,d.Apellido,e.Nombre,p.Apellido,p.Nombre \n" +
"FROM historial h JOIN paciente p ON h.Cod_Paciente=p.Cod_Paciente\n" +
"JOIN doctor d ON d.Cod_Doctor=h.Cod_Doctor\n" +
"JOIN especialidad e ON e.Cod_Especialidad=d.Cod_Especialidad\n" +
"WHERE h.Cod_Historial=?";
      //preparar una instruccion para ejecutar el sql
      PreparedStatement st=cn.prepareStatement(sql);
      st.setString(1, cod);
      ResultSet rs=st.executeQuery();//obtener todo el listado 
      if(rs.next()){
          h=new Historial();
          h.setCodHistorial(rs.getString(1));
          h.setCodPaciente(rs.getString(2));
          h.setCodDoctor(rs.getString(3));
          h.setFecha(rs.getString(4));
          h.setCodCita(rs.getString(5));
          h.setMotivo(rs.getString(6));
          h.setEstado(rs.getString(7));
          h.setDiagnostico(rs.getString(8));
          h.setReceta(rs.getString(9));
          h.setTratamiento(rs.getString(10));
          h.setNombreDcotor(rs.getString(11));
          h.setApeDcotor(rs.getString(12));
          h.setNomEsp(rs.getString(13));
          h.setApePac(rs.getString(14));
          h.setNomPac(rs.getString(15));
      }
     }catch(Exception ex){
         ex.printStackTrace();
     }
  return h;
    }

    @Override
    public void ModificarPaciente(Paciente p) {
        int respuesta=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call SP_CAMBIA_PACIENTE(?,?,?,?,?,?,?)}";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, p.getCodPaciente());
            st.setString(2, p.getNombre());
            st.setString(3, p.getApellido());
            st.setString(4, p.getTelefono());
            st.setString(5, p.getDni());
            st.setString(6, p.getCorreo());
            st.setString(7, p.getContrasena());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }

    @Override
    public void ModificarUsuarioPaciente(Usuario p) {
        int respuesta=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call SP_CAMBIA_USUARIO(?,?,?,?,?,?,?,?)}";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, p.getDni());
            st.setString(2, p.getCodUsuario());
            st.setString(3, p.getNombre());
            st.setString(4, p.getApellido());
            st.setString(5, p.getTelefono());
            st.setString(6, p.getCorreo());
            st.setString(7, p.getCargo());
            st.setString(8, p.getContrasena());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }

    @Override
    public String BusCodUsuario(String id) {
        String respuesta = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT u.Cod_Usuario\n" +
"FROM usuario u\n" +
"WHERE u.Dni=?";
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
    public void ModificarHistorial(Historial h) {
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call SP_CAMBIA_HISTORIAL(?,?,?,?,?,?,?,?,?,?)}";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, h.getCodHistorial());
            st.setString(2, h.getCodPaciente());
            st.setString(3, h.getCodDoctor());
            st.setString(4, h.getFecha());
            st.setString(5, h.getCodCita());
            st.setString(6, h.getMotivo());
            st.setString(7, h.getEstado());
            st.setString(8, h.getDiagnostico());
            st.setString(9, h.getReceta());
            st.setString(10, h.getTratamiento());
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }

    @Override
    public List<Encuesta> lisEncuesta(int an) {
        List<Encuesta> lista=new ArrayList();
     try{
      Connection cn=MySQLConexion.getConexion();
      String sql="{call SP_GRAFICO1(?)}";
      //preparar una instruccion para ejecutar el sql
      CallableStatement st=cn.prepareCall(sql);
      st.setInt(1, an);
      ResultSet rs=st.executeQuery();//obtener todo el listado 
      while(rs.next()){
         Encuesta e=new Encuesta();
         e.setNivelSastifacion(rs.getString(1));
         e.setValor(rs.getString(2));
          lista.add(e);
      }
     }catch(Exception ex){
         ex.printStackTrace();
     }
  return lista;
    }

    @Override
    public List<Disponibilidad> lisDis(String id){
        List<Disponibilidad> lista= new ArrayList();
        try {
            Connection cn=MySQLConexion.getConexion();
            String sql="select d.cod_disponibilidad, fecha_inicio, fecha_fin, turno, estado from disponibilidad d join detalle_disponibilidad dd on d.cod_disponibilidad=dd.cod_disponibilidad where cod_doctor=?";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs=st.executeQuery(); //obtener todo el listado
            while (rs.next()) {
                Disponibilidad d=new Disponibilidad();
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
    public void adiDisp(String id, Disponibilidad a) {
        String codDisp="";
        try{
      Connection cn=MySQLConexion.getConexion();
      String sql="{call SPdisp(?,?,?,?)}";
      CallableStatement st=cn.prepareCall(sql);
            st.setInt(1, a.getEstado());
            st.setString(2, a.getFechaInicio());
            st.setString(3, a.getFechaFin());
            st.setString(4, a.getTurno());

ResultSet rs=st.executeQuery();//obtener todo el listado 
      rs.next();//leer fila
      codDisp=rs.getString(1);
      //insertar el detalle
      sql="{call spdet_disp(?,?)}";
      CallableStatement st2=cn.prepareCall(sql);
            st2.setString(1, id);
            st2.setString(2, codDisp);
      
            st2.executeUpdate();    
      
     }catch(Exception ex){
         ex.printStackTrace();
     }
    }

    @Override
    public void anuladisp(String cod) {
        try {
            
            String sql="delete from disponibilidad where Cod_Disponibilidad=?";
            Connection cn=MySQLConexion.getConexion();
            PreparedStatement st=cn.prepareStatement(sql);
            st.setString(1, cod); 
            st.executeUpdate();
            
            sql="delete from detalle_disponibilidad where Cod_Disponibilidad=?";
            st=cn.prepareStatement(sql);
            st.setString(1, cod); 
            st.executeUpdate();
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    public int AdicionarDoctor(Doctor doc) {
        int resp=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call SP_ADI_DOCTOR(?,?,?,?,?)}";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado            
            st.setString(1, doc.getNomd());
            st.setString(2, doc.getFechai());
            st.setString(3, doc.getAped());
            st.setString(4, doc.getSexo());
            st.setString(5, doc.getCesp());           
            //Mandas a ejecutar
            resp=st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
            ex.printStackTrace();
        }
        return resp;
    }

     @Override
    public Doctor BusDoctor(String cod) {
        Doctor doc = null;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT d.Cod_Doctor,d.Nombre,d.Fecha_Ingreso, d.Apellido,d.Sexo,d.Cod_Especialidad,d.Cod_Consultorio \n" +
            " FROM doctor d WHERE d.Cod_Doctor=?";
            //preparar una instruccion para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, cod);
            ResultSet rs = st.executeQuery();//obtener todo el listado 
            if (rs.next()) {
                doc = new Doctor();
                doc.setCodd(rs.getString(1));
                doc.setNomd(rs.getString(2));
                doc.setFechai(rs.getString(3));
                doc.setAped(rs.getString(4));
                doc.setSexo(rs.getString(5));
                doc.setCesp(rs.getString(6));
                doc.setCcon(rs.getString(7));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return doc;
    }
    
    @Override
    public void ModificarDoctor(Doctor d) {
       int respuesta = 0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "{call SP_CAMBIA_DOCTOR(?,?,?,?,?,?,?)}";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado           
            st.setString(1, d.getCodd());
            st.setString(2, d.getNomd());
            st.setString(3, d.getFechai());
            st.setString(4, d.getAped());
            st.setString(5, d.getSexo());       
            st.setString(6, d.getCesp());       
            st.setString(7, d.getCcon());       
            //Mandas a ejecutar
            st.executeUpdate();
        } catch (Exception ex) {
            //para los errores
        }
    }
    
}
