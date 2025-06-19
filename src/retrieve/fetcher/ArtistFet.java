package retrieve.fetcher;
import com.google.gson.Gson;
import retrieve.model.Artist;
import retrieve.response.ArtistRes;

import java.util.ArrayList;
import java.util.List;

public class ArtistFet{

    List<Artist> list = new ArrayList<>();

    public List<Artist> retrieveArtist(){

        try{
            FetchRequest request = new FetchRequest("\\resources\\artists.json");
            ToFetch f = new ToFetch();
            StringBuilder response = f.toFetch(request);
            Gson gson = new Gson();
            ArtistRes artistRes = gson.fromJson(response.toString(), ArtistRes.class);
            list.addAll(artistRes.artists);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
}
