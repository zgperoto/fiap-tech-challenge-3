SELECT 
    mes,
    -- números absolutos
    COUNT_IF(sintomas_internacao = '1') AS casos_internado,
    COUNT_IF(sintomas_internacao = '2') AS casos_nao_internado,
    COUNT_IF(sintomas_internacao = '3') AS casos_nao_atendido,
    COUNT_IF(sintomas_internacao IN ('1','2')) AS total_atendidos,
    COUNT_IF(sintomas_internacao IN ('1','2','3')) AS total_respondentes,

    -- porcentagens dentro dos atendidos
    COUNT_IF(sintomas_internacao = '1') * 100.0 / COUNT_IF(sintomas_internacao IN ('1','2')) AS pct_internado,
    COUNT_IF(sintomas_internacao = '2') * 100.0 / COUNT_IF(sintomas_internacao IN ('1','2')) AS pct_nao_internado,

    -- porcentagem dos não atendidos em relação ao total
    COUNT_IF(sintomas_internacao = '3') * 100.0 / COUNT_IF(sintomas_internacao IN ('1','2','3')) AS pct_nao_atendido
FROM covid_tbl
GROUP BY mes
ORDER BY mes;