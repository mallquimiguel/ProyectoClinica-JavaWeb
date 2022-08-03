package miServlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;
import dao.DaoUsuario;
import javax.servlet.http.HttpSession;

public class controlUsuario extends HttpServlet {
    DaoUsuario obj=new DaoUsuario();
    Usuario user;
    Paciente pac;
    Administrador adm;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1)ValidarUser(request, response);
        if(op==2)CrearUser(request, response);
    }
    
    protected void ValidarUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("Envia") != null) {
        HttpSession ses=request.getSession();
        //variables
        String nomPac="", nomAdm="", codP = null;
        int respuesta=0;
        //datos recuperados
        String dni = request.getParameter("dni");
        String contrasena = request.getParameter("password");
        String cargo = request.getParameter("cb");
        user=new Usuario(dni, null, null, null, null, cargo, null, contrasena);//almacenar
        respuesta=obj.ValidarUsuario(user);//verifica
        if(respuesta!=0 && "Paciente".equals(user.getCargo())){
            for(Paciente x:obj.lisPac()){
                if(x.getDni().equals(dni)){
                    nomPac=x.getApellido()+", "+x.getNombre();
                    codP=x.getCodPaciente();
                }
            }
            ses.setAttribute("codPaciente", codP);//Obtener el código de paciente
            ses.setAttribute("nombrePaciente", nomPac);//para saber el nombre
            request.setAttribute("Paciente", "Paciente");//para las alertas
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else if(respuesta!=0 && "Administrador".equals(user.getCargo())){
            for(Administrador x:obj.lisAdm()){
                if(x.getDni().equals(dni))nomAdm=x.getApellido()+", "+x.getNombre();
            }
            ses.setAttribute("nombreAdministrador", nomAdm);//para saber el nombre
            request.setAttribute("Administrador", "Administrador");//para las alertas
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
            request.setAttribute("error", "error");//para la alerta
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        }
    }
    
    protected void CrearUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //variable
        int respuesta;
        //recuperar datos
        String nombre = request.getParameter("nom");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telf");
        String dni = request.getParameter("dni");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("pass");
        String cargo = request.getParameter("cb");
        user=new Usuario(dni, null, nombre, apellido, telefono, cargo, correo, contrasena);//almacenar
        respuesta=obj.ValidarDni(dni);//verifica dni
        if(respuesta==0 && "Paciente".equals(user.getCargo())){
            obj.AdicionarUsuario(user);//Agregar ususario
            pac=new Paciente(null, nombre, apellido, telefono, dni, correo, contrasena);//almacenar pac
            obj.AdicionarPaciente(pac);//agregar pac
            request.setAttribute("registroPac", "Paciente");//para la alerta
            request.getRequestDispatcher("Registro.jsp").forward(request, response);
        }else if (respuesta == 0 && "Administrador".equals(user.getCargo())) {
            obj.AdicionarUsuario(user);//Agregar ususario
            adm=new Administrador(null, nombre, apellido, telefono, dni, correo, contrasena);//almacenar adm
            obj.AdicionarAdministrador(adm);//Agregar adm
            request.setAttribute("registroAdmi", "Administrador");//para la alerta
            request.getRequestDispatcher("Registro.jsp").forward(request, response);
        }else{
            request.setAttribute("rep", "rep");//para la alerta
            request.getRequestDispatcher("Registro.jsp").forward(request, response);
        }
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
