--escolaridade
--1	Sem instrução
--2	Fundamental incompleto
--3	Fundamental completa
--4	Médio incompleto
--5	Médio completo
--6	Superior incompleto
--7	Superior completo
--8	Pós-graduação, mestrado ou doutorado
SELECT mes,
	escolaridade,
	COUNT(*) AS qtd,
	ROUND(
		COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY mes),
		2
	) AS percentual
FROM (
		SELECT mes,
			CASE
				WHEN CAST(populacao_escolaridade AS INT) = 1 THEN 'Sem Instrução'
				WHEN CAST(populacao_escolaridade AS INT) = 2 THEN 'Fundamental Incompleto'
				WHEN CAST(populacao_escolaridade AS INT) = 3 THEN 'Fundamental Completo'
				WHEN CAST(populacao_escolaridade AS INT) = 4 THEN 'Médio Incompleto'
				WHEN CAST(populacao_escolaridade AS INT) = 5 THEN 'Médio Completo'
				WHEN CAST(populacao_escolaridade AS INT) = 6 THEN 'Superior Incompleto'
				WHEN CAST(populacao_escolaridade AS INT) = 7 THEN 'Superior Completo'
				WHEN CAST(populacao_escolaridade AS INT) = 8 THEN 'Pós Graduação, Mestrado ou Doutorado'
			END AS escolaridade
		FROM covid_tbl
		WHERE TRIM(populacao_escolaridade) IN ('1', '2', '3', '4', '5', '6', '7', '8')
	) base
GROUP BY mes,
	escolaridade
ORDER BY mes,
	percentual DESC