package dbSelect;

import dbInsert.Inserts;
import retrieve.model.Artist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SelectArtist {

    public List<Artist> getArtists(String query){
        List<Artist> artists = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(Inserts.URL, Inserts.USER, Inserts.PASSWORD);
            PreparedStatement pst = conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()){
                Long artId = rs.getLong("id");
                String name = rs.getString("name");
                String description = rs.getString("description");

                Artist a = new Artist(artId, name, description);
                artists.add(a);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return artists;
    }

}
