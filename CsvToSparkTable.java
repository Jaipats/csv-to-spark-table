import org.apache.spark.sql.Dataset;
import org.apache.spark.sql.Row;
import org.apache.spark.sql.SparkSession;
import org.apache.spark.sql.SaveMode;

public class CsvToSparkTable {

    public static void main(String[] args) {
        // 1. Initialize SparkSession for Databricks
        SparkSession spark = SparkSession.builder()
                .appName("CsvToSparkTable")
                // Remove master() for Databricks - it will use the cluster configuration
                .getOrCreate();

        // 2. Define CSV file path and table name for Databricks
        String csvFilePath = "/Volumes/jai_patel_spglobal/dji/jars/cars.csv";
        String tableName = "jai_patel_spglobal.dji.cars";

        try {
            System.out.println("Starting CSV to Databricks Unity Catalog table ingestion...");
            System.out.println("Reading CSV from: " + csvFilePath);
            System.out.println("Writing to Unity Catalog table: " + tableName);

            // 3. Read CSV into a DataFrame
            Dataset<Row> df = spark.read()
                    .format("csv")
                    .option("header", "true") // Assumes your CSV has a header row
                    .option("inferSchema", "true") // Infer schema (data types) automatically
                    .load(csvFilePath);

            // Check if data was loaded successfully
            long rowCount = df.count();
            System.out.println("Successfully loaded " + rowCount + " rows from CSV file.");

            // Optional: Show a few rows and schema to verify
            System.out.println("Schema of the DataFrame:");
            df.printSchema();
            System.out.println("First 5 rows of the DataFrame:");
            df.show(5);

            // 4. Ingest DataFrame into Databricks Unity Catalog table
            System.out.println("Writing data to Unity Catalog table...");
            df.write()
                    .mode(SaveMode.Overwrite) // Overwrites existing table
                    .saveAsTable(tableName);

            System.out.println("✅ CSV data successfully ingested into Unity Catalog table: " + tableName);

            // 5. (Optional) Query the newly created table
            System.out.println("Verifying data in Unity Catalog table:");
            spark.sql("SELECT * FROM " + tableName + " LIMIT 5").show();

            System.out.println("✅ Ingestion completed successfully!");

        } catch (Exception e) {
            System.err.println("❌ Error during CSV to Unity Catalog ingestion: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        } finally {
            // 6. Stop SparkSession
           // spark.stop();
        }
    }
}