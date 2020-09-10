/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import javaFrejoles.Usuario;
import java.sql.*;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.codec.digest.DigestUtils;

public class UsuarioCad {

    public static String nombreUsuario = "";

    public static boolean logear(String nombre, String contra) {
        if (usuarioExiste(nombre, contra)) {
            nombreUsuario = nombre;
            try {
                try (Connection conexion = Conexion.conectar()) {
                    String sql = "UPDATE `tbl_usuarios` SET `Logeado`=1 WHERE Usuario = ?";

                    try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                        consultaPreparada.setString(1, nombre);
                        int resultado = consultaPreparada.executeUpdate();
                        return (resultado == 1);
                    }

                }

            } catch (SQLException ex) {

                return false;
            }
        }
        return false;
    }

    public static boolean cerrarSesion(String nombre) {
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "UPDATE `tbl_usuarios` SET `Logeado`=0 WHERE Usuario = ?";
                try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                    consultaPreparada.setString(1, nombre);
                    int resultado = consultaPreparada.executeUpdate();
                    return resultado == 1;
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioCad.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }

    public static boolean estaLogeado() {
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT Logeado FROM tbl_usuarios WHERE Usuario = ?";
                try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                    consultaPreparada.setString(1, nombreUsuario);
                    ResultSet resultado = consultaPreparada.executeQuery();
                    if (resultado.next()) {
                        int valor = resultado.getInt(1);

                        return valor == 1;

                    }
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;

    }

    public static Usuario obtenerUsuario(String nombre) {

        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT Email, Usuario, Contrasenia, Nivel FROM tbl_usuarios WHERE Usuario = ?";
                try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                    declaracion.setString(1, nombre);
                    ResultSet resultado = declaracion.executeQuery();
                    if (resultado.next()) {
                        Usuario usuario = new Usuario(resultado.getString(1), resultado.getString(2), resultado.getString(3), resultado.getInt(4));
                        return usuario;
                    }
                }

            }

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static String guardarCambios(Usuario user) {
        String ud = user.getUsuario();
        String dir = user.getDireccion();
        int sexo = user.getSexo();
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "UPDATE `tbl_usuarios` SET `direccion`=?,`sexo`=? WHERE Usuario =?";
                try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                    consultaPreparada.setString(1, dir);
                    consultaPreparada.setInt(2, sexo);
                    consultaPreparada.setString(3, ud);
                    consultaPreparada.executeUpdate();
                }

            }
        } catch (SQLException e) {
            return "sql";
        }
        return " ";
    }

    public static Usuario obtenerUsuarioV2(String nombre) {
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT Email, Usuario, Contrasenia, Nivel, direccion, sexo FROM tbl_usuarios WHERE Usuario = ?";
                try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                    declaracion.setString(1, nombre);
                    ResultSet resultado = declaracion.executeQuery(sql);
                    if (resultado.next()) {
                        Usuario usuario = new Usuario(resultado.getString(1), resultado.getString(2), resultado.getString(3), resultado.getInt(4), resultado.getString(5), resultado.getInt(6));
                        return usuario;
                    }
                }

            }

        } catch (SQLException ex) {
        }
        return null;
    }

    public static Usuario convertirAUsuario(String nombre) {
        Usuario usuario = null;
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT * FROM `tbl_usuarios` WHERE `Usuario` = ?";
                try (PreparedStatement consulta = conexion.prepareStatement(sql)) {
                    consulta.setString(1, nombre);
                    ResultSet resultado = consulta.executeQuery();
                    if (resultado.next()) {
                        int id = resultado.getInt(1);
                        String email = resultado.getString(2);
                        String persona = resultado.getString(3);
                        String contra = resultado.getString(4);
                        int nivel = resultado.getInt(5);

                        usuario = new Usuario(email, persona, contra, nivel);
                        usuario.setId(id);
                        usuario.setDireccion(resultado.getString(7));
                        usuario.setSexo(resultado.getInt(8));
                        conexion.close();
                        return usuario;
                    }
                }

            }

        } catch (SQLException ex) {
        }
        return usuario;
    }

    public static boolean registrar(Usuario user) {
        if (!usuarioExiste(user.getUsuario(), user.getContrasenia()) && (!esRepetido(user.getEmail(), user.getUsuario()))) {
            try {
                try (Connection conexion = Conexion.conectar()) {
                    String sql = "INSERT INTO `tbl_usuarios`(`Email`, `Usuario`, `Contrasenia`, `Nivel`, `Logeado`,`direccion`,`sexo`) VALUES (?,?,?,?,?,?,?)";
                    String encriptMD5 = DigestUtils.md5Hex(user.getContrasenia());
                    try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                        consultaPreparada.setString(1, user.getEmail());
                        consultaPreparada.setString(2, user.getUsuario());
                        consultaPreparada.setString(3, encriptMD5);
                        consultaPreparada.setInt(4, user.getNivel());
                        consultaPreparada.setInt(5, 1);
                        consultaPreparada.setString(6, user.getDireccion());
                        consultaPreparada.setInt(7, user.getSexo());
                        consultaPreparada.executeUpdate();
                        nombreUsuario = user.getUsuario();
                        return true;
                    }

                }
            } catch (SQLException ex) {
            }
        }
        return false;
    }

    public static boolean usuarioExiste(String nombre, String contra) {
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT Usuario FROM tbl_usuarios WHERE Usuario = ? AND Contrasenia = ?";
                try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                    consultaPreparada.setString(1, nombre);
                    consultaPreparada.setString(2, DigestUtils.md5Hex(contra));
                    ResultSet resultado = consultaPreparada.executeQuery();
                    return resultado.next();
                }
            }

        } catch (SQLException ex) {
        }
        return false;
    }

    public static boolean esRepetido(String email, String nombre) {

        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT Email FROM tbl_usuarios WHERE Email = ? OR Usuario = ?";
                try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                    consultaPreparada.setString(1, email);
                    consultaPreparada.setString(2, nombre);
                    ResultSet resultado = consultaPreparada.executeQuery();
                    return resultado.next();
                }
            }
        } catch (SQLException ex) {
        }
        return false;
    }

    public static String getNombreUsuario() {
        return nombreUsuario;
    }

    public static String getEmailUsuario() {

        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT Email FROM tbl_usuarios WHERE Usuario = ?";
                try (PreparedStatement consultaPreparada = conexion.prepareStatement(sql)) {
                    consultaPreparada.setString(1, nombreUsuario);
                    ResultSet resultado = consultaPreparada.executeQuery();

                    if (resultado.next()) {
                        return resultado.getString(1);
                    } else {
                        return "NotFound" + nombreUsuario;
                    }
                }

            }
        } catch (SQLException ex) {
            return "CatchErrorSQL";
        }

    }

    public static void cambiarContrasenia(String contraNueva, String contraAntigua) {
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "UPDATE `tbl_usuarios` SET `Contrasenia` = ? WHERE `Contrasenia` = ?";
                try (PreparedStatement consulta = conexion.prepareStatement(sql)) {
                    String encriptMD5 = DigestUtils.md5Hex(contraNueva);
                    consulta.setString(1, encriptMD5);
                    consulta.setString(2, contraAntigua);
                    consulta.executeUpdate();                    
                }

            }

        } catch (SQLException ex) {
        }
    }

}
