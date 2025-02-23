#' Générer un rapport à partir d'un fichier Quarto
#'
#' Cette fonction génère un rapport au format PDF à partir d'un fichier Quarto (.qmd) en utilisant les paramètres de la commune et du département fournis.
#'
#' @param commune Le code (ex : INSEE) associé à la commune pour laquelle le rapport sera généré.
#' @param departement Le code (ex : INSEE) associé au département pour lequel le rapport sera généré.
<<<<<<< HEAD
#' @param output Un caractère spécifiant le chemin du fichier de sortie (par exemple, "rapport_nantes.html").
#'
#' @return Aucun. La fonction génère un fichier de rapport au format spécifié (par défaut html).
=======
#' @param output Un caractère spécifiant le chemin du fichier de sortie (par exemple, "rapport_nantes.pdf").
#'
#' @return Aucun. La fonction génère un fichier de rapport au format spécifié (par défaut PDF).
>>>>>>> gh-pages
#'
#' @import quarto
#' @export
#'
#' @examples
<<<<<<< HEAD
#' generer_rapport(44109, 44, "rapport_Nantes_et_Loire_Atlantique.html")

generer_rapport <- function(commune, departement, output, df = elus_sample) {
  # Vérifier si df est un dataframe

  if (!is.data.frame(df)) {
    stop("Le paramètre 'df' doit être un dataframe.")
  }


  # Vérifier si df est identique à elus_sample

  if (identical(df, elus_sample)) {
    df_name <- "elus_sample"
    # Si c'est elus_sample, on suppose qu'il est déjà accessible dans le package
    save_path <- file.path("data", "elus_sample.rds")
  } else {
    df_name <- deparse(substitute(df))
    # Utiliser tempdir() pour un fichier temporaire accessible lors du rendu
    save_path <- file.path(tempdir(), paste0("temp_", df_name, ".rds"))
    saveRDS(df, file = save_path)
  }





  # Déterminer le chemin du fichier Quarto
=======
#' generer_rapport(44109, 44, "rapport_Nantes_et_Loire_Atlantique.pdf")

generer_rapport <- function(commune, departement, output) {
  # Localiser le fichier .qmd dans le dossier inst
>>>>>>> gh-pages

  qmd_path <- system.file("rapport.qmd", package = "firstlibdjayan")


<<<<<<< HEAD
  # Exécuter le rendu du rapport avec Quarto

  quarto::quarto_render(
    input = qmd_path,
    output_format = "html",
    output_file = output,
    execute_params = list(
      code_commune = commune,
      code_departement = departement,
      dataframe_name = df_name,
      dataframe_path = save_path
    )
  )
=======
  # Générer le rapport à l'aide de Quarto
  quarto::quarto_render(input = qmd_path,
                        output_format = "html",
                        output_file = output,
                        execute_params = list(code_commune = commune,
                                              code_departement = departement))


  # Renvoyer un message pour confirmer la génération
>>>>>>> gh-pages

  message("Le rapport a été généré avec succès.")
}

<<<<<<< HEAD


=======
>>>>>>> gh-pages
