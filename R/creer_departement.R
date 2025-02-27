#' Créer un objet de classe "departement"
#'
#' Cette fonction vérifie si le `data.frame` contient les données d'un seul département. Si plusieurs départements sont détectés,
#' elle arrête l'exécution avec un message d'erreur. Sinon, elle ajoute la classe "departement" au `data.frame`.
#'
#' @param df Un `data.frame` contenant les données des départements, avec la colonne `Code.du.département` utilisée
#' pour vérifier si plusieurs départements sont présents.
#' @return Un `data.frame` auquel la classe "departement" est ajoutée s'il contient un seul département.
#' @export

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
    stop("⚠️ Erreur : Le DataFrame contient plusieurs départements.")
  }

  # Ajouter la classe "departement" si elle n'est pas déjà présente
  if (!inherits(df, "departement")) {
    class(df) <- c("departement", class(df))
    message("✅ Classe 'departement' ajoutée au DataFrame.")
  }


  # Retourner le DataFrame avec la classe "commune" en plus

  return(df)
}
