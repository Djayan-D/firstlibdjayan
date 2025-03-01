#' Créer un objet de classe \code{commune}
#'
#' Cette fonction vérifie si le \code{data.frame} contient les données d'une seule commune. Si plusieurs communes sont détectées,
#' elle arrête l'exécution avec un message d'erreur. Sinon, elle ajoute la classe \code{commune} au \code{data.frame}.
#'
#' @param df Un \code{data.frame} contenant les données des communes, avec la colonne \code{Code.de.la.commune} utilisée
#' pour vérifier si plusieurs communes sont présentes.
#'
#' @return Un \code{data.frame} auquel la classe \code{commune} est ajoutée s'il contient une seule commune.
#'
#' @export
#'
#' @examples
#' # Exemple de données pour une commune
#'
#' df_commune <- data.frame(Code.de.la.commune = c(44109,44109))
#' df_commune <- creer_commune(df_commune)
#' class(df_commune)  # Doit afficher "commune" comme classe ajoutée
#'
#' @seealso
#' \itemize{
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
#'   \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
#'   }
"creer_commune"



creer_commune <- function(df) {
  # Vérifier la structure du DataFrame

  validate_schema(df)


  # Vérifier la présence de la colonne "Code.de.la.commune"

  stopifnot("Code.de.la.commune" %in% colnames(df))


  # Vérifier le nombre unique de codes commune

  unique_communes_code <- df$Code.de.la.commune |>
    unique() |>
    length()

  if (unique_communes_code > 1) {
    stop("❌ Erreur : Le DataFrame contient plusieurs communes.")
  }


  # Ajouter la classe "commune" si elle n'est pas déjà présente

  if (!inherits(df, "commune")) {
    class(df) <- c("commune", class(df))
    message("✅ Classe 'commune' ajoutée au DataFrame.")
  }


  # Retourner le DataFrame avec la classe "commune" en plus

  return(df)
}
