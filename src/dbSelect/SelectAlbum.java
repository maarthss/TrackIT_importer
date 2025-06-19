package dbSelect;

import dbInsert.Inserts;
import retrieve.model.Album;
import retrieve.model.Artist;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SelectAlbum {

    public List<Album> selectAllAlbums(){
        List<Album> albums = new ArrayList<>();
        try {
            Connection conn = DriverManager.getConnection(Inserts.URL, Inserts.USER, Inserts.PASSWORD);
            String query = "SELECT * FROM album";
            PreparedStatement pst = conn.prepareStatement(query);
            ResultSet rs = pst.executeQuery();

            while (rs.next()){
                Long id = rs.getLong("id");
                String title = rs.getString("title");
                String releaseDate = rs.getString("release_date");
                String description = rs.getString("description");
                long artistId = rs.getLong("artist_id");

                Artist artist = this.getSingleArtist(artistId);
                Album a = new Album(id, title, releaseDate, description, artist);
                albums.add(a);
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return albums;
    }

    private Artist getSingleArtist(Long artistId){
        String q = "SELECT * FROM artist WHERE id = " + artistId;
        SelectArtist s = new SelectArtist();
        List<Artist> ar = s.getArtists(q);
        return ar.getFirst();
    }
}
