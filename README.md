# Projeto de Análise de Dados - COVID-19 - FIAP

Este repositório contém o desenvolvimento de um projeto de **Análise de Dados** solicitado por um grande hospital, com o objetivo de compreender o comportamento da população durante a pandemia da COVID-19 e identificar indicadores relevantes para o planejamento em caso de novos surtos.

---

## Objetivos
- Realizar uma análise exploratória dos dados.
- Descrever a estrutura e organização do banco de dados.
- Apresentar as perguntas selecionadas pela equipe para responder ao problema.
- Identificar ações estratégicas que o hospital deverá adotar em caso de um novo surto.

---

## Pré-requisitos
- Base de dados: **PNAD-COVID19**
- Análise das características clínicas, populacionais e socioeconômicas.
- Utilização de no máximo **20 questões** da pesquisa.
- Prazo mínimo de **3 meses** para construção da solução.

---

## Tecnologias Utilizadas

| Tecnologia             | Finalidade                                   |
|------------------------|-----------------------------------------------|
| SQL                    | Consultas e manipulação de dados              |
| AWS Glue ETL           | Processamento e transformação de dados        |
| AWS Athena             | Execução de queries sobre dados no S3         |
| AWS S3                 | Armazenamento de dados                       |
| AWS Glue Data Catalog  | Catálogo e metadados dos datasets             |
| Iceberg                | Formato de tabela para dados analíticos       |
| Python                 | Desenvolvimento e análise                     |
| Pandas                 | Manipulação e análise de dados                |
| Jupyter Notebook       | Ambiente de desenvolvimento e documentação    |

---

## Passos Realizados

### 1. Exploração dos Dados
Consulta e navegação pelos dados disponibilizados pelo IBGE sobre a COVID-19:  
[PNAD COVID-19 - IBGE](https://www.ibge.gov.br/estatisticas/investigacoes-experimentais/estatisticas-experimentais/27946-divulgacao-semanal-pnadcovid1?t=downloads&utm_source=covid19&utm_medium=hotsite&utm_campaign=covid_19)

### 2. Consultas SQL e Extração de Insights
- Utilização do **Athena** para acessar os dados armazenados via Iceberg.  
- Consultas SQL disponíveis na pasta **Query SQL**.  
- Resultados exportados em planilhas na pasta **csv**.  

### 3. Desenvolvimento e Análise
- Importação dos dados para o ambiente **Jupyter Notebook**.  
- Documentação do estudo no arquivo **desenvolvimento_do_analise.ipynb**.  

---

## Estrutura do Repositório

├── Query SQL/                # Consultas SQL utilizadas
├── csv/                      # Planilhas extraídas
├── notebooks/                # Notebooks de análise
│   └── desenvolvimento_do_analise.ipynb
└── README.md                 # Documentação do projeto

## Equipe
- **Analistas de Dados**: Alex, Cibele, José Peroto e Victor