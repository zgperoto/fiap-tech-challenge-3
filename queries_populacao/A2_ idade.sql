-- 1- A2. Qual sua idade? (A002)
-- concentração por faixa etaria idade

SELECT
    mes,
    faixa_etaria,
    COUNT(*) AS qtd,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY mes),
        2
    ) AS percentual
FROM (
    SELECT 
        mes,
        CASE 
            WHEN CAST(populacao_idade AS INT) BETWEEN 0 AND 12 THEN '0 a 12'
            WHEN CAST(populacao_idade AS INT) BETWEEN 13 AND 17 THEN '13 a 17'
            WHEN CAST(populacao_idade AS INT) BETWEEN 18 AND 59 THEN '18 a 59'
            WHEN CAST(populacao_idade AS INT) >= 60 THEN '60+'
        END AS faixa_etaria
    FROM covid_tbl
) base
GROUP BY mes, faixa_etaria
ORDER BY mes, faixa_etaria, percentual

