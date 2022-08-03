package miServlet;

import dao.Negocio;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.*;
import java.util.*;
import javax.servlet.http.HttpSession;

public class control extends HttpServlet {
    Negocio obj=new Negocio();
    Encuesta ec;
    Cita ct;
    Historial h;
    Disponibilidad dp=new Disponibilidad();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int op=Integer.parseInt(request.getParameter("opc"));
        if(op==1)lisDocE(request, response);//Listado de doctor dependiendo de la esp
        if(op==2)LisDisponibilidad(request, response);
        if(op==3)LlenarFormulario(request, response);
        if(op==4)CrearCita(request, response);
        if(op==5)CrearCitaEncuesta(request, response);
    }
    
    protected void lisDocE(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String code = request.getParameter("cod");
        String nombre = request.getParameter("nomE");
        request.setAttribute("dato", obj.lisDocE(code));
        request.setAttribute("nomE", nombre);
        request.setAttribute("codEsp", code);
        request.getRequestDispatcher("view/Paciente/pagDoctorE.jsp").forward(request, response);
    }
    
    protected void LisDisponibilidad(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codE=request.getParameter("cod");
        String codD=request.getParameter("codDoctor");
        String nomDoctor=request.getParameter("nomDoctor");
        String nomEsp=request.getParameter("nomEsp");
        String sexo=request.getParameter("sexo");
        request.setAttribute("dato", obj.lisDisponibilidad(codD));
        request.setAttribute("codD", codD);
        request.setAttribute("nomD", nomDoctor);
        request.setAttribute("nomE", nomEsp);
        request.setAttribute("sexo", sexo);
        request.setAttribute("codE", codE);
        request.getRequestDispatcher("view/Paciente/PagDisponibilidad.jsp").forward(request, response);
    }
    
    protected void LlenarFormulario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nomE");
        String codD=request.getParameter("codD");
        String fi=request.getParameter("fechaI");
        String ff=request.getParameter("fechaF");
        String sx=request.getParameter("sexo");
        String codDisponibilidad=request.getParameter("coddisponibilidad");
        String Turno=request.getParameter("tur");
        HttpSession ses=request.getSession();
        ses.setAttribute("dato7",codDisponibilidad);
        ses.setAttribute("dato8",Turno);
        request.setAttribute("codD", codD);
        request.setAttribute("nomE", nombre);
        request.setAttribute("fechaI", fi);
        request.setAttribute("fechaF", ff);
        request.setAttribute("sexo", sx);
        request.getRequestDispatcher("view/Paciente/PagFormulario.jsp").forward(request, response);
    }
    
    protected void CrearCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cb=request.getParameter("cbC");
        String motivo = request.getParameter("motivo");
        HttpSession ses=request.getSession();
        ses.setAttribute("dato10",motivo);
        ses.setAttribute("dato3", cb);
        request.getRequestDispatcher("view/Paciente/PagEncuesta.jsp").forward(request, response);
    }
    
    protected void CrearCitaEncuesta(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Recuperar datos
        HttpSession ses=request.getSession();
        double precio=(double)ses.getAttribute("dato2");
        String tipoComp=(String)ses.getAttribute("dato3");
        String codDoctor=(String)ses.getAttribute("dato4");
        String fi=(String)ses.getAttribute("dato5");
        String ff=(String)ses.getAttribute("dato6");
        String codPaciente=(String)ses.getAttribute("codPaciente");
        String codDisp=(String)ses.getAttribute("dato7");
        String turno=(String)ses.getAttribute("dato8");
        String motivo=(String)ses.getAttribute("dato10");
        //var
        String res;
        String codCit;
        //Adicionar la encuesta
        String nSastifacion = request.getParameter("rb");
        String valor =request.getParameter("valor");
        String comentario = request.getParameter("comentario");
        ec=new Encuesta(null, nSastifacion, valor, comentario, fi);
        obj.AdicionarEncuesta(ec);
        //Buscar cod de detalle por disponibilidad
        res=obj.BusCodDetalle(codDisp);
        //Adicionar cita
        ct=new Cita(null, codPaciente, fi, ff, codDoctor, tipoComp, precio, res);
        obj.AdicionarCita(ct);
        //adicionar disponibilidad
        dp.setCodDisponibilidad(codDisp);
        dp.setFechaInicio(fi);
        dp.setFechaFin(ff);
        dp.setTurno(turno);
        //Cambiar el estado de la disponibilidad
        obj.CambiaDisponibilidad(dp);
        //BUSCAR COD CITA
        codCit=obj.BusCodCita(res);
        //CREAR HISTORIAL Y DEPACIENTE
        h=new Historial(null, codPaciente, codDoctor, fi, codCit, motivo, null, "Pendiente", null, null);
        obj.AdicionarHistorial(h);
        //MODIFICAR EL HISTORIAL DEL PACIENTE
        request.setAttribute("resp", "creado");// para alerta
        request.getRequestDispatcher("view/Paciente/PagEncuesta.jsp").forward(request, response);
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
