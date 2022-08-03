package modelo;

public class Disponibilidad {
    private String codDisponibilidad;
    private String fechaInicio;
    private String fechaFin;
    private String turno;
    private int estado;

    public Disponibilidad() {
    }

    public Disponibilidad(String codDisponibilidad, String fechaInicio, String fechaFin, String turno, int estado) {
        this.codDisponibilidad = codDisponibilidad;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.turno = turno;
        this.estado = estado;
    }

    public String getCodDisponibilidad() {
        return codDisponibilidad;
    }

    public void setCodDisponibilidad(String codDisponibilidad) {
        this.codDisponibilidad = codDisponibilidad;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getTurno() {
        return turno;
    }

    public void setTurno(String turno) {
        this.turno = turno;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}
