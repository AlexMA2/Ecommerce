/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaFrejoles;

public class Compra {
    private String nombre;
    private int id;
    private int cantidad;
    private String fecha;
    private Double monto;
    private String estado;

    public Compra() {
    }

    public Compra(String nombre, int id, int cantidad, String fecha, Double monto, String estado) {
        this.nombre = nombre;
        this.id = id;
        this.cantidad = cantidad;
        this.fecha = fecha;
        this.monto = monto;
        this.estado = estado;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

   
   
}