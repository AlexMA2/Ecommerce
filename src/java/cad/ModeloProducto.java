/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import java.sql.CallableStatement;
import java.sql.Connection;
import javaFrejoles.Producto;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Personal
 */
public class ModeloProducto extends Conexion {

    public ArrayList<Producto> geAllProductos() {
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "call sp_selectProductos()";
            Connection conexion = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) conexion.prepareCall(sql)) {
                rs = sentencia.executeQuery();
                while (rs.next()) {
                    productos.add(new Producto(rs.getInt("webid"),
                            rs.getString("nombre"),
                            rs.getFloat("precio"),
                            rs.getFloat("precionuevo"),
                            rs.getInt("stock"),
                            rs.getInt("codigo_marca"),
                            rs.getInt("codigo_categoria"),
                            rs.getString("img")
                    ));
                }
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (conectar() != null) {
                    conectar().close();
                }
            } catch (SQLException e) {

            }
        }
        return productos;
    }

    public Producto getProducto(int id) {
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "call sp_selectProducto(?)";
            try (CallableStatement pstt = (CallableStatement) Conexion.conectar().prepareCall(sql)) {
                pstt.setInt(1, id);
                rs = pstt.executeQuery();

                while (rs.next()) {
                    producto = new Producto(rs.getInt("webid"), rs.getString("nombre"), rs.getFloat("precio"), rs.getFloat("precionuevo"), rs.getInt("stock"), rs.getInt("codigo_marca"), rs.getInt("codigo_categoria"), rs.getString("img"));
                }
            }

        } catch (SQLException e) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (conectar() != null) {
                    conectar().close();
                }
            } catch (SQLException e) {

            }
        }
        return producto;
    }

}
