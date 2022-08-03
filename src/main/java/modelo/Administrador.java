package modelo;

public class Administrador {
    private String codAdministrador;
    private String nombre;
    private String apellido;
    private String telefono;
    private String dni;
    private String correo;
    private String contrasena;

    public Administrador() {
    }

    public Administrador(String codAdministrador, String nombre, String apellido, String telefono, String dni, String correo, String contrasena) {
        this.codAdministrador = codAdministrador;
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
        this.dni = dni;
        this.correo = correo;
        this.contrasena = contrasena;
    }

    public String getCodAdministrador() {
        return codAdministrador;
    }

    public void setCodAdministrador(String codAdministrador) {
        this.codAdministrador = codAdministrador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }
    
    
}
