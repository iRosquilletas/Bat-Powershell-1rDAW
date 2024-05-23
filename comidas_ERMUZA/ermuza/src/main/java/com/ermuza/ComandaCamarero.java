package com.ermuza;

public class ComandaCamarero {
    private int idComanda;
    private int idMesa;
    private String estado;

    public ComandaCamarero(int idComanda, int idMesa, String estado) {
        this.idComanda = idComanda;
        this.idMesa = idMesa;
        this.estado = estado;
    }

    public void setIdComanda(int idComanda) {
        this.idComanda = idComanda;
    }

    public void setIdMesa(int idMesa) {
        this.idMesa = idMesa;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getIdComanda() {
        return idComanda;
    }

    public int getIdMesa() {
        return idMesa;
    }

    public String getEstado() {
        return estado;
    }
}