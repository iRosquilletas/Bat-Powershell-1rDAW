package com.ermuza;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;

public class Camarero2Controller implements Initializable {

    @FXML
    private TableView<Comanda> tablaComandas;
    @FXML
    private TableColumn<Comanda, Integer> numComandaCol;
    @FXML
    private TableColumn<Comanda, Integer> idPlatoCol;
    @FXML
    private TableColumn<Comanda, Integer> cantidadCol;
    @FXML
    private TableColumn<Comanda, String> estadoCol;

    private ObservableList<Comanda> comandas;

    private String idTrabajador;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        numComandaCol.setCellValueFactory(cellData -> cellData.getValue().idComandaProperty().asObject());
        idPlatoCol.setCellValueFactory(cellData -> cellData.getValue().idPlatoProperty().asObject());
        cantidadCol.setCellValueFactory(cellData -> cellData.getValue().cantidadProperty().asObject());
        estadoCol.setCellValueFactory(cellData -> cellData.getValue().estadoProperty());
    }

    public void setIdTrabajador(String idTrabajador) {
        this.idTrabajador = idTrabajador;
        cargarComandasDesdeBD();
    }

    private void cargarComandasDesdeBD() {
        String url = "jdbc:mysql://localhost:3306/ERMUZA";
        String user = "root";
        String password = "1234";
        String query = "SELECT dc.id_Comanda, dc.id_Plato, dc.Cantidad, dc.Estado " +
                       "FROM detalleComanda dc " +
                       "JOIN comandas c ON dc.id_Comanda = c.id_Comanda " +
                       "JOIN MesaTrabajadores mt ON c.id_Mesa = mt.id_Mesa " +
                       "WHERE mt.id_Trabajador = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, this.idTrabajador);
            ResultSet resultSet = statement.executeQuery();

            comandas = FXCollections.observableArrayList();

            while (resultSet.next()) {
                int idComanda = resultSet.getInt("id_Comanda");
                int idPlato = resultSet.getInt("id_Plato");
                int cantidad = resultSet.getInt("Cantidad");
                String estado = resultSet.getString("Estado");

                comandas.add(new Comanda(idComanda, idPlato, cantidad, estado));
            }

            tablaComandas.setItems(comandas);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
