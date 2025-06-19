package retrieve.apiModel;

import com.google.gson.annotations.SerializedName;
import lombok.Data;

@Data
public class Image {
    @SerializedName("#text")
    private String url;
    private String size;
}
