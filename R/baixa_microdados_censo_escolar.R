#' Baixa Microdados do Censo Escolar
#'
#' Esta função baixa os microdados do censo escolar para um ano especificado e descompacta os arquivos na pasta `data/raw/`.
#'
#' @param ano O ano para o qual os microdados do censo escolar serão baixados. O padrão é 2023.
#' @return Nenhum retorno explícito. Os arquivos são baixados e descompactados na pasta `data/raw/`.
#' @export
#'
#' @examples
#' baixa_microdados_censo_escolar(2023)
baixa_microdados_censo_escolar <- function(ano = 2023){
  # constroi url
  url <- paste0("https://download.inep.gov.br/dados_abertos/microdados_censo_escolar_",
                ano,
                ".zip")

  # Checa se a pasta data/raw/ existe, se não, cria
  if (!dir.exists("data/raw/")) {
    dir.create("data/raw/", recursive = TRUE)
  }

  # Cria o arquivo de destino do download
  destfile <- paste0("data/raw/microdados_censo_escolar_", ano, ".zip")

  # Baixa o arquivo
  download.file(url, destfile = destfile, mode = "wb")

  # Faz o unzip do arquivo no destino
  archive::archive_extract(destfile, dir = "data/raw/")
}
