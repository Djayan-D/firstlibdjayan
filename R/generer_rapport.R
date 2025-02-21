#' Générer un rapport à partir d'un fichier Quarto
#'
#' Cette fonction génère un rapport au format PDF à partir d'un fichier Quarto (.qmd) en utilisant les paramètres de la commune et du département fournis.
#'
#' @param commune Le code (ex : INSEE) associé à la commune pour laquelle le rapport sera généré.
#' @param departement Le code (ex : INSEE) associé au département pour lequel le rapport sera généré.
#' @param output Un caractère spécifiant le chemin du fichier de sortie (par exemple, "rapport_nantes.html").
#'
#' @return Aucun. La fonction génère un fichier de rapport au format spécifié (par défaut html).
#'
#' @import quarto
#' @export
#'
#' @examples
#' generer_rapport(44109, 44, "rapport_Nantes_et_Loire_Atlantique.html")

generer_rapport <- function(commune, departement, output, df = elus_sample) {
  # Déterminer le chemin du fichier Quarto

  qmd_path <- system.file("rapport.qmd", package = "firstlibdjayan")


  # Vérifier si df est "elus_sample"

  if (identical(df, elus_sample)) {
    dataframe_param <- "elus_sample"  # Nom directement pour Quarto
  } else {
    save(df, file = "data/temp_dataframe.RData")  # Sauvegarde temporaire
    dataframe_param <- "temp_dataframe.RData"
  }


  # Exécuter le rendu du rapport avec Quarto

  quarto::quarto_render(
    input = qmd_path,
    output_format = "html",
    output_file = output,
    execute_params = list(
      code_commune = commune,
      code_departement = departement,
      dataframe_path = dataframe_param
    )
  )


  # Supprimer le fichier temporaire après le rendu

  if (!identical(df, elus_sample)) {
    file.remove("data/temp_dataframe.RData")
  }

  message("Le rapport a été généré avec succès.")
}



