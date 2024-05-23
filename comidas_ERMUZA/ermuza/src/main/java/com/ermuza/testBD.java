package com.ermuza;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class testBD{

    public Connection getConnection() throws SQLException {

        return DriverManager.getConnection("jdbc:mysql://localhost:33006/ERMUZA", "root", "dbrootpass");
        
    }

    public String TablaPlatos() throws SQLException{

        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM platos")) {

            while (rs.next()) {
                String id_plato = rs.getString("id_plato");
                String descripcion = rs.getString("descripcion");
                return id_plato + ": " + descripcion;
            }

        } catch (SQLException e) {

            System.out.println("Error en la base de datos: " + e.getErrorCode() + " - " + e.getMessage());

        }
        return "";
    }

    public String TablaMesas() throws SQLException{


        try (
            Connection con = getConnection();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM Mesas");
         ) {

            while (rs.next()) {
                String id_Mesa = rs.getString("id_Mesa");
                String capacidad = rs.getString("capacidad");
                return id_Mesa + ":" + capacidad;
            }
         }catch (SQLException e) {
            System.out.println("Error en la base de datos: " + e.getErrorCode() + " - " + e.getMessage());

        }
        return "";

    }
}