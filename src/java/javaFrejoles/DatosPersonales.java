
package javaFrejoles;

public class DatosPersonales {
    private int id;
    private int idUser;
    private String nombres;
    private String apellidos;
    private String DNI;
    private int telefono;

    public DatosPersonales(int id, int idUser,String nombres, String apellidos, String DNI, int telefono) {
        this.id = id;
        this.idUser = idUser;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.DNI = DNI;
        this.telefono = telefono;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }
    
    
    
}
