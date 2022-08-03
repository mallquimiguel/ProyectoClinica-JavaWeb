package miServlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.DaoPacienteNavbar;
import modelo.Disponibilidad;
public class controlPacienteNavbar extends HttpServlet {
    DaoPacienteNavbar obj=new DaoPacienteNavbar();
    Disponibilidad dp=new Disponibilidad();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        int op=Integer.parseInt(request.getParameter("opc"));
        if (op == 1) lisCitaReservada(request, response);
        if (op == 2) EliminarCita(request, response);
        if (op == 3) lisResultaodMedicos(request, response);
    }
    
    protected void lisCitaReservada(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        String codPaciente=(String)ses.getAttribute("codPaciente");
        request.setAttribute("dato", obj.lisCitaReservadas(codPaciente));
        request.getRequestDispatcher("view/Paciente/PagHistorialReserva.jsp").forward(request, response);
    }
    
    protected void lisResultaodMedicos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession ses=request.getSession();
        String codPaciente=(String)ses.getAttribute("codPaciente");
        request.setAttribute("dato", obj.lisResultadosMedi(codPaciente));
        request.getRequestDispatcher("view/Paciente/PagResultadosMedicos.jsp").forward(request, response);
    }
    
    protected void EliminarCita(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cdisp;
        String res;
        String codCita = request.getParameter("codCit");
        String codDet = request.getParameter("codDeta");
        String fi = request.getParameter("fi");
        String ff = request.getParameter("ff");
        //buscar el código de disponibilidad
        cdisp=obj.BusCodDispModific(codCita, codDet);
        res=obj.BusCodTurnModific(codDet);
        //Agregar disponibilidad
        dp.setCodDisponibilidad(cdisp);
        dp.setFechaInicio(fi);
        dp.setFechaFin(ff);
        dp.setTurno(res);
        //Modificar y eliminar
        obj.CambiaDispAnular(dp);
        obj.EliminarCita(codCita);
        //Eliminar historial
        obj.EliminarHistorial(codCita);
//        request.getRequestDispatcher("view/Paciente/PagHistorialReserva.jsp").forward(request, response);
        response.sendRedirect("controlPacienteNavbar?opc=1");
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
