/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view;

import javaFrejoles.Producto;
import cad.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Pago {

    public static boolean eliminarProducto(Producto producto, int cantidad) {

        String sql = "UPDATE `tbl_producto` SET `stock`= ? WHERE `webid` = ?";
        Connection conexion = Conexion.conectar();
        
        if (producto.getStock() - cantidad >= 0) {
            try {
                try (PreparedStatement consulta = conexion.prepareStatement(sql)) {
                    consulta.setInt(1, producto.getStock() - cantidad);
                    consulta.setInt(2, producto.getWebid());
                    consulta.executeUpdate();
                }
                conexion.close();
                return true;
            } catch (SQLException ex) {}
        }

        return false;
    }
}
