package com.ermuza;

import javafx.application.Application;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.ChoiceBox;
import javafx.stage.Stage;

import java.io.IOException;
// "jdbc:mysql://localhost:33006/ERMUZA", "root", "dbrootpass"
    //"jdbc:mysql://localhost:3306/ERMUZA", "root", "1234"
/**
 * JavaFX App
 */
public class App extends Application {

    private static Scene scene;
    PrincipalController pr = new PrincipalController();

    String Nombre = pr.getId();
    @Override
    public void start(Stage stage) throws IOException {
        scene = new Scene(loadFXML("principal"), 827, 594);
        stage.setScene(scene);
        stage.show();
    }

    static void setRoot(String fxml) throws IOException {
        scene.setRoot(loadFXML(fxml));
    }

    private static Parent loadFXML(String fxml) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource(fxml + ".fxml"));
        return fxmlLoader.load();
    }

    public static void main(String[] args) {
        launch();
    }

}