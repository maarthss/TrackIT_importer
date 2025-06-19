package dbInsert;

import retrieve.model.Album;
import retrieve.model.Artist;

import java.sql.*;
import java.util.List;

public class AlbumIns {

    public void insertAlbums(List<Album> albums){
        try {
            Connection conn = DriverManager.getConnection(Inserts.URL, Inserts.USER, Inserts.PASSWORD);
            List<String> columns = List.of("id", "title", "release_date", "description", "artist_id");
            Inserts i = new Inserts();

            PreparedStatement pst = conn.prepareStatement(i.createQuery("album", columns));
            for(Album a : albums){
                pst.setLong(1, a.getId());
                pst.setString(2, a.getTitle());
                pst.setString(3, a.getRelease_date());
                pst.setString(4, a.getDescription());
                pst.setObject(5, a.getArtist().getId());
                pst.executeUpdate();
            }
            conn.close();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }
}
