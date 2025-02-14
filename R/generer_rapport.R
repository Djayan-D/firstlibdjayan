#' Générer un rapport à partir d'un fichier Quarto
#'
#' Cette fonction génère un rapport au format PDF à partir d'un fichier Quarto (.qmd) en utilisant les paramètres de la commune et du département fournis.
#'
#' @param commune Le code (ex : INSEE) associé à la commune pour laquelle le rapport sera généré.
#' @param departement Le code (ex : INSEE) associé au département pour lequel le rapport sera généré.
#' @param output Un caractère spécifiant le chemin du fichier de sortie (par exemple, "rapport_nantes.pdf").
#'
#' @return Aucun. La fonction génère un fichier de rapport au format spécifié (par défaut PDF).
#'
#' @import quarto
#' @export
#'
#' @examples
#' generer_rapport("44109", "Loire-44", "rapport_Nantes_et_Loire_Atlantique.pdf")

generer_rapport <- function(commune, departement, output) {
  # Localiser le fichier .qmd dans le dossier inst
  qmd_path <- system.file("rapport.qmd", package = "firstlibdjayan")

  # Générer le rapport à l'aide de Quarto
  quarto::quarto_render(input = qmd_path,
                        output_file = output,
                        params = list(code_commune = commune, code_departement = departement))

  # Renvoyer un message pour confirmer la génération
  message("Le rapport a été généré avec succès.")
}

