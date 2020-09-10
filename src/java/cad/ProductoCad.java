/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

/**
 *
 * @author MARTIN
 */
import javaFrejoles.Producto;
import javaFrejoles.ProductoMoneda;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductoCad {

    private static int primero = 0;
    private static int ultimo = 0;

    public static String registrarProducto(Producto p, ProductoMoneda usd) {
        try {
            String sql = "{call sp_registrarproducto(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                sentencia.setString(1, p.getNombre());
                sentencia.setFloat(2, p.getPrecio());
                sentencia.setFloat(3, p.getPrecionuevo());
                sentencia.setInt(4, p.getStock());
                sentencia.setBoolean(5, p.isNuevo());
                sentencia.setBoolean(6, p.isRecomendado());
                sentencia.setString(7, p.getDescripcion());
                sentencia.setBoolean(8, p.isVisible());
                sentencia.setInt(9, p.getCodigo_marca());
                sentencia.setInt(10, p.getCodigo_categoria());
                sentencia.setString(11, p.getImg());
                sentencia.setString(12, usd.getMoneda());
                sentencia.setFloat(13, usd.getPrecio());
                sentencia.setFloat(14, usd.getPrecionuevo());

                if (sentencia.executeUpdate() > 0) {
                    return "SI";
                } else {
                    return "NO";
                }
            }
        } catch (SQLException ex) {
            return "SQLERROR";
        }
    }

    public static ArrayList<Producto> listarProductosRecomendados(String moneda) {
        try {
            String sql = "{call sp_listarRecomendados(?)}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                sentencia.setString(1, moneda);

                ResultSet res = sentencia.executeQuery();
                ArrayList<Producto> lista = new ArrayList<>();
                while (res.next()) {
                    Producto p = new Producto();
                    p.setWebid(res.getInt("webid"));
                    p.setNombre(res.getString("nombre"));
                    p.setStock(res.getInt("stock"));
                    p.setImg(res.getString("img"));
                    if (!moneda.equalsIgnoreCase("PEN")) {
                        p.setPrecio(res.getFloat("precio2"));
                        p.setPrecionuevo(res.getFloat("precion2"));
                    } else {
                        p.setPrecio(res.getFloat("precio"));
                        p.setPrecionuevo(res.getFloat("precionuevo"));
                    }
                    lista.add(p);
                }
                return lista;
            }

        } catch (SQLException ex) {
            return null;
        }
    }

    public static ArrayList<Producto> listarProductosPorCategoria(String moneda, int cat) {
        try {
            String sql = "{call sp_listarPorCategoria(?,?)}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                sentencia.setString(1, moneda);
                sentencia.setInt(2, cat);

                ResultSet res = sentencia.executeQuery();
                ArrayList<Producto> lista = new ArrayList<>();
                while (res.next()) {
                    Producto p = new Producto();
                    p.setWebid(res.getInt("webid"));
                    p.setNombre(res.getString("nombre"));
                    p.setImg(res.getString("img"));
                    p.setStock(res.getInt("stock"));
                    p.setNuevo(res.getBoolean("nuevo"));
                    if (!moneda.equalsIgnoreCase("PEN")) {
                        p.setPrecio(res.getFloat("precio2"));
                        p.setPrecionuevo(res.getFloat("precion2"));
                    } else {
                        p.setPrecio(res.getFloat("precio"));
                        p.setPrecionuevo(res.getFloat("precionuevo"));
                    }
                    lista.add(p);
                }
                return lista;
            }

        } catch (SQLException ex) {
            return null;
        }
    }

    public static ArrayList<Producto> listarProductosPorMarca(String moneda, int m) {
        try {
            String sql = "{call sp_listarPorMarca(?,?)}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                sentencia.setString(1, moneda);
                sentencia.setInt(2, m);

                ResultSet res = sentencia.executeQuery();
                ArrayList<Producto> lista = new ArrayList<>();
                while (res.next()) {
                    Producto p = new Producto();
                    p.setWebid(res.getInt("webid"));
                    p.setNombre(res.getString("nombre"));
                    p.setImg(res.getString("img"));
                    p.setStock(res.getInt("stock"));
                    p.setNuevo(res.getBoolean("nuevo"));
                    if (!moneda.equalsIgnoreCase("PEN")) {
                        p.setPrecio(res.getFloat("precio2"));
                        p.setPrecionuevo(res.getFloat("precion2"));
                    } else {
                        p.setPrecio(res.getFloat("precio"));
                        p.setPrecionuevo(res.getFloat("precionuevo"));
                    }
                    lista.add(p);
                }
                return lista;
            }

        } catch (SQLException ex) {
            return null;
        }
    }

    public static Producto consultarProducto(String moneda, int webid) {
        try {
            String sql = "{call sp_consultarProducto(?,?)}";
            Connection c = Conexion.conectar();
            try (CallableStatement sentencia = (CallableStatement) c.prepareCall(sql)) {
                sentencia.setString(1, moneda);
                sentencia.setInt(2, webid);

                ResultSet res = sentencia.executeQuery();
                Producto p = null;
                if (res.next()) {
                    p = new Producto();
                    p.setWebid(res.getInt("webid"));
                    p.setNombre(res.getString("nombre"));
                    p.setImg(res.getString("img"));
                    p.setStock(res.getInt("stock"));
                    p.setNuevo(res.getBoolean("nuevo"));
                    if (!moneda.equalsIgnoreCase("PEN")) {
                        p.setPrecio(res.getFloat("precio2"));
                        p.setPrecionuevo(res.getFloat("precion2"));
                    } else {
                        p.setPrecio(res.getFloat("precio"));
                        p.setPrecionuevo(res.getFloat("precionuevo"));
                    }
                }
                return p;
            }

        } catch (SQLException ex) {
            return null;
        }
    }

    public static Producto obtenerProducto(int webid) {
        String sql = "SELECT * FROM tbl_producto WHERE `webid` = ?";
        try {
            Connection conexion = Conexion.conectar();
            try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                declaracion.setInt(1, webid);
                ResultSet res = declaracion.executeQuery();
                Producto p = new Producto();
                if (res.next()) {

                    p.setWebid(res.getInt(1));
                    p.setNombre(res.getString(2));
                    p.setPrecio(res.getFloat(3));
                    p.setPrecionuevo(res.getFloat(4));
                    p.setStock(res.getInt(5));
                    p.setNuevo(res.getBoolean(6));
                    p.setRecomendado(res.getBoolean(7));
                    p.setDescripcion(res.getString(8));
                    p.setVisible(res.getBoolean(9));
                    p.setCodigo_marca(res.getInt(10));
                    p.setCodigo_categoria(res.getInt(11));
                    p.setImg(res.getString(12));
                    conexion.close();
                    return p;
                }

                return null;
            }

        } catch (SQLException ex) {

        }
        return null;
    }

    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }

    public static boolean esPrimero(int webid) {

        if (primero != 0) {
            return webid == primero;
        }
        try {
            String sql = "SELECT `webid` FROM `tbl_producto` ORDER BY `webid` ASC LIMIT 1";
            Connection conexion = Conexion.conectar();
            try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                ResultSet res = declaracion.executeQuery();
                if (res.next()) {
                    if (res.getInt(1) == webid) {
                        primero = webid;
                        return true;
                    } else {
                        return false;
                    }
                }
            }

        } catch (SQLException ex) {
        }
        return false;
    }

    public static boolean esUltimo(int webid) {

        if (ultimo != 0) {
            return webid == ultimo;
        }
        try {
            String sql = "SELECT `webid` FROM `tbl_producto` ORDER BY `webid` DESC LIMIT 1";
            Connection conexion = Conexion.conectar();
            try (PreparedStatement declaracion = conexion.prepareStatement(sql)) {
                ResultSet res = declaracion.executeQuery();
                if (res.next()) {
                    if (res.getInt(1) == webid) {
                        ultimo = webid;
                        return true;
                    } else {
                        return false;
                    }
                }
            }

        } catch (SQLException ex) {

        }
        return false;
    }
}
