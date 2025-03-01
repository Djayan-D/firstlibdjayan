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
    stop("⚠️ Erreur : Le DataFrame contient plusieurs communes.")
  }


  # Ajouter la classe "commune" si elle n'est pas déjà présente

  if (!inherits(df, "commune")) {
    class(df) <- c("commune", class(df))
    message("✅ Classe 'commune' ajoutée au DataFrame.")
  }


  # Retourner le DataFrame avec la classe "commune" en plus

  return(df)
}
