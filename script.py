import sys
from awsglue.utils import getResolvedOptions
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.dynamicframe import DynamicFrame

args = getResolvedOptions(sys.argv, ['JOB_NAME'])
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Configuração do catálogo Iceberg usando Glue Catalog
spark.conf.set("spark.sql.catalog.glue_catalog", "org.apache.iceberg.spark.SparkCatalog")
spark.conf.set("spark.sql.catalog.glue_catalog.catalog-impl", "org.apache.iceberg.aws.glue.GlueCatalog")
spark.conf.set("spark.sql.catalog.glue_catalog.warehouse", "s3://fiap-tech-challange-covid-turma-grupo96/warehouse/")

# 1. Ler CSV do S3
datasource = glueContext.create_dynamic_frame.from_options(
    connection_type="s3",
    connection_options={
        "paths": ["s3://fiap-tech-challange-covid-turma-grupo96/data/raw/"]
    },
    format="csv",
    format_options={"withHeader": True, "separator": ","}
)

# 2. Converter para DataFrame e selecionar colunas específicas
df = datasource.toDF().select(
   "A002", "A003", "A005", "B011", "B0011", "B0012", "B0013", "B0014", "B0015", "B0016", "B0017", "B0018", "B0019", "B00110", "B00111", "B00112", "B00113", "B002", "B0041", "B0042", "B0043", "B0044", "B0045", "B0046", "B005", "B008", "C007C", "C01011", "D0011", "D0021", "D0031", "D0041", "D0051", "D0061", "F002A1", "F002A2", "F002A3", "F002A4", "F002A5")


# 2b. Renomear colunas
df = (df
      .withColumnRenamed("A002", "populacao_idade")
      .withColumnRenamed("A003", "populacao_sexo")
      .withColumnRenamed("A005", "populacao_escolaridade")
      .withColumnRenamed("B011", "populacao_contato")
      .withColumnRenamed("B0011", "sintomas_febre")
      .withColumnRenamed("B0012", "sintomas_tosse")
      .withColumnRenamed("B0013", "sintomas_dor_garganta")
      .withColumnRenamed("B0014", "sintomas_dificuldade_respirar")
      .withColumnRenamed("B0015", "sintomas_dor_cabeca")
      .withColumnRenamed("B0016", "sintomas_dor_peito")
      .withColumnRenamed("B0017", "sintomas_nausea")
      .withColumnRenamed("B0018", "sintomas_nariz_entupido")
      .withColumnRenamed("B0019", "sintomas_fadiga_cansaco")
      .withColumnRenamed("B00110", "sintomas_dor_olhos")
      .withColumnRenamed("B00111", "sintomas_perda_cheiro_sabor")
      .withColumnRenamed("B00112", "sintomas_dor_muscular")
      .withColumnRenamed("B00113", "sintomas_diarreia")
      .withColumnRenamed("B002", "sintomas_atendimento_procurou_estabelecimento")
      .withColumnRenamed("B0041", "sintomas_atendimento_posto_saude")
      .withColumnRenamed("B0042", "sintomas_atendimento_pronto_socorro")
      .withColumnRenamed("B0043", "sintomas_atendimento_hospital_sus_upa")
      .withColumnRenamed("B0044", "sintomas_atendimento_ambulatorio_forcas_armadas")
      .withColumnRenamed("B0045", "sintomas_atendimento_pronto_socorro_forcas_armadas")
      .withColumnRenamed("B0046", "sintomas_atendimento_hospital_privado")
      .withColumnRenamed("B005", "sintomas_internacao")
      .withColumnRenamed("B008", "sintomas_fez_teste")
      .withColumnRenamed("C007C", "economico_tipo_trabalho")
      .withColumnRenamed("C01011", "economico_salario")
      .withColumnRenamed("D0011", "economico_aposentadoria_pensao")
      .withColumnRenamed("D0021", "economico_pensao_alimenticia")
      .withColumnRenamed("D0031", "economico_bolsa_familia")
      .withColumnRenamed("D0041", "economico_beneficio_assistencial")
      .withColumnRenamed("D0051", "economico_auxilio_emergencial")
      .withColumnRenamed("D0061", "economico_desemprego-seguro")
      .withColumnRenamed("F002A1", "economico_higienie_sabao_detergente")
      .withColumnRenamed("F002A2", "economico_higienie_alcool_setenta")
      .withColumnRenamed("F002A3", "economico_higienie_mascaras")
      .withColumnRenamed("F002A4", "economico_higienie_luvas_descartaveis")
      .withColumnRenamed("F002A5", "economico_higienie_agua_santitaria")
)

# 3. Escrever em tabela Iceberg no Glue Catalog
df.writeTo("glue_catalog.covid_db_iceberg.covid_tbl_iceberg") \
  .using("iceberg") \
  .createOrReplace()
