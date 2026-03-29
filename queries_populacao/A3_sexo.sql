--sexo
SELECT
    mes,
    sexo,
    COUNT(*) AS qtd,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY mes),
        2
    ) AS percentual
FROM (
    SELECT
        mes,
        CASE
            WHEN CAST(populacao_sexo AS INT) = 1 THEN 'Homem'
            WHEN CAST(populacao_sexo AS INT) = 2 THEN 'Mulher'
        END AS sexo
    FROM covid_tbl
) base
GROUP BY mes, sexo
ORDER BY mes, sexo
