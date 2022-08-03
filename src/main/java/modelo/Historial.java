package modelo;

public class Historial {
    private String codHistorial;
    private String codPaciente;
    private String codDoctor;
    private String fecha;
    private String codCita;
    private String motivo;
    private String diagnostico;
    private String estado;
    private String receta;
    private String tratamiento;
    private String nombrePaciente;
    private String nombreDcotor;
    private String apeDcotor;
    private String nomEsp;
    private String nomPac;
    private String apePac;
    public Historial() {
    }

    public Historial(String codHistorial, String codPaciente, String codDoctor, String fecha, String codCita, String motivo, String diagnostico, String estado, String receta, String tratamiento) {
        this.codHistorial = codHistorial;
        this.codPaciente = codPaciente;
        this.codDoctor = codDoctor;
        this.fecha = fecha;
        this.codCita = codCita;
        this.motivo = motivo;
        this.diagnostico = diagnostico;
        this.estado = estado;
        this.receta = receta;
        this.tratamiento = tratamiento;
    }

    public String getCodHistorial() {
        return codHistorial;
    }

    public void setCodHistorial(String codHistorial) {
        this.codHistorial = codHistorial;
    }

    public String getCodPaciente() {
        return codPaciente;
    }

    public void setCodPaciente(String codPaciente) {
        this.codPaciente = codPaciente;
    }

    public String getCodDoctor() {
        return codDoctor;
    }

    public void setCodDoctor(String codDoctor) {
        this.codDoctor = codDoctor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCodCita() {
        return codCita;
    }

    public void setCodCita(String codCita) {
        this.codCita = codCita;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getDiagnostico() {
        return diagnostico;
    }

    public void setDiagnostico(String diagnostico) {
        this.diagnostico = diagnostico;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getReceta() {
        return receta;
    }

    public void setReceta(String receta) {
        this.receta = receta;
    }

    public String getTratamiento() {
        return tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.tratamiento = tratamiento;
    }

    public String getNombrePaciente() {
        return nombrePaciente;
    }

    public void setNombrePaciente(String nombrePaciente) {
        this.nombrePaciente = nombrePaciente;
    }

    public String getNombreDcotor() {
        return nombreDcotor;
    }

    public void setNombreDcotor(String nombreDcotor) {
        this.nombreDcotor = nombreDcotor;
    }

    public String getApeDcotor() {
        return apeDcotor;
    }

    public void setApeDcotor(String apeDcotor) {
        this.apeDcotor = apeDcotor;
    }

    public String getNomEsp() {
        return nomEsp;
    }

    public void setNomEsp(String nomEsp) {
        this.nomEsp = nomEsp;
    }

    public String getNomPac() {
        return nomPac;
    }

    public void setNomPac(String nomPac) {
        this.nomPac = nomPac;
    }

    public String getApePac() {
        return apePac;
    }

    public void setApePac(String apePac) {
        this.apePac = apePac;
    }
    
    
}
