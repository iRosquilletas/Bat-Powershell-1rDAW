package com.ermuza;
public class DetalleComanda {
    private int idDetalleComanda;
    private int idComanda;
    private int idPlato;
    private int cantidad;

    public DetalleComanda(int idDetalleComanda, int idComanda, int idPlato, int cantidad) {
        this.idDetalleComanda = idDetalleComanda;
        this.idComanda = idComanda;
        this.idPlato = idPlato;
        this.cantidad = cantidad;
    }

    public int getIdDetalleComanda() {
        return idDetalleComanda;
    }

    public void setIdDetalleComanda(int idDetalleComanda) {
        this.idDetalleComanda = idDetalleComanda;
    }

    public int getIdComanda() {
        return idComanda;
    }

    public void setIdComanda(int idComanda) {
        this.idComanda = idComanda;
    }

    public int getIdPlato() {
        return idPlato;
    }

    public void setIdPlato(int idPlato) {
        this.idPlato = idPlato;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
}