# Java Program to read CSV and write to Databricks Unity Catalog Table

A Java application that reads CSV files from Databricks volumes and writes them to Databricks Unity Catalog tables using Apache Spark.

## Features

- Reads CSV files with automatic schema inference
- Writes to Databricks Unity Catalog tables
- Built with Apache Spark 4.0.1
- Configurable CSV parsing options
- Comprehensive error handling and logging

## Prerequisites

- Java 11 or higher
- Apache Maven 3.6 or higher
- Databricks Runtime with Spark 4.0.1 or compatible

## Configuration

The application is pre-configured to:
- **Source**: `/Volumes/jai_patel_spglobal/dji/jars/cars.csv`
- **Target**: `jai_patel_spglobal.dji.cars` (Unity Catalog table)

## Building

```bash
mvn clean package
```

## Usage

Upload the generated JAR file to Databricks and run as a job or in a notebook.

## Dependencies

- Apache Spark Core 4.0.1
- Apache Spark SQL 4.0.1

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
