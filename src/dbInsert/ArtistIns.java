package dbInsert;


import retrieve.model.Artist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class ArtistIns {

    public void insertArtists(List<Artist> artists){
        try {
            Connection conn = DriverManager.getConnection(Inserts.URL, Inserts.USER, Inserts.PASSWORD);
            List<String> columns = List.of("id", "name", "description");
            Inserts i = new Inserts();

            PreparedStatement pst = conn.prepareStatement(i.createQuery("artist", columns));
            for(Artist a : artists){
                pst.setLong(1, a.getId());
                pst.setString(2, a.getName());
                pst.setString(3, a.getDescription());
                pst.executeUpdate();
            }

            conn.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
