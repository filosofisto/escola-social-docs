#! /bin/bash
echo "========================================"
echo "Executando tarefa agendada"
echo "========================================"
echo "java -jar /opt/Dev/escola-social-etl/target/etl-1.0-SNAPSHOT.jar --producao"

export ESCOLA_SOCIAL_ETL_URL=jdbc:postgresql://localhost:5432/postgres
export ESCOLA_SOCIAL_ETL_USERNAME=escola_social_dev
export ESCOLA_SOCIAL_ETL_PASSWORD=12345678
export ESCOLA_SOCIAL_ETL_URL_ACCESS=jdbc:ucanaccess:///opt/Dev/SIC_be.accdb

/usr/bin/java -jar /opt/Dev/escola-social-etl/target/etl-1.0-SNAPSHOT.jar --folha

echo "done!"
