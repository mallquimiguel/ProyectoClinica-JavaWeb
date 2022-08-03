package dao;
import util.MySQLConexion;
import java.sql.*;
import modelo.*;
import java.util.*;
import Interface.InterLogin;
public class DaoUsuario implements InterLogin{

    @Override
    public int ValidarUsuario(Usuario us) {
        int respuesta = 0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(u.Cod_Usuario) as cantidad\n" +
            "FROM usuario u WHERE u.Dni=? and u.Contrasena=? and u.Cargo=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, us.getDni());
            st.setString(2, us.getContrasena());
            st.setString(3, us.getCargo());
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                respuesta = rs.getInt("cantidad");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return respuesta;
    }

    @Override
    public int AdicionarUsuario(Usuario us) {
        int resp=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_ADI_USUARIO(?,?,?,?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, us.getDni());
            st.setString(2, us.getNombre());
            st.setString(3, us.getApellido());
            st.setString(4, us.getTelefono());
            st.setString(5, us.getCorreo());
            st.setString(6, us.getCargo());
            st.setString(7, us.getContrasena());
            //Mandas a ejecutar
            resp=st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return resp;
    }

    @Override
    public int AdicionarAdministrador(Administrador ad) {
        int resp=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_ADI_ADMINISTRADOR(?,?,?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, ad.getNombre());
            st.setString(2, ad.getApellido());
            st.setString(3, ad.getTelefono());
            st.setString(4, ad.getDni());
            st.setString(5, ad.getCorreo());
            st.setString(6, ad.getContrasena());
            //Mandas a ejecutar
            resp=st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return resp;
    }

    @Override
    public int AdicionarPaciente(Paciente pa) {
        int resp=0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "call SP_ADI_PACIENTE(?,?,?,?,?,?);";
            //prepara una instrución para ejecutar el sql
            CallableStatement st = cn.prepareCall(sql);
            //Obtener todo el listado
            st.setString(1, pa.getNombre());
            st.setString(2, pa.getApellido());
            st.setString(3, pa.getTelefono());
            st.setString(4, pa.getDni());
            st.setString(5, pa.getCorreo());
            st.setString(6, pa.getContrasena());
            //Mandas a ejecutar
            resp=st.executeUpdate();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return resp;
    }

    @Override
    public int ValidarDni(String id) {
        int respuesta = 0;
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT COUNT(u.Cod_Usuario)as Cuenta FROM usuario u WHERE u.Dni=?";
            PreparedStatement st = cn.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                respuesta = rs.getInt("Cuenta");
            }
        } catch (Exception e) {
        }
        return respuesta;
    }

    @Override
    public List<Paciente> lisPac() {
        List<Paciente> lista = new ArrayList<>();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT Cod_Paciente, Apellido, Nombre, Telefono, Dni, Correo FROM paciente";
            //prepara una instrución para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            //Obtener todo el listado
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Paciente p = new Paciente();
                p.setCodPaciente(rs.getString(1));
                p.setApellido(rs.getString(2));
                p.setNombre(rs.getString(3));
                p.setTelefono(rs.getString(4));
                p.setDni(rs.getString(5));
                p.setCorreo(rs.getString(6));
                lista.add(p);
            }
        } catch (Exception ex) {
            //para los errores
            ex.printStackTrace();
        }
        return lista;
    }

    @Override
    public List<Administrador> lisAdm() {
        List<Administrador> lista = new ArrayList<>();
        try {
            Connection cn = MySQLConexion.getConexion();
            String sql = "SELECT Dni, Apellidos, Nombre FROM administrador";
            //prepara una instrución para ejecutar el sql
            PreparedStatement st = cn.prepareStatement(sql);
            //Obtener todo el listado
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Administrador a = new Administrador();
                a.setDni(rs.getString(1));
                a.setApellido(rs.getString(2));
                a.setNombre(rs.getString(3));
                lista.add(a);
            }
        } catch (Exception ex) {
            //para los errores
            ex.printStackTrace();
        }
        return lista;
    }
    
}
