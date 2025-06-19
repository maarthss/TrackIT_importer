package retrieve.fetcher;

import java.io.*;

public class ToFetch implements Fetcher{

    StringBuilder response = new StringBuilder();

    @Override
    public StringBuilder toFetch(FetchRequest request) {
        try{
            InputStream file = getClass().getClassLoader().getResourceAsStream(request.getTerm1());  //Aquí va sa url des fitxer que vull llegir
            if(file == null){
                throw new FileNotFoundException("File not found");
            }
            BufferedReader bf = new BufferedReader(new InputStreamReader(file));

            String line;
            while((line = bf.readLine()) != null) {
                response.append(line);
            }
            bf.close();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        return response;
    }
}
