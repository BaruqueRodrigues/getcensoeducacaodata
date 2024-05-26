#' Pega Matrículas de Educação Infantil por Município
#'
#' Esta função calcula a quantidade de matrículas de educação infantil por município a partir dos arquivos CSV na pasta `data/raw/`.
#'
#' @return Um data frame com a quantidade de matrículas de educação infantil por município.
#' @export
#'
#' @examples
#' pega_ed_infantil_municipio()
pega_ed_infantil_municipio <- function(
){

  # conta creches
  diretorio_csv <- list.files("data/raw/", full.names = TRUE) %>%
    stringr::str_subset("\\.zip$", negate = TRUE)


  diretorio_csv <- purrr::map(
    paste0(diretorio_csv, "/dados"),
    ~list.files(.x, full.names = TRUE, pattern= "ed_basica_\\d{4}\\.csv$")
  ) %>%
    unlist()

  tabela_educacao_mun <- purrr::map(diretorio_csv,
                                    ~readr::read_delim(.x, delim = ";", escape_double = FALSE, locale = readr::locale(encoding = "WINDOWS-1252"),
                                                       #col_select = c("in_inf", "no_uf", "no_municipio", "nu_ano_censo"),
                                                       trim_ws = TRUE) %>%
                                      janitor::clean_names() %>%
                                      dplyr::filter(in_inf == 1) %>%
                                      dplyr::count(no_uf,no_municipio, nu_ano_censo,name = "total_ed_infantil")
  ) %>%
    purrr::list_rbind()

  tabela_educacao_mun
}
