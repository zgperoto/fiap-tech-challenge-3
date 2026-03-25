SELECT 
    mes,
    -- porcentagem dos que procuraram atendimento
    COUNT_IF(sintomas_atendimento_procurou_estabelecimento = '1') * 100.0 /
        COUNT_IF(sintomas_atendimento_procurou_estabelecimento IN ('1','2')) AS pct_sim,
    COUNT_IF(sintomas_atendimento_procurou_estabelecimento = '2') * 100.0 /
        COUNT_IF(sintomas_atendimento_procurou_estabelecimento IN ('1','2')) AS pct_nao
FROM covid_tbl
GROUP BY mes
ORDER BY mes;