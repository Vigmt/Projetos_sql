SELECT * FROM `basedosdados.br_inpe_queimadas.microdados` LIMIT 1000;

--Qual estado teve o maior número de focos de queimadas em 2022?

select -- exercicio 1
sigla_uf,
COUNT(id_foco) AS total_focos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`
WHERE 
  EXTRACT(YEAR FROM data_hora) = 2022
GROUP BY 
  sigla_uf
ORDER BY 
  total_focos DESC
LIMIT 1;

--Qual o ano com mais queimadas nos últimos 5 anos no Brasil?
SELECT -- Exercicio 2
  EXTRACT(YEAR FROM data_hora) AS ano, 
  COUNT(id_foco) AS total_focos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`
WHERE 
  EXTRACT(YEAR FROM data_hora) BETWEEN EXTRACT(YEAR FROM CURRENT_DATE()) - 5 AND EXTRACT(YEAR FROM CURRENT_DATE())
GROUP BY 
  ano
ORDER BY 
  total_focos DESC
LIMIT 1;

--Qual foi o bioma mais afetado pelas queimadas em 2022?
SELECT -- Exercicio 3
  bioma, 
  COUNT(id_foco) AS total_focos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`
WHERE 
  EXTRACT(YEAR FROM data_hora) = 2022
GROUP BY 
  bioma
ORDER BY 
  total_focos DESC
LIMIT 1;

--Quantos Estados e anos tem? (Coloque de forma que Estados e Anos não se repita)
SELECT -- Exercicio 4
  COUNT(DISTINCT sigla_uf) AS total_estados,
  COUNT(DISTINCT EXTRACT(YEAR FROM data_hora)) AS total_anos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`;


--Qual foi a média de focos de queimadas por estado no Brasil em 2020
SELECT -- Exercicio 5
  AVG(focos_por_estado) AS media_focos_por_estado
FROM (
  SELECT 
    sigla_uf, 
    COUNT(id_foco) AS focos_por_estado
  FROM 
    `basedosdados.br_inpe_queimadas.microdados`
  WHERE 
    EXTRACT(YEAR FROM data_hora) = 2020
  GROUP BY 
    sigla_uf
);

--Qual município teve mais focos de queimadas em 2021 no estado do Mata Atlântica?
SELECT -- Exercicio 6
  id_municipio, 
  COUNT(id_foco) AS total_focos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`
WHERE 
  EXTRACT(YEAR FROM data_hora) = 2021
  AND bioma = 'Mata Atlântica'
GROUP BY 
  id_municipio
ORDER BY 
  total_focos DESC
LIMIT 1;

--Qual a evolução anual do número de queimadas no Cerrado entre 2015 e 2023?

SELECT -- Exercicio 7
  EXTRACT(YEAR FROM data_hora) AS ano, 
  COUNT(id_foco) AS total_focos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`
WHERE 
  bioma = 'Cerrado'
  AND EXTRACT(YEAR FROM data_hora) BETWEEN 2015 AND 2023
GROUP BY 
  ano
ORDER BY 
  ano;


--Quantos focos de queimadas foram registrados por bioma no ano de 2005 no banco de dados do INPE?
SELECT -- Exercicio 8
  bioma, 
  COUNT(id_foco) AS total_focos
FROM 
  `basedosdados.br_inpe_queimadas.microdados`
WHERE 
  EXTRACT(YEAR FROM data_hora) = 2005
GROUP BY 
  bioma
ORDER BY 
  total_focos DESC;