package dbInsert;

import lombok.Getter;

import java.util.List;

@Getter
public class Inserts{

    public static final String URL =  "jdbc:postgresql://localhost:5432/musicbox";
    public static final String USER = "postgres";
    public static final String PASSWORD = "secure_pass_here";
    public String query;

    public String createQuery(String table, List<String> columns){

        StringBuilder columnNames = new StringBuilder();
        StringBuilder questionMark = new StringBuilder();

        for(int i = 0; i < columns.size(); i++){
            if(i > 0){
                columnNames.append(", ");
                questionMark.append(", ");
            }
            columnNames.append(columns.get(i));
            questionMark.append("?");
        }

        query = "INSERT INTO " + table + " (" + columnNames + ") VALUES (" + questionMark + ")";
        return query;
    }
}
