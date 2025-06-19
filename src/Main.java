import dbInsert.*;
import dbSelect.SelectAlbum;
import dbSelect.SelectArtist;
import retrieve.apiModel.APIModel;
import retrieve.fetcher.*;
import retrieve.model.Album;
import retrieve.model.Artist;
import retrieve.model.Track;

import java.util.List;

public class Main {
    public static void main(String[] args) {

        //Per insertar els artistes:

        ArtistFet artistFet = new ArtistFet();
        List<Artist> artistList = artistFet.retrieveArtist();
        ArtistIns ai = new ArtistIns();
        ai.insertArtists(artistList);
        System.out.println("Inserted");

        //Per insertar els albums:
        AlbumFet albumFet = new AlbumFet();
        List<Album> albumList = albumFet.retrieveAlbum();
        AlbumIns ai1 = new AlbumIns();
        ai1.insertAlbums(albumList);
        System.out.println("Inserted");

        //Per insertar els tracks:
        TrackFet trackFet = new TrackFet();
        List<Track> trackList = trackFet.retrieveTracks();
        TrackIns ti = new TrackIns();
        ti.insertTracks(trackList);
        System.out.println("Inserted");

        //Per afegir les imatges dels albums:
        //Seleccionar tot lo que hi ha a sa bbdd, fer ses cridades a sa api i despres insertar a sa bbdd.
        SelectAlbum selectAlbum = new SelectAlbum();
        List<Album> albums = selectAlbum.selectAllAlbums();
        APIAlbumFet albumF = new APIAlbumFet();
        ImageArtistIns im = new ImageArtistIns();

        for (Album album : albums) {
            FetchRequest f = new FetchRequest(album.getArtist().getName(), album.getTitle());
            APIModel apiModel = albumF.toFetch(f);
            im.insertImage(apiModel.getImageUrl(), album.getId());
        }
        System.out.println("Inserted");

    }
}