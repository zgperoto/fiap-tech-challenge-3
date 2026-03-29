SELECT 
    SUM(CASE WHEN economico_higienie_sabao_detergente = '1' THEN 1 ELSE 0 END) AS sabao_detergente_sim,
    SUM(CASE WHEN economico_higienie_sabao_detergente = '2' THEN 1 ELSE 0 END) AS sabao_detergente_nao,
    SUM(CASE WHEN economico_higienie_sabao_detergente = '3' THEN 1 ELSE 0 END) AS sabao_detergente_nao_sabe,

    SUM(CASE WHEN economico_higienie_alcool_setenta = '1' THEN 1 ELSE 0 END) AS alcool_setenta_sim,
    SUM(CASE WHEN economico_higienie_alcool_setenta = '2' THEN 1 ELSE 0 END) AS alcool_setenta_nao,
    SUM(CASE WHEN economico_higienie_alcool_setenta = '3' THEN 1 ELSE 0 END) AS alcool_setenta_nao_sabe,

    SUM(CASE WHEN economico_higienie_mascaras = '1' THEN 1 ELSE 0 END) AS mascaras_sim,
    SUM(CASE WHEN economico_higienie_mascaras = '2' THEN 1 ELSE 0 END) AS mascaras_nao,
    SUM(CASE WHEN economico_higienie_mascaras = '3' THEN 1 ELSE 0 END) AS mascaras_nao_sabe,

    SUM(CASE WHEN economico_higienie_luvas_descartaveis = '1' THEN 1 ELSE 0 END) AS luvas_sim,
    SUM(CASE WHEN economico_higienie_luvas_descartaveis = '2' THEN 1 ELSE 0 END) AS luvas_nao,
    SUM(CASE WHEN economico_higienie_luvas_descartaveis = '3' THEN 1 ELSE 0 END) AS luvas_nao_sabe,

    SUM(CASE WHEN economico_higienie_agua_santitaria = '1' THEN 1 ELSE 0 END) AS agua_sanitaria_sim,
    SUM(CASE WHEN economico_higienie_agua_santitaria = '2' THEN 1 ELSE 0 END) AS agua_sanitaria_nao,
    SUM(CASE WHEN economico_higienie_agua_santitaria = '3' THEN 1 ELSE 0 END) AS agua_sanitaria_nao_sabe
FROM economico;