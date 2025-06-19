package retrieve.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Track {
    private Long id;
    private String title;
    private String url;
    private Album album;
    private Artist artist;
}
