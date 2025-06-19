package retrieve.fetcher;


public interface Fetcher {
    Object toFetch(FetchRequest fetchRequest);
}
