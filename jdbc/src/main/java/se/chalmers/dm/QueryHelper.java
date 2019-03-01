package se.chalmers.dm;

import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class QueryHelper {
    /**
     *
     * Returns the SQL query string from the given resource file.
     *
     * @param filename the name of the SQL query resource file under
     *                 src/main/java/resources/
     */
    public static String sqlQuery(String filename) {
        try {
            Path path = Paths.get(QueryHelper.class.getClassLoader().getResource(filename).toURI());
            return new String(Files.readAllBytes(path), StandardCharsets.UTF_8.name());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Unable to find query file " + filename);
        }
    }
}
