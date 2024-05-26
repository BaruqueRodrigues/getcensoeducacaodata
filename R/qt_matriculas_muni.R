#' Quantidade de Matrículas por Município
#'
#' Esta função calcula a quantidade de matrículas por município a partir dos arquivos CSV na pasta `data/raw/`.
#'
#' @return Um data frame com a quantidade de matrículas por município.
#' @export
#'
#' @examples
#' qt_matriculas_muni()
qt_matriculas_muni <-  function(
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
                                                       # col_select = c("no_uf", "no_municipio",  "nu_ano_censo",
                                                       #                "qt_mat_inf", "qt_mat_inf_cre", "qt_mat_inf_pre",
                                                       #                "qt_mat_fund", "qt_mat_med"),
                                                       trim_ws = TRUE) %>%
                                      janitor::clean_names() %>%
                                      dplyr::summarise(
                                        .by = c(no_uf, no_municipio, nu_ano_censo),
                                        total_creches = sum(qt_mat_inf_cre, na.rm = TRUE),
                                        total_matriculas_pre_escola = sum(qt_mat_inf_pre, na.rm = TRUE),
                                        total_matriculas_ed_infantil = sum(qt_mat_inf, na.rm = TRUE),
                                        total_matriculas_fundamental = sum(qt_mat_fund, na.rm = TRUE),
                                        total_matriculas_medio = sum(qt_mat_med, na.rm = TRUE)
                                      )
  ) %>%
    purrr::list_rbind()

  tabela_educacao_mun


}
