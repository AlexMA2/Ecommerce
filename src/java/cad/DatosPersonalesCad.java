package cad;

import javaFrejoles.DatosPersonales;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatosPersonalesCad {

    public static void save(String Usuario, String nombres, String apellidos, String DNI, String telefono) {

        if (!estaRegistrado(UsuarioCad.convertirAUsuario(Usuario).getId())) {
            try {
                try (Connection conexion = Conexion.conectar()) {
                    String sql = "INSERT INTO `tbl_datos_personales`(`UsuarioID`, `Nombres`, `Apellidos`, `DNI`, `Telefono`) VALUES (?,?,?,?,?)";
                    try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                        int idUsuario = UsuarioCad.convertirAUsuario(Usuario).getId();
                        declaracion.setInt(1, idUsuario);
                        declaracion.setString(2, nombres);
                        declaracion.setString(3, apellidos);
                        declaracion.setString(4, DNI);
                        declaracion.setInt(5, Integer.parseInt(telefono));

                        declaracion.executeUpdate();
                    };

                }
            } catch (SQLException ex) {
            }
        } else {
            try {
                try (Connection conexion = Conexion.conectar()) {
                    String sql = "UPDATE `tbl_datos_personales` SET `Nombres`= ?,`Apellidos`= ?,`DNI`= ?,`Telefono`=? WHERE `UsuarioID` = ?";
                    try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                        int idUsuario = UsuarioCad.convertirAUsuario(Usuario).getId();
                        declaracion.setString(1, nombres);
                        declaracion.setString(2, apellidos);
                        declaracion.setString(3, DNI);
                        declaracion.setInt(4, Integer.parseInt(telefono));
                        declaracion.setInt(5, idUsuario);
                        declaracion.executeUpdate();
                    }

                }
            } catch (SQLException ex) {
            }
        }

    }

    public static DatosPersonales obtener(int idUsuario) {
        DatosPersonales datos = null;
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT * FROM `tbl_datos_personales` WHERE `UsuarioID` = ?";
                try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                    declaracion.setInt(1, idUsuario);
                    ResultSet resultado = declaracion.executeQuery();
                    if (resultado.next()) {
                        int id = resultado.getInt(1);
                        int idu = resultado.getInt(2);
                        String nombres = resultado.getString(3);
                        String apellidos = resultado.getString(4);
                        String DNI = resultado.getString(5);
                        int telefono = resultado.getInt(6);
                        datos = new DatosPersonales(id, idu, nombres, apellidos, DNI, telefono);
                        return datos;
                    }
                }
            }

        } catch (SQLException ex) {
        }
        return datos;
    }

    public static boolean estaRegistrado(int idUsuario) {
        try {
            try (Connection conexion = Conexion.conectar()) {
                String sql = "SELECT * FROM `tbl_datos_personales` WHERE `UsuarioID` = ?";
                try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                    declaracion.setInt(1, idUsuario);
                    ResultSet resultado = declaracion.executeQuery();
                    return resultado.next();
                }

            }

        } catch (SQLException ex) {}
        return false;
    }

}
