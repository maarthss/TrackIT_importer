package retrieve.fetcher;

import com.google.gson.Gson;
import retrieve.model.Track;
import retrieve.response.ArtistRes;
import retrieve.response.TrackRes;

import java.util.ArrayList;
import java.util.List;

public class TrackFet {

    List<Track> list = new ArrayList<>();

    public List<Track> retrieveTracks(){
        try{
            FetchRequest request = new FetchRequest("\\resources\\tracks.json");
            ToFetch f = new ToFetch();
            StringBuilder response = f.toFetch(request);
            Gson gson = new Gson();
            TrackRes trackRes = gson.fromJson(response.toString(), TrackRes.class);
            list.addAll(trackRes.tracks);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return list;
    }
}
