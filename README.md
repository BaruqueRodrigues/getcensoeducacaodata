
<!-- README.md is generated from README.Rmd. Please edit that file -->

# getcensoeducacaodata

<!-- badges: start -->
<!-- badges: end -->

**Autor**: Baruque Rodrigues

## **Visão Geral**

O pacote **`getcensoeducacaodata`** foi desenvolvido para facilitar o
processo de download e análise dos dados do Censo Escolar no Brasil. Ele
permite baixar automaticamente os microdados do Censo Escolar e oferece
funções específicas para gerar análises detalhadas de diferentes níveis
de ensino e matrículas em municípios e bairros.

## **Funcionalidades**

### **Baixar Microdados do Censo Escolar**

A função **`baixa_microdados_censo_escolar`** permite que os usuários
baixem os microdados do Censo Escolar de forma automatizada,
economizando tempo e esforço.

### **Análises Específicas**

O pacote inclui várias funções para gerar análises específicas, tais
como:

- **`pega_creches_municipio`**: Coleta dados de creches por município.

- **`pega_ed_infantil_municipio`**: Coleta dados de educação infantil
  por município.

- **`pega_pre_escola_municipio`**: Coleta dados de pré-escola por
  município.

- **`pega_ensino_fundamental_municipio`**: Coleta dados de ensino
  fundamental por município.

- **`pega_ensino_medio_municipio`**: Coleta dados de ensino médio por
  município.

- **`qt_matriculas_muni`**: Obtém a quantidade de matrículas por
  município.

- **`qt_matriculas_mun_bairro`**: Obtém a quantidade de matrículas por
  município e bairro.

## **Instalação**

Para instalar o pacote, você pode usar o **`devtools`**:

``` r
# Instale o devtools se ainda não estiver instalado
install.packages("devtools")

# Instale o getcensoeducacaodata a partir do GitHub
devtools::install_github("BaruqueRodrigues/getcensoeducacaodata")
```

## **Uso**

Aqui estão alguns exemplos de como usar as funções do pacote:

``` r
library(getcensoeducacaodata)
```

### **Baixar Microdados do Censo Escolar**

``` r
# Baixa os microdados do Censo Escolar
baixa_microdados_censo_escolar(ano = 2023)
```

Para baixar múltiplos anos você pode usar o snippet abaixo

``` r
anos = 2012:2023

purrr::walk(anos, ~baixa_microdados_censo_escolar(ano = .x))
```

### **Coletar Dados de Creches por Município**

``` r
creches_data <- pega_creches_municipio()
#> Rows: 217625 Columns: 408
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ";"
#> chr  (16): NO_REGIAO, NO_UF, SG_UF, NO_MUNICIPIO, NO_REGIAO_GEOG_INTERM, NO_...
#> dbl (392): NU_ANO_CENSO, CO_REGIAO, CO_UF, CO_MUNICIPIO, CO_REGIAO_GEOG_INTE...
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

creches_data
#> # A tibble: 5,468 × 4
#>    no_uf no_municipio    nu_ano_censo total_creches
#>    <chr> <chr>                  <dbl>         <int>
#>  1 Acre  Acrelândia              2023             1
#>  2 Acre  Assis Brasil            2023             1
#>  3 Acre  Brasiléia               2023             4
#>  4 Acre  Bujari                  2023             1
#>  5 Acre  Capixaba                2023             9
#>  6 Acre  Cruzeiro do Sul         2023            27
#>  7 Acre  Epitaciolândia          2023             3
#>  8 Acre  Feijó                   2023             6
#>  9 Acre  Jordão                  2023             2
#> 10 Acre  Manoel Urbano           2023             1
#> # ℹ 5,458 more rows
```

Coletar Dados de Educação Infantil por Município

``` r
ed_infantil_data <- pega_ed_infantil_municipio()
#> Rows: 217625 Columns: 408
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ";"
#> chr  (16): NO_REGIAO, NO_UF, SG_UF, NO_MUNICIPIO, NO_REGIAO_GEOG_INTERM, NO_...
#> dbl (392): NU_ANO_CENSO, CO_REGIAO, CO_UF, CO_MUNICIPIO, CO_REGIAO_GEOG_INTE...
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

ed_infantil_data
#> # A tibble: 5,570 × 4
#>    no_uf no_municipio    nu_ano_censo total_ed_infantil
#>    <chr> <chr>                  <dbl>             <int>
#>  1 Acre  Acrelândia              2023                 4
#>  2 Acre  Assis Brasil            2023                21
#>  3 Acre  Brasiléia               2023                13
#>  4 Acre  Bujari                  2023                 9
#>  5 Acre  Capixaba                2023                 9
#>  6 Acre  Cruzeiro do Sul         2023                75
#>  7 Acre  Epitaciolândia          2023                11
#>  8 Acre  Feijó                   2023                54
#>  9 Acre  Jordão                  2023                36
#> 10 Acre  Manoel Urbano           2023                17
#> # ℹ 5,560 more rows
```

``` r
# Obtém a quantidade de matrículas por município
matriculas_data <- qt_matriculas_muni()
#> Rows: 217625 Columns: 408
#> ── Column specification ────────────────────────────────────────────────────────
#> Delimiter: ";"
#> chr  (16): NO_REGIAO, NO_UF, SG_UF, NO_MUNICIPIO, NO_REGIAO_GEOG_INTERM, NO_...
#> dbl (392): NU_ANO_CENSO, CO_REGIAO, CO_UF, CO_MUNICIPIO, CO_REGIAO_GEOG_INTE...
#> 
#> ℹ Use `spec()` to retrieve the full column specification for this data.
#> ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

matriculas_data
#> # A tibble: 5,570 × 8
#>    no_uf    no_municipio       nu_ano_censo total_creches total_matriculas_pre…¹
#>    <chr>    <chr>                     <dbl>         <dbl>                  <dbl>
#>  1 Rondônia Porto Velho                2023          4738                  12938
#>  2 Rondônia Presidente Médici          2023           214                    444
#>  3 Rondônia Alvorada D'Oeste           2023           217                    341
#>  4 Rondônia Nova Mamoré                2023           155                    908
#>  5 Rondônia Campo Novo de Ron…         2023            74                    326
#>  6 Rondônia Buritis                    2023           254                    828
#>  7 Rondônia Candeias do Jamari         2023           170                    827
#>  8 Rondônia Itapuã do Oeste            2023           129                    294
#>  9 Rondônia Costa Marques              2023           210                    452
#> 10 Rondônia São Francisco do …         2023           194                    497
#> # ℹ 5,560 more rows
#> # ℹ abbreviated name: ¹​total_matriculas_pre_escola
#> # ℹ 3 more variables: total_matriculas_ed_infantil <dbl>,
#> #   total_matriculas_fundamental <dbl>, total_matriculas_medio <dbl>
```
