--Na semana passada, devido à pandemia do Coronavírus, em que medida o(a) Sr(a) restringiu o contato com as pessoas?

SELECT
    mes,
    contato,
    COUNT(*) AS qtd,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY mes),
        2
    ) AS percentual
FROM (
    SELECT
        mes,
        CASE
            WHEN CAST(TRIM(populacao_contato) AS INT) = 1 THEN 'Vida normal'
            WHEN CAST(TRIM(populacao_contato) AS INT) = 2 THEN 'Reduziu contato'
            WHEN CAST(TRIM(populacao_contato) AS INT) = 3 THEN 'Só necessidade'
            WHEN CAST(TRIM(populacao_contato) AS INT) = 4 THEN 'Isolamento total'
        END AS contato
    FROM covid_tbl
    WHERE TRIM(populacao_contato) IN ('1','2','3','4')
) base
GROUP BY mes, contato
ORDER BY mes, percentual DESC