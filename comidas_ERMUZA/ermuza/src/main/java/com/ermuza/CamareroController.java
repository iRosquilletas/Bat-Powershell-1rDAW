package com.ermuza;
import javafx.scene.Node;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.MenuItem;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;



public class CamareroController implements Initializable {
    @FXML
    private TableView<ComandaCamarero> tablaComandas;

    @FXML
    private TableColumn<ComandaCamarero, Integer> idColumn;

    @FXML
    private TableColumn<ComandaCamarero, Integer> idMesaColumn;

    @FXML
    private TableColumn<ComandaCamarero, String> estadoColumn;

    private String id;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        idColumn.setCellValueFactory(new PropertyValueFactory<>("idComanda"));
        idMesaColumn.setCellValueFactory(new PropertyValueFactory<>("idMesa"));
        estadoColumn.setCellValueFactory(new PropertyValueFactory<>("estado"));
    }

    public void setId(String id) {
        this.id = id;
        cargarComandasDesdeBD();
    }

    private void cargarComandasDesdeBD() {
        String url = "jdbc:mysql://localhost:3306/ERMUZA";
        String user = "root";
        String password = "1234";
        String query = "SELECT c.id_Comanda, c.id_Mesa, c.Estado " +
                       "FROM comandas c " +
                       "JOIN MesaTrabajadores mt ON c.id_Mesa = mt.id_Mesa " +
                       "WHERE mt.id_Trabajador = ?";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, this.id);
            ResultSet resultSet = statement.executeQuery();

            ObservableList<ComandaCamarero> comandasList = FXCollections.observableArrayList();
            while (resultSet.next()) {
                int idComanda = resultSet.getInt("id_Comanda");
                int idMesa = resultSet.getInt("id_Mesa");
                String estado = resultSet.getString("Estado");

                ComandaCamarero comanda = new ComandaCamarero(idComanda, idMesa, estado);
                comandasList.add(comanda);
            }

            tablaComandas.setItems(comandasList);

        } catch (SQLException e) {
            showAlert("Error al cargar las comandas: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private void showAlert(String message) {
        Alert alert = new Alert(Alert.AlertType.ERROR);
        alert.setTitle("Error");
        alert.setHeaderText(null);
        alert.setContentText(message);
        alert.showAndWait();
    }


    public void botonEstado() {

        ComandaCamarero comandaSeleccionada = tablaComandas.getSelectionModel().getSelectedItem();

        if (comandaSeleccionada != null) {
            try {
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234");
                String nuevoEstado = "";

                if (comandaSeleccionada.getEstado().toLowerCase().equals("abierta")) {
                    nuevoEstado = "cerrada";
                } else if (comandaSeleccionada.getEstado().toLowerCase().equals("cerrada")) {
                    nuevoEstado = "cobrada";
                }else if (comandaSeleccionada.getEstado().toLowerCase().equals("cobrada")) {
                    Alert alert = new Alert(Alert.AlertType.WARNING);
                    alert.setTitle("Error");
                    alert.setHeaderText("Esa comanda ya esta creada");
                    alert.setContentText("Por favor, seleccione otra comanda de la lista.");
                    alert.showAndWait();
                }

                String updateQuery = "UPDATE comandas SET Estado = ? WHERE id_Comanda = ?";
                PreparedStatement statement = connection.prepareStatement(updateQuery);
                statement.setString(1, nuevoEstado);
                statement.setInt(2, comandaSeleccionada.getIdComanda());
                statement.executeUpdate();

                cargarComandasDesdeBD();

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Estado de Comanda Actualizado");
                alert.setHeaderText("El estado de la comanda ha sido actualizado:");
                alert.setContentText("ID de Comanda: " + comandaSeleccionada.getIdComanda() + "\nNuevo Estado: " + nuevoEstado);
                alert.showAndWait();

                statement.close();
                connection.close();
            } catch (SQLException e) {
                System.out.println("Ya está cobrada");
            }
        }

        else {
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Error");
            alert.setHeaderText("No se ha seleccionado ninguna comanda");
            alert.setContentText("Por favor, seleccione una comanda de la lista.");
            alert.showAndWait();
        }
    }
   

    
    @FXML
    private void botonDetalles(ActionEvent event) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("camarero2.fxml"));
        Parent root = loader.load();
        Camarero2Controller controller = loader.getController();
        controller.setIdTrabajador(this.id);
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.setScene(new Scene(root));
        stage.show();
    }
        
    

   

    @FXML
    private TextField textMesa;

    @FXML
    private TextField textEstado;

    @FXML
    public void botonAceptar() {
        String idMesa = textMesa.getText();
        String estado = textEstado.getText();

        if (idMesa.isEmpty() || estado.isEmpty()) {
            showAlert("Error: falta algún valor");
            return;
        }

        String url = "jdbc:mysql://localhost:3306/ERMUZA";
        String user = "root";
        String password = "1234";
        String insertQuery = "INSERT INTO comandas (id_Mesa, Estado) VALUES (?, ?)";

        try (Connection connection = DriverManager.getConnection(url, user, password);
             PreparedStatement statement = connection.prepareStatement(insertQuery, PreparedStatement.RETURN_GENERATED_KEYS)) {

            statement.setInt(1, Integer.parseInt(idMesa));
            statement.setString(2, estado);
            statement.executeUpdate();

            ResultSet generatedKeys = statement.getGeneratedKeys();
            if (generatedKeys.next()) {
                int newId = generatedKeys.getInt(1);

                ComandaCamarero newComanda = new ComandaCamarero(newId, Integer.parseInt(idMesa), estado);
                tablaComandas.getItems().add(newComanda);

                
                textMesa.clear();
                textEstado.clear();

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Comanda Añadida");
                alert.setHeaderText("La nueva comanda ha sido añadida con éxito:");
                alert.setContentText("ID de Comanda: " + newId);
                alert.showAndWait();
            }

        } catch (SQLException e) {

            showAlert("Error al añadir la comanda");
            e.printStackTrace();

        } catch (NumberFormatException e) {

            showAlert("Error: ID de Mesa debe ser un número.");

        }
    }

   
        //  @FXML
        //  private TableView<ComandaCamarero> tablaComandas;

    @FXML
    public void botonEliminar() {

     
        // cojo la comanda que selecciono
        ComandaCamarero comandaSeleccionada = tablaComandas.getSelectionModel().getSelectedItem();

        if (comandaSeleccionada != null) {
            String url = "jdbc:mysql://localhost:3306/ERMUZA";
            String user = "root";
            String password = "1234";
            String deleteQuery = "DELETE FROM comandas WHERE id_Comanda = ?";

            try (Connection connection = DriverManager.getConnection(url, user, password);
                 PreparedStatement statement = connection.prepareStatement(deleteQuery)) {

                statement.setInt(1, comandaSeleccionada.getIdComanda());
                statement.executeUpdate();

                tablaComandas.getItems().remove(comandaSeleccionada);

                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Comanda Eliminada");
                alert.setHeaderText("La comanda ha sido eliminada con éxito:");
                alert.setContentText("ID de Comanda: " + comandaSeleccionada.getIdComanda());
                alert.showAndWait();

            } catch (SQLException e) {
                showAlert("Error al eliminar la comanda: " + e.getMessage());
                e.printStackTrace();
            }
        } else {
            Alert alert = new Alert(Alert.AlertType.WARNING);
            alert.setTitle("Error");
            alert.setHeaderText("No se ha seleccionado ninguna comanda");
            alert.setContentText("Por favor, seleccione una comanda de la lista.");
            alert.showAndWait();
        }
    }
}

    