SELECT 
    mes,
    -- numeros totais de casos de atendimento por estabelecimento
    COUNT_IF(sintomas_atendimento_posto_saude = '1') AS casos_posto_saude,
    COUNT_IF(sintomas_atendimento_pronto_socorro = '1') AS casos_pronto_socorro,
    COUNT_IF(sintomas_atendimento_hospital_sus_upa = '1') AS casos_hospital_sus_upa,
    COUNT_IF(sintomas_atendimento_ambulatorio_forcas_armadas = '1') AS casos_ambulatorio_forcas_armadas,
    COUNT_IF(sintomas_atendimento_pronto_socorro_forcas_armadas = '1') AS casos_pronto_socorro_forcas_armadas,
    COUNT_IF(sintomas_atendimento_hospital_privado = '1') AS casos_hospital_privado
FROM covid_tbl
GROUP BY mes
ORDER BY mes;
