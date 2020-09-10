
package javaFrejoles;

public class Usuario {
    private int id;
    private String email;
    private String usuario;
    private String contrasenia;
    private int nivel;
    private String direccion;
    private int sexo;
    
    
    public Usuario(String email, String usuario, String contrasenia, int nivel) {        
        this.email = email;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
        this.nivel = nivel;
        this.direccion = "Direccion";
        this.sexo = 4;
    }       

    public Usuario(String email, String usuario, String contrasenia, int nivel, String direccion, int sexo) {        
        this.email = email;
        this.usuario = usuario;
        this.contrasenia = contrasenia;
        this.nivel = nivel;
        this.direccion = direccion;
        this.sexo = sexo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }       
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    
    
}
