/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import javaFrejoles.Marca;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author User
 */
public class MarcaCad {

    public static ArrayList<Marca> listarTodoDeMarcas() {// falta importar java bin marca video 36
        try {
            String sql = "{call sp_listartododeMarca()}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                ResultSet resultado = sentencia.executeQuery();
                ArrayList<Marca> lista = new ArrayList<>();
                while (resultado.next()) {
                    Marca m = new Marca();
                    m.setCodigo(resultado.getInt("codigo"));
                    m.setNombre(resultado.getString("nombre"));
                    lista.add(m);
                }
                return lista;
            }

        } catch (SQLException ex) {
            return null;
        }
    }

    public static int contarMarcas(int co) {
        try {
            String sql = "{call sp_contarProductosMarca(?)}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                sentencia.setInt(1, co);
                ResultSet resultado = sentencia.executeQuery();
                if (resultado.next()) {
                    return resultado.getInt(1);
                }
            }

        } catch (SQLException ex) {

        }
        return 0;

    }

    public static Marca obtenerMarca(int id) {
        try {
            String sql = "SELECT * FROM `tbl_marca` WHERE `codigo` = ?";
            Connection conexion = Conexion.conectar();
            try (PreparedStatement consulta = conexion.prepareStatement(sql)) {
                consulta.setInt(1, id);
                ResultSet resultado = consulta.executeQuery();
                if (resultado.next()) {
                    Marca brand = new Marca(resultado.getInt(1), resultado.getString(2), resultado.getBoolean(3));
                    return brand;
                }
            }

        } catch (SQLException ex) {}
        return null;
    }

}
