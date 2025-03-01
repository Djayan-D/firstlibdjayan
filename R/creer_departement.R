#' Créer un objet de classe \code{departement}
#'
#' Cette fonction vérifie si le \code{data.frame} contient les données d'un seul département. Si plusieurs départements sont détectés,
#' elle arrête l'exécution avec un message d'erreur. Sinon, elle ajoute la classe \code{departement} au \code{data.frame}.
#'
#' @param df Un \code{data.frame} contenant les données des départements, avec la colonne \code{Code.du.département} utilisée
#' pour vérifier si plusieurs départements sont présents.
#'
#' @return Un \code{data.frame} auquel la classe \code{departement} est ajoutée s'il contient un seul département.
#'
#' @export
#'
#' @examples
#' Exemple de données pour un département
#'
#' df_departement <- data.frame(Code.du.département = c(44,44))
#' df_departement <- creer_departement(df_departement)
#' class(df_departement)  # Doit afficher "departement" comme classe ajoutée
#'
#' @seealso
#' \itemize{
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
#'   \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
#'   }
"creer_departement"


creer_departement <- function(df) {
  # Vérifier la structure du DataFrame

  validate_schema(df)


  # Vérifier la présence de la colonne "Code.du.département"

  stopifnot("Code.du.département" %in% colnames(df))


  # Vérifier le nombre unique de départements

  unique_departments <- df$Code.du.département |>
    unique() |>
    length()

  if (unique_departments > 1) {
    stop("❌ Erreur : Le DataFrame contient plusieurs départements.")
  }


  # Ajouter la classe "departement" si elle n'est pas déjà présente

  if (!inherits(df, "departement")) {
    class(df) <- c("departement", class(df))
    message("✅ Classe 'departement' ajoutée au DataFrame.")
  }


  # Retourner le DataFrame avec la classe "commune" en plus

  return(df)
}
