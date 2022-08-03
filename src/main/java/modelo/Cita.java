package modelo;

public class Cita {
    private String codCita;
    private String codPaciente;
    private String fechaIni;
    private String fechaFin;
    private String CodDoctor;
    private String tipo;
    private double totalPagar;
    private String codDetalle;

    public Cita() {
    }
    
    public Cita(String codCita, String codPaciente, String fechaIni, String fechaFin, String CodDoctor, String tipo, double totalPagar, String codDetalle) {
        this.codCita = codCita;
        this.codPaciente = codPaciente;
        this.fechaIni = fechaIni;
        this.fechaFin = fechaFin;
        this.CodDoctor = CodDoctor;
        this.tipo = tipo;
        this.totalPagar = totalPagar;
        this.codDetalle = codDetalle;
    }

    public String getCodCita() {
        return codCita;
    }

    public void setCodCita(String codCita) {
        this.codCita = codCita;
    }

    public String getCodPaciente() {
        return codPaciente;
    }

    public void setCodPaciente(String codPaciente) {
        this.codPaciente = codPaciente;
    }

    public String getFechaIni() {
        return fechaIni;
    }

    public void setFechaIni(String fechaIni) {
        this.fechaIni = fechaIni;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getCodDoctor() {
        return CodDoctor;
    }

    public void setCodDoctor(String CodDoctor) {
        this.CodDoctor = CodDoctor;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public double getTotalPagar() {
        return totalPagar;
    }

    public void setTotalPagar(double totalPagar) {
        this.totalPagar = totalPagar;
    }

    public String getCodDetalle() {
        return codDetalle;
    }

    public void setCodDetalle(String codDetalle) {
        this.codDetalle = codDetalle;
    }
    
    
}
