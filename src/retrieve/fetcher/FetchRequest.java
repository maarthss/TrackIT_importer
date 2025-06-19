package retrieve.fetcher;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class FetchRequest {

    //Aquesta classe serveix per passar-li com a paràmetre a s'interfície. Es segon terme es opcional, es primer obligatori

    private String term1;
    private String term2;

    public FetchRequest(String term1) {
        this.term1 = term1;
    }
}
