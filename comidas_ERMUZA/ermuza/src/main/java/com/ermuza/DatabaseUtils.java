package com.ermuza;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DatabaseUtils {

    public static boolean checkNameAndRangoMatch(String name, String rango) {
        String query = "SELECT * FROM Trabajadores WHERE Nombre = ? AND Rango = ?";

        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ERMUZA", "root", "1234");
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, name);
            statement.setString(2, rango);

            ResultSet resultSet = statement.executeQuery();

            return resultSet.next();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}