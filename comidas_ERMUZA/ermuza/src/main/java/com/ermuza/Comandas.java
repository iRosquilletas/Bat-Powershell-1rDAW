package com.ermuza;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Comandas {
    private final StringProperty idDetalleComanda;
    private final StringProperty idComanda;
    private final StringProperty idPlato;
    private final StringProperty cantidad;
    private final StringProperty estado;
    public Comandas(){

        this.idDetalleComanda = new SimpleStringProperty(this, "idDetallecomanda");
        this.idComanda = new SimpleStringProperty(this, "idComanda");
        this.idPlato = new SimpleStringProperty(this, "idPlato");
        this.cantidad = new SimpleStringProperty(this, "cantidad");
        this.estado = new SimpleStringProperty(this, "estado");

    }
    public void setIdComanda(String idComanda) {
        this.idComanda.set(idComanda);
    }
    
    public void setIdPlato(String idPlato) {
        this.idPlato.set(idPlato);
    }
    
    public void setCantidad(String cantidad) {
        this.cantidad.set(cantidad);
    }
    public void setEstado(String Estado) {
        this.estado.set(Estado);
    }
    public void setDetalleComanda(String idDetalleComanda){
        this.idDetalleComanda.set(idDetalleComanda);
    }
    
    public String getIdDetalleComanda() {
        return idDetalleComanda.get();
    }
    
    public String getIdComanda() {
        return idComanda.get();
    }
    
    public String getIdPlato() {
        return idPlato.get();
    }
    
    public StringProperty getEstado() {
        return estado;
    }
    public String getCantidad() {
        return cantidad.get();
    }
    
    public StringProperty idDetalleComandaProperty() {
        return idDetalleComanda;
    }
    
    public StringProperty idComandaProperty() {
        return idComanda;
    }
    
    public StringProperty idPlatoProperty() {
        return idPlato;
    }
    
    public StringProperty cantidadProperty() {
        return cantidad;
    }
    public StringProperty estadoProperty() {
        return estado;
    }
    
   

    

}
