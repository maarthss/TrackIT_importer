package retrieve.fetcher;

import com.google.gson.Gson;
import retrieve.model.Album;
import retrieve.response.AlbumRes;

import java.util.ArrayList;
import java.util.List;

public class AlbumFet {

    List<Album> list = new ArrayList<>();

    public List<Album> retrieveAlbum() {
        try {
            FetchRequest request = new FetchRequest("\\resources\\albums.json");
            ToFetch f = new ToFetch();
            StringBuilder response = f.toFetch(request);
            Gson gson = new Gson();
            AlbumRes albumRes = gson.fromJson(response.toString(), AlbumRes.class);
            list.addAll(albumRes.albums);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return list;
    }

}
