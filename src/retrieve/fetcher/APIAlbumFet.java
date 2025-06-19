package retrieve.fetcher;

import com.google.gson.Gson;
import retrieve.apiModel.APIModel;
import retrieve.apiModel.Image;
import retrieve.response.AlbumImageRes;

import java.net.URI;
import java.net.URLEncoder;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class APIAlbumFet implements Fetcher {

    static final String APIKEY = "c6e0bf24970403549baf30d7cc7a3dfa";

    @Override
    public APIModel toFetch(FetchRequest fetchRequest) {
        String encodedArtist = URLEncoder.encode(fetchRequest.getTerm1(), StandardCharsets.UTF_8);
        String encodedAlbum = URLEncoder.encode(fetchRequest.getTerm2(), StandardCharsets.UTF_8);

        try {
            HttpClient httpClient = HttpClient.newHttpClient();
            HttpRequest httpRequest = HttpRequest.newBuilder()
                    .uri(URI.create("http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=" + APIKEY + "&artist=" + encodedArtist + "&album=" + encodedAlbum + "&format=json"))
                    .GET()
                    .build();

            HttpResponse<String> response = httpClient.send(httpRequest, HttpResponse.BodyHandlers.ofString());
            Gson gson = new Gson();

            AlbumImageRes albumImageRes = gson.fromJson(response.body(), AlbumImageRes.class);
            List<Image> images = albumImageRes.album.getImage();
            return this.setUrl(images);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            throw new RuntimeException();
        }
    }

    protected APIModel setUrl(List<Image> images){
        APIModel a = new APIModel();
        a.setImageUrl(images.get(3).getUrl());
        return a;
    }
}
