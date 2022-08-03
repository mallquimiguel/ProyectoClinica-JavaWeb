package modelo;

public class Encuesta {
    private String codEncuesta;
    private String nivelSastifacion;
    private String valor;
    private String Comentario;
    private String fecha;

    public Encuesta() {
    }

    public Encuesta(String codEncuesta, String nivelSastifacion, String valor, String Comentario, String fecha) {
        this.codEncuesta = codEncuesta;
        this.nivelSastifacion = nivelSastifacion;
        this.valor = valor;
        this.Comentario = Comentario;
        this.fecha = fecha;
    }
    
    public String getCodEncuesta() {
        return codEncuesta;
    }

    public void setCodEncuesta(String codEncuesta) {
        this.codEncuesta = codEncuesta;
    }

    public String getNivelSastifacion() {
        return nivelSastifacion;
    }

    public void setNivelSastifacion(String nivelSastifacion) {
        this.nivelSastifacion = nivelSastifacion;
    }

    public String getValor() {
        return valor;
    }

    public void setValor(String valor) {
        this.valor = valor;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String Comentario) {
        this.Comentario = Comentario;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

   
    
}
