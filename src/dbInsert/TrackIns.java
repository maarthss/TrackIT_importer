package dbInsert;

import retrieve.model.Track;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class TrackIns {

    public void insertTracks(List<Track> tracks){
        try {
            Connection conn = DriverManager.getConnection(Inserts.URL, Inserts.USER, Inserts.PASSWORD);
            List<String> columns = List.of("id", "title", "video", "album_id", "artist_id");
            Inserts i = new Inserts();

            PreparedStatement pst = conn.prepareStatement(i.createQuery("track", columns));
            for(Track t : tracks){
                pst.setLong(1, t.getId());
                pst.setString(2, t.getTitle());
                pst.setString(3, t.getUrl());
                pst.setObject(4, t.getAlbum().getId());
                pst.setObject(5, t.getArtist().getId());
                pst.executeUpdate();
            }

            conn.close();

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
