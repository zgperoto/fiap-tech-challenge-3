import sys
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.dynamicframe import DynamicFrame
from pyspark.sql.functions import input_file_name, regexp_extract

args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Configuração do catálogo Iceberg usando Glue Catalog
spark.conf.set("spark.sql.catalog.glue_catalog", "org.apache.iceberg.spark.SparkCatalog")
spark.conf.set("spark.sql.catalog.glue_catalog.catalog-impl", "org.apache.iceberg.aws.glue.GlueCatalog")
spark.conf.set("spark.sql.catalog.glue_catalog.warehouse", "s3://fiap-tech-challange-covid-turma-grupo96/warehouse/")


datasource = spark.read \
    .option("header", "true") \
    .option("inferSchema", "true") \
    .csv("s3://fiap-tech-challange-covid-turma-grupo96/data/raw/")

df = datasource.toDF()

df.writeTo("glue_catalog.covid_db_iceberg.covid_tbl_iceberg") \
  .using("iceberg") \
  .partitionedBy("mes") \
  .createOrReplace()
