package com.ermuza;
import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

public class Platos {
    private final StringProperty id;
    private final StringProperty nombre;

    public Platos() {
        this.id = new SimpleStringProperty(this, "id");
        this.nombre = new SimpleStringProperty(this, "nombre");
    }

    public String getId() {
        return id.get();
    }

    public void setId(String id) {
        this.id.set(id);
    }

    public StringProperty idProperty() {
        return id;
    }

    public String getNombre() {
        return nombre.get();
    }

    public void setNombre(String nombre) {
        this.nombre.set(nombre);
    }

    public StringProperty nombreProperty() {
        return nombre;
    }
}
