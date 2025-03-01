#' Générer un rapport à partir d'un fichier Quarto
#'
#' Cette fonction permet de générer un rapport au format HTML ou PDF
#' à partir d'un fichier Quarto (.qmd). Elle utilise les informations d'une commune et d'un département
#' fournis en paramètres, ainsi qu'un dataframe optionnel contenant des données pour enrichir le rapport.
#' @param commune Un entier ou une chaîne de caractères représentant le code INSEE de la commune concernée.
#' @param departement Un entier ou une chaîne de caractères représentant le code INSEE du département concerné.
#' @param output Une chaîne de caractères spécifiant le chemin et le nom du fichier de sortie.
#' Le format du fichier doit être précisé en ajoutant ".html" ou ".pdf" à la fin
#' (par exemple, "rapport_nantes.html" ou "rapport_nantes.pdf").
#' @param df (optionnel) Un dataframe contenant les données nécessaires pour générer le rapport.
#' Par défaut, la fonction utilise \code{elus_sample}, qui est inclus dans le package.
#'
#' @return Aucun. La fonction génère un fichier de rapport au format HTML ou PDF
#' dans le chemin spécifié par \code{output}.
#'
#' @details
#' \itemize{
#'  \item Si le dataframe utilisé est \code{elus_sample} ou qu'aucun n'est précisé,
#'   les codes commune et département doivent correspondre à ceux présents dans \code{elus_sample}.
#'
#'  \item Si un autre dataframe est utilisé, il doit respecter une structure minimale
#'   pour garantir le bon fonctionnement de la fonction. Voir les warnings en cas
#'   d'incompatibilité ou consulter la documentation
#'   sur \href{https://djayan-d.github.io/firstlibdjayan/articles/Structure_des_DataFrames_pour_l_analyse}{la page d'aide de création de DataFrame}.
#'
#'  \item La fonction utilise \code{quarto::quarto_render()} pour générer le rapport au format spécifié.
#'
#'  \item Le format conseillé est le format PDF du fait des images.
#'  }
#'
#' @import quarto
#' @import tinytex
#' @importFrom dplyr filter
#'
#' @export
#'
#' @examples
#' # Générer un rapport pour Nantes (44109) et la Loire-Atlantique (44) en HTML
#' generer_rapport(44109, 44, "rapport_Nantes_et_Loire_Atlantique.html")
#'
#' # Générer un rapport pour Nantes en PDF
#' generer_rapport(44109, 44, "rapport_Nantes_et_Loire_Atlantique.pdf")
#'
#' # Générer un rapport personnalisé en PDF
#' ## Définir le DataFrame
#' departement_data <- data.frame(
#'   Code.du.département = rep(99, 10),
#'   Libellé.du.département = rep("Mordor", 10),
#'   Code.de.la.commune = c(rep(99901,2), rep(99902,3), rep(99903,5)),
#'   Libellé.de.la.commune = c(rep("Gotham City",2), rep("Hogwarts",3), rep("Wakanda",5)),
#'   Nom.de.l.élu = c("DICAPRIO", "CHURCHILL", "LE GRIS", "JORDAN", "SARTRE",
#'                    "MESSI", "PAN", "BOND", "DE GAULLE", "CHANEL"),
#'   Prénom.de.l.élu = c("Leonardo", "Winston", "Gandalf", "Michael", "Jean-Paul",
#'                        "Lionel", "Peter", "James", "Charles", "Coco"),
#'   Date.de.naissance = as.Date(c("11/11/1974", "30/11/1874", "01/01/1000", "17/02/1963",
#'                                 "21/06/1905", "24/06/1987", "10/12/1990", "13/04/1962",
#'                                 "22/11/1890", "19/08/1883"),
#'                               format = "%d/%m/%Y"),
#'   Code.de.la.catégorie.socio.professionnelle = c(2, 1, 7, 3, 7, 2, 7, 7, 1, 2),
#'   Libellé.de.la.fonction = c("Maire", "1er adjoint au Maire", "", "2e adjoint au Maire",
#'                              "", "", "", "3e adjoint au Maire", "", "")
#' )
#'
#' ## Exécuter la fonction
#' generer_rapport(commune = 99901,
#'                 departement = 99,
#'                 df = departement_data,
#'                 output = "rapport_gotham_city_mordor.pdf")
#'
#'
#' # Voir la documentation pour la structure attendue du dataframe
#' # https://djayan-d.github.io/firstlibdjayan/


generer_rapport <- function(commune, departement, output, df = elus_sample) {
  # Vérifier si df est un dataframe

  validate_schema(df)


  # Enregistrer le données et récupérer leur nom et le chemin d'accès

  if (identical(df, elus_sample)) { # Si df identique à elus_sample alors récupérer directement depuis le package
    df_name <- "elus_sample"
    save_path <- file.path("data", "elus_sample.rds")
  } else { # Sinon enregistrer les données
    df_name <- deparse(substitute(df))
    # Utiliser tempdir() pour un fichier temporaire accessible lors du rendu
    save_path <- file.path(tempdir(), paste0("temp_", df_name, ".rds"))
    saveRDS(df, file = save_path)
  }


  # Déterminer le chemin du fichier Quarto

  qmd_path <- system.file("rapport.qmd", package = "firstlibdjayan")


  # Exécuter le rendu du rapport avec Quarto

  quarto::quarto_render(
    input = qmd_path,
    output_format = tools::file_ext(output),
    output_file = output,
    execute_params = list(
      code_commune = commune,
      code_departement = departement,
      dataframe_name = df_name,
      dataframe_path = save_path
    )
  )

  # Renvoyer un message après la génération

  message(paste0("✅ ", output, " a été généré avec succès."))

}
