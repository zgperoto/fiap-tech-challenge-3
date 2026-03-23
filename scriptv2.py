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

datasource = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={
        "paths": ["s3://fiap-tech-challange-covid-turma-grupo96/data/raw/"],
        "groupFiles": "inPartition",
        "recurse": True
    },
    format="csv",
    format_options={"withHeader": True, "separator": ","}
)

df = datasource.toDF()

df = df.withColumn("mes", regexp_extract(input_file_name(), r"mes=(\d+)", 1))

df.writeTo("glue_catalog.covid_db_iceberg.covid_tbl_iceberg") \
  .using("iceberg") \
  .partitionedBy("mes") \
  .createOrReplace()
