#' Créer un objet de classe "commune"
#'
#' Cette fonction vérifie si le `data.frame` contient les données d'une seule commune. Si plusieurs communes sont détectées,
#' elle arrête l'exécution avec un message d'erreur. Sinon, elle ajoute la classe "commune" au `data.frame`.
#'
#' @param df Un `data.frame` contenant les données des communes, avec la colonne `Code.de.la.commune` utilisée
#' pour vérifier si plusieurs communes sont présentes.
#'
#' @return Un `data.frame` auquel la classe "commune" est ajoutée s'il contient une seule commune.
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
