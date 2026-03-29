SELECT 
    SUM(CASE WHEN economico_aposentadoria_pensao = '1' THEN 1 ELSE 0 END) AS aposentadoria_pensao,
    SUM(CASE WHEN economico_pensao_alimenticia = '1' THEN 1 ELSE 0 END) AS pensao_alimenticia,
    SUM(CASE WHEN economico_bolsa_familia = '1' THEN 1 ELSE 0 END) AS bolsa_familia,
    SUM(CASE WHEN economico_beneficio_assistencial = '1' THEN 1 ELSE 0 END) AS beneficio_assistencial,
    SUM(CASE WHEN economico_auxilio_emergencial = '1' THEN 1 ELSE 0 END) AS auxilio_emergencial,
    SUM(CASE WHEN economico_desemprego_seguro = '1' THEN 1 ELSE 0 END) AS desemprego_seguro
FROM "covid_db_iceberg"."economico" ;