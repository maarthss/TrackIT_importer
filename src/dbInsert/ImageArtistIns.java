package dbInsert;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ImageArtistIns {

    public void insertImage(String value, Long id){
        try {
            Connection conn = DriverManager.getConnection(Inserts.URL, Inserts.USER, Inserts.PASSWORD);
            String query = "UPDATE album SET image = ? WHERE id = " + id;
            PreparedStatement pst = conn.prepareStatement(query);

            pst.setString(1, value);
            pst.executeUpdate();

            conn.close();
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }

    }
}
