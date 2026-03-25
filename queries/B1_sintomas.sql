SELECT 
    -- numeros totais de casos sintomaticos
    mes,
    COUNT_IF(sintomas_febre = '1') AS casos_febre,
    COUNT_IF(sintomas_tosse = '1') AS casos_tosse,
    COUNT_IF(sintomas_dor_garganta = '1') AS casos_dor_garganta,
    COUNT_IF(sintomas_dificuldade_respirar = '1') AS casos_dificuldade_respirar,
    COUNT_IF(sintomas_dor_cabeca = '1') AS casos_dor_cabeca,
    COUNT_IF(sintomas_dor_peito = '1') AS casos_dor_peito,
    COUNT_IF(sintomas_nausea = '1') AS casos_nausea,
    COUNT_IF(sintomas_nariz_entupido = '1') AS casos_nariz_entupido,
    COUNT_IF(sintomas_fadiga_cansaco = '1') AS casos_fadiga_cansaco,
    COUNT_IF(sintomas_dor_olhos = '1') AS casos_dor_olhos,
    COUNT_IF(sintomas_perda_cheiro_sabor = '1') AS casos_perda_cheiro_sabor,
    COUNT_IF(sintomas_dor_muscular = '1') AS casos_dor_muscular,
    COUNT_IF(sintomas_diarreia = '1') AS casos_diarreia
FROM "covid_tbl" 
GROUP BY mes
ORDER BY mes