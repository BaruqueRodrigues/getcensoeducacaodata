#' Quantidade de Matrículas por Município e Bairro
#'
#' Esta função calcula a quantidade de matrículas por município e bairro a partir dos arquivos CSV na pasta `data/raw/`.
#'
#' @return Um data frame com a quantidade de matrículas por município e bairro.
#' @export
#'
#' @examples
#' qt_matriculas_mun_bairro()
qt_matriculas_mun_bairro <-  function(
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
                                                         # col_select = c("no_uf", "no_municipio", "no_bairro", "nu_ano_censo",
                                                         #                "qt_mat_inf", "qt_mat_inf_cre", "qt_mat_inf_pre",
                                                         #                "qt_mat_fund", "qt_mat_med"),
                                                         trim_ws = TRUE) %>%
                                        janitor::clean_names() %>%
                                        dplyr::select(no_uf,no_municipio, no_bairro, nu_ano_censo,
                                               nu_ano_censo, qt_mat_inf, qt_mat_inf_cre,
                                               qt_mat_inf_pre, qt_mat_fund, qt_mat_med)
    ) %>%
      purrr::list_rbind()

    tabela_educacao_mun


  }
