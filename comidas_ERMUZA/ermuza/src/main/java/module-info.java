module com.ermuza {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;

    opens com.ermuza to javafx.fxml;
    exports com.ermuza;
}
