package com.ermuza;

import javafx.beans.property.IntegerProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Comanda {

    private final IntegerProperty idComanda;
    private final IntegerProperty idPlato;
    private final IntegerProperty cantidad;
    private final StringProperty estado;

    public Comanda(int idComanda, int idPlato, int cantidad, String estado) {
        this.idComanda = new SimpleIntegerProperty(idComanda);
        this.idPlato = new SimpleIntegerProperty(idPlato);
        this.cantidad = new SimpleIntegerProperty(cantidad);
        this.estado = new SimpleStringProperty(estado);
    }

    public IntegerProperty idComandaProperty() {
        return idComanda;
    }

    public IntegerProperty idPlatoProperty() {
        return idPlato;
    }

    public IntegerProperty cantidadProperty() {
        return cantidad;
    }

    public StringProperty estadoProperty() {
        return estado;
    }
}