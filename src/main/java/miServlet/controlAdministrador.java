package miServlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import static java.lang.System.out;
import modelo.*;

public class controlAdministrador extends HttpServlet {
    DaoAdministrador obj = new DaoAdministrador();
    DaoUsuario daou=new DaoUsuario();
    Paciente p=new Paciente();
    Usuario u=new Usuario();
    Negocio n=new Negocio();
    Doctor d = new Doctor();
    Historial h=new Historial();
    Disponibilidad a=new Disponibilidad();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int op = Integer.parseInt(request.getParameter("opc"));
        if (op == 1) Eliminar(request, response);
        if (op == 2) filtrar(request, response); 
        if (op == 3) AgregarPaciente(request, response); 
        if (op == 4) ListHistorialPac(request, response); 
        if (op == 5) ModificarPaciente(request, response); 
        if (op == 6) GuardarModfPaciente(request, response); 
        if (op == 7) ModificarHistorial(request, response);
        if (op == 8) GuardarModfHistorial(request, response);
        if (op == 9) LisDis(request, response);
        if (op == 10) adiDis(request, response);
        if (op == 11) grabaDis(request, response);
        if (op == 12) eliDisp(request, response);
        if (op == 13) AgregarDoctor(request, response);
        if (op == 14) ModificarDoctor(request, response);
        if (op == 15) GuardarModfDoctor(request, response); 
    }
    
    //Eliminar doctor desde gestion de doctores
    protected void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String codDoc = request.getParameter("cod");
            obj.eliminar(codDoc);
            response.sendRedirect("view/Admin/pagGestionDocs.jsp");
     }    
    
    //Filtrar con ajax para gestion de pacientes
    protected void filtrar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cod = request.getParameter("consulta");
        String cod2 = request.getParameter("consultaDni");
        PrintWriter out = response.getWriter();
        Gson gs = new Gson();
        out.println(gs.toJson(obj.FiltrarPaciente(cod,cod2)));
    }
    
    protected void AgregarPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //variable
        int respuesta;
        //recuperar datos
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String dni = request.getParameter("dni");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("password");
        String cargo = request.getParameter("cargo");
        //Agregar ususario
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setTelefono(telefono);
        u.setDni(dni);
        u.setCorreo(correo);
        u.setContrasena(contrasena);
        u.setCargo(cargo);
        respuesta=daou.ValidarDni(dni);//validar dni
        if(respuesta==0){
            daou.AdicionarUsuario(u);
            //Agregar paciente
            p.setNombre(nombre);
            p.setApellido(apellido);
            p.setTelefono(telefono);
            p.setDni(dni);
            p.setCorreo(correo);
            p.setContrasena(contrasena);
            daou.AdicionarPaciente(p);
            request.setAttribute("msmeAgregarPac", "agregarPa");
            request.getRequestDispatcher("view/Admin/PagAgregarPaciente.jsp").forward(request, response);
        }else{
            request.setAttribute("rep", "rep");//para la alerta
            request.getRequestDispatcher("view/Admin/PagAgregarPaciente.jsp").forward(request, response);
        }
        
    }
    protected void ListHistorialPac(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codPac = request.getParameter("cod");
        request.setAttribute("dato", obj.lisHistorial(codPac));
        request.getRequestDispatcher("view/Admin/PagHistorialPaciente.jsp").forward(request, response);
    }
    
    protected void ModificarPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codPac = request.getParameter("cod");
        request.setAttribute("dato", obj.BusPaciente(codPac));
        request.getRequestDispatcher("view/Admin/PagModificarPaciente.jsp").forward(request, response);
    }
    
    protected void GuardarModfPaciente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codP=request.getParameter("codPaciente");
        p.setCodPaciente(request.getParameter("codPaciente"));
        p.setDni(request.getParameter("dni"));
        p.setContrasena(request.getParameter("password"));
        p.setNombre(request.getParameter("nombre"));
        p.setApellido(request.getParameter("apellido"));
        p.setTelefono(request.getParameter("telefono"));
        p.setCorreo(request.getParameter("correo"));
        u.setDni(request.getParameter("dni"));
        u.setCodUsuario(request.getParameter("codUsuario"));
        u.setContrasena(request.getParameter("password"));
        u.setNombre(request.getParameter("nombre"));
        u.setApellido(request.getParameter("apellido"));
        u.setTelefono(request.getParameter("telefono"));
        u.setCorreo(request.getParameter("correo"));
        u.setCargo(request.getParameter("cargo"));
        obj.ModificarUsuarioPaciente(u);
        obj.ModificarPaciente(p);
        request.setAttribute("msmeModificarPac", "modificarPa");
        request.getRequestDispatcher("controlAdministrador?opc=5&cod="+codP).forward(request, response);
    }
    
    protected void ModificarHistorial(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codHistorial = request.getParameter("cod");
        request.setAttribute("dato", obj.BusHistorial(codHistorial));
        request.getRequestDispatcher("view/Admin/PagHistorialPendiente.jsp").forward(request, response);
    }
    
    protected void GuardarModfHistorial(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codH=request.getParameter("codHistorial");
        String codP=request.getParameter("codPaciente");
        h.setCodHistorial(request.getParameter("codHistorial"));
        h.setCodPaciente(request.getParameter("codPaciente"));
        h.setCodCita(request.getParameter("codCita"));
        h.setCodDoctor(request.getParameter("codDoctor"));
        h.setFecha(request.getParameter("fecha"));
        h.setEstado("Culminado");
        h.setMotivo(request.getParameter("motivo"));
        h.setDiagnostico(request.getParameter("diagnostico"));
        h.setTratamiento(request.getParameter("tratamiento"));
        h.setReceta(request.getParameter("receta"));
        obj.ModificarHistorial(h);
        request.setAttribute("resHistorial", "modificado");
        request.setAttribute("codPac", codP);
        request.getRequestDispatcher("controlAdministrador?opc=7&cod="+codH).forward(request, response);
    }
    
    protected void LisDis(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codD = request.getParameter("cod");
        String nmD = request.getParameter("nombre");
        request.setAttribute("dato", obj.lisDis(codD));
        request.setAttribute("nombre", nmD);
        request.setAttribute("codigo", codD);
        request.getRequestDispatcher("view/Admin/PagLisDis.jsp").forward(request, response);
    }
    
    protected void adiDis(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codD = request.getParameter("cod");
        request.setAttribute("codigo", codD);
        String nom = request.getParameter("nomD");
        request.setAttribute("nombre", nom);
        request.getRequestDispatcher("view/Admin/PagAdiDisp.jsp").forward(request, response);
    }
    
    protected void grabaDis(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("codD");
        request.setAttribute("codigo", id);
        String nom = request.getParameter("nomD");
        request.setAttribute("nombre", nom);
        request.setAttribute("dato", obj.lisDis(id));
        
        a.setFechaInicio(request.getParameter("feini"));
        a.setFechaFin(request.getParameter("fefin"));
        a.setTurno(request.getParameter("turno"));
        a.setEstado(0);
        obj.adiDisp(id, a);
        request.setAttribute("msmeAgregarHist", "agregarHistorial");//alerta
        request.getRequestDispatcher("view/Admin/PagAdiDisp.jsp?opc=9&cod="+id+"&nombre="+nom).forward(request, response);
    }
    
    protected void eliDisp(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cDis=request.getParameter("codDis");
        obj.anuladisp(cDis);
        String id=request.getParameter("cod");
        request.setAttribute("cod", id);
        String nom = request.getParameter("nomD");
        request.setAttribute("nombre", nom);
        request.getRequestDispatcher("controlAdministrador?opc=9&cod="+id+"&nombre="+nom).forward(request, response);
        
    }
    
    protected void AgregarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String fechaIngreso = request.getParameter("fechaIng");
        String sexo = request.getParameter("sexo");
        String cod_especialidad = request.getParameter("cbEsp");               
        //Agregar doctor
        d.setNomd(nombre);
        d.setAped(apellido);
        d.setFechai(fechaIngreso);
        d.setSexo(sexo);
        d.setCesp(cod_especialidad);
        obj.AdicionarDoctor(d);              
          
        request.setAttribute("msmeAgregarDoc", "agregarDoc");
        request.getRequestDispatcher("view/Admin/PagAgregarDoctor.jsp").forward(request, response);   
       
    }
    
     protected void ModificarDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codDoc = request.getParameter("cod");
        request.setAttribute("dato", obj.BusDoctor(codDoc));
        request.getRequestDispatcher("view/Admin/PagModificarDoctor.jsp").forward(request, response);
    }
      
     protected void GuardarModfDoctor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codD=request.getParameter("codDoc");
        d.setCodd(request.getParameter("codDoc"));
        d.setNomd(request.getParameter("nombre"));
        d.setFechai(request.getParameter("fechaIng"));
        d.setAped(request.getParameter("apellido"));
        d.setSexo(request.getParameter("sexo"));                      
        d.setCesp(request.getParameter("cbEsp"));                      
        d.setCcon(request.getParameter("codCon"));                      
        obj.ModificarDoctor(d);
        request.setAttribute("msmeModificarDoc", "modificarDoc");
        request.getRequestDispatcher("controlAdministrador?opc=14&cod="+codD).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
