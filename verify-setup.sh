#!/bin/bash

echo "=== Java & Maven Setup Verification ==="
echo ""

# Check Java
echo "Checking Java installation..."
if command -v java &> /dev/null; then
    echo "✅ Java found: $(java -version 2>&1 | head -n 1)"
else
    echo "❌ Java not found or not in PATH"
    echo "   Install Java from: https://adoptium.net/temurin/releases/"
    exit 1
fi

# Check Maven
echo ""
echo "Checking Maven installation..."
if command -v mvn &> /dev/null; then
    echo "✅ Maven found: $(mvn -version | head -n 1)"
else
    echo "❌ Maven not found or not in PATH"
    echo "   Install Maven from: https://maven.apache.org/download.cgi"
    exit 1
fi

# Test Maven project
echo ""
echo "Testing Maven project..."
if mvn validate > /dev/null 2>&1; then
    echo "✅ Maven project is valid"
else
    echo "❌ Maven project has issues"
    echo "   Run 'mvn validate' to see detailed errors"
    exit 1
fi

# Test compilation
echo ""
echo "Testing project compilation..."
if mvn compile > /dev/null 2>&1; then
    echo "✅ Project compiles successfully"
else
    echo "❌ Compilation failed"
    echo "   Run 'mvn compile' to see detailed errors"
    exit 1
fi

echo ""
echo "🎉 All checks passed! Your Java & Maven setup is working correctly."
echo ""
echo "Next steps:"
echo "1. Run 'mvn clean package' to build the JAR"
echo "2. Upload the JAR from target/ directory to Databricks"
echo "3. Run your CsvToSparkTable job in Databricks"
