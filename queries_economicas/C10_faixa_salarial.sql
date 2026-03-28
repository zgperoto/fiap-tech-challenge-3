SELECT 
  "economico_salario_faixa" AS codigo,
  CASE 
    WHEN "economico_salario_faixa" = '00' THEN '0 - 101'
    WHEN "economico_salario_faixa" = '01' THEN '101 - 300'
    WHEN "economico_salario_faixa" = '02' THEN '301 - 600'
    WHEN "economico_salario_faixa" = '03' THEN '601 - 800'
    WHEN "economico_salario_faixa" = '04' THEN '801 - 1.600'
    WHEN "economico_salario_faixa" = '05' THEN '1.601 - 3.000'
    WHEN "economico_salario_faixa" = '06' THEN '3.001 - 10.000'
    WHEN "economico_salario_faixa" = '07' THEN '10.001 - 50.000'
    WHEN "economico_salario_faixa" = '08' THEN '50.001 - 100.000'
    WHEN "economico_salario_faixa" = '09' THEN 'Mais de 100.000'
  END AS faixa_salarial,
  COUNT(*) AS total
FROM "covid_db_iceberg"."economico"
WHERE "economico_salario_faixa" IS NOT NULL 
  AND "economico_salario_faixa" <> ''
GROUP BY "economico_salario_faixa"
ORDER BY codigo;