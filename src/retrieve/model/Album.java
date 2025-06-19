package retrieve.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Album {
    private Long id;
    private String title;
    private String release_date;
    private String description;
    private Artist artist;
}
