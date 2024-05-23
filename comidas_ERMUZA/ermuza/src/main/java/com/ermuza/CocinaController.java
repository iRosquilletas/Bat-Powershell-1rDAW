package com.ermuza;

import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.ChoiceDialog;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import java.util.ResourceBundle;

public class CocinaController implements Initializable {
    
    // tabla platos
    @FXML
    private TableView<Platos> tablaPlatos;
    
    @FXML
    private TableColumn<Platos, String> idPlatoColumn;
    
    @FXML
    private TableColumn<Platos, String> nombreColumn;
   

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        
        // TABLA PLATOS

        idPlatoColumn.setCellValueFactory(cellData -> cellData.getValue().idProperty());
        nombreColumn.setCellValueFactory(cellData -> cellData.getValue().nombreProperty());
        // TABLA COMANDAS

        NumComandaCol.setCellValueFactory(cellData -> cellData.getValue().idComandaProperty());
        IdPlatoCol.setCellValueFactory(cellData -> cellData.getValue().idPlatoProperty());
        CantidadCol.setCellValueFactory(cellData -> cellData.getValue().cantidadProperty());
        EstadoCol.setCellValueFactory(cellData -> cellData.getValue().estadoProperty());
        
        try {
            cargarPlatosDesdeBD();
            cargarComandasDesdeBD();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void cargarPlatosDesdeBD() throws SQLException {
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234" );
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("SELECT * FROM platos");

        while (resultSet.next()) {
            Platos plato = new Platos();
            plato.setId(resultSet.getString("id_plato"));
            plato.setNombre(resultSet.getString("descripcion"));
            tablaPlatos.getItems().add(plato);
        }

        resultSet.close();
        statement.close();
        connection.close();
    }

        //
    // tabla platos
        //
    @FXML
    private TableView<Comandas> tablaComandas;
    @FXML
    private TableColumn<Comandas,String> NumComandaCol;
    
    @FXML
    private TableColumn<Comandas,String> IdPlatoCol;
    @FXML
    private TableColumn<Comandas,String> CantidadCol;
    @FXML
    private TableColumn<Comandas,String> EstadoCol;

    private void cargarComandasDesdeBD() throws SQLException {
    Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234");
    Statement statement = connection.createStatement();
    ResultSet resultSet = statement.executeQuery("SELECT id_Comanda, id_Plato, Cantidad, Estado FROM detalleComanda");

    // Limpiar la tabla de comandas antes de cargar nuevos datos
    tablaComandas.getItems().clear();

    while (resultSet.next()) {
        Comandas comand = new Comandas();
        
        comand.setIdComanda(resultSet.getString("id_Comanda"));
        comand.setIdPlato(resultSet.getString("id_Plato"));
        comand.setCantidad(resultSet.getString("Cantidad"));
        comand.setEstado(resultSet.getString("Estado"));
        tablaComandas.getItems().add(comand);
    }

    resultSet.close();
    statement.close();
    connection.close();
}

        //
    // Botones
        //

    @FXML
    private Button botonEliminar;
    @FXML
    private Button botonEditar;
    @FXML
    private Button botonAceptar;

    @FXML
    private TextField textFieldNombrePlato;
    @FXML
    private TextField textFieldIDPlato;
    

    // CAMBIARLO A LA TABLA DE DETALLECOMANDAS
    public void AccionEliminar(){

        Platos pl = this.tablaPlatos.getSelectionModel().getSelectedItem();
    if (pl == null) {
        Alert alert = new Alert(AlertType.ERROR);
        alert.setHeaderText(null);
        alert.setTitle("ERROR");
        alert.setContentText("Debes seleccionar un plato");
        alert.showAndWait();
    } else {
        ObservableList<Platos> platos = tablaPlatos.getItems();
        platos.removeIf(p -> p.equals(pl));
        tablaPlatos.refresh();

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234")) {
            String query = "DELETE FROM platos WHERE id_plato = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, pl.getId());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
        
    
    public void AccionEditar() throws SQLException {
    // Obtener la comanda seleccionada en la tabla de comandas
    Comandas comandaSeleccionada = tablaComandas.getSelectionModel().getSelectedItem();

    if (comandaSeleccionada != null) {
        // Prompt the user to select a new state for the comanda
        List<String> options = Arrays.asList("Listo", "En preparacion");
        ChoiceDialog<String> dialog = new ChoiceDialog<>("Seleccione una opción", options);
        dialog.setTitle("Cambiar estado de comanda");
        dialog.setHeaderText("Seleccione una nueva opción para el estado de la comanda:");
        dialog.setContentText("Seleccione una opción:");

        Optional<String> result = dialog.showAndWait();

        if (result.isPresent()) {
            String newState = result.get();

            // Actualizar el estado de la comanda en la base de datos
            String idComanda = comandaSeleccionada.getIdComanda();
            String updateQuery = "UPDATE detalleComanda SET Estado = ? WHERE id_Comanda = ?";

            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234");
                 PreparedStatement statement = connection.prepareStatement(updateQuery)) {

                statement.setString(1, newState);
                statement.setString(2, idComanda);
                statement.executeUpdate();

                // Actualizar el estado en el objeto Comandas
                comandaSeleccionada.setEstado(newState);
            }
        }
    } else {
        // Si no se ha seleccionado ninguna comanda, mostrar un mensaje de advertencia
        System.out.println("¡Por favor, seleccione una comanda para cambiar su estado!");
    }
}

    
    // TERMINAR
    @FXML
    private void AccionAceptar() throws SQLException {
        
        String idPlato = textFieldIDPlato.getText();
        String nombrePlato = textFieldNombrePlato.getText();
        // "INSERT INTO platos (id_plato, descripcion) VALUES (?, ?)";
        // Verificar si ambos campos están vacíos
        if (idPlato.isEmpty() || nombrePlato.isEmpty()) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setHeaderText(null);
            alert.setTitle("ERROR");
            alert.setContentText("Alguno de los campos está vacio");
            alert.showAndWait();
            return;
        }
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234")) {
            String query = "INSERT INTO platos (id_plato, descripcion) VALUES (?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, idPlato);
            statement.setString(2, nombrePlato);
            statement.executeUpdate();
            
            // Actualizar la tabla de platos
            Platos plato = new Platos();
            plato.setId(idPlato);
            plato.setNombre(nombrePlato);
            tablaPlatos.getItems().add(plato);
        } catch (SQLException e) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setHeaderText(null);
            alert.setTitle("ERROR");
            alert.setContentText("Id repetido");
            alert.showAndWait();
            return;
        }
    }
}

        // Otros códigos...

    

