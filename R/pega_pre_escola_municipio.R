#' Pega Matrículas de Pré-escola por Município
#'
#' Esta função calcula a quantidade de matrículas de pré-escola por município a partir dos arquivos CSV na pasta `data/raw/`.
#'
#' @return Um data frame com a quantidade de matrículas de pré-escola por município.
#' @export
#'
#' @examples
#' pega_pre_escola_municipio()
pega_pre_escola_municipio <- function(
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
                                                      # col_select = c("in_inf_pre", "no_uf", "no_municipio", "nu_ano_censo"),
                                                       trim_ws = TRUE) %>%
                                      janitor::clean_names() %>%
                                      dplyr::filter(in_inf_pre == 1) %>%
                                      dplyr::count(no_uf,no_municipio, nu_ano_censo,name = "total_pre_escola")
  ) %>%
    purrr::list_rbind()

  tabela_educacao_mun
}
