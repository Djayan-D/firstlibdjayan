#' Créer un objet de classe "departement"
#'
#' Cette fonction permet de vérifier si le `data.frame` contient les données d'un seul département. Si le `data.frame`
#' contient plusieurs départements, la fonction arrête l'exécution avec un message d'erreur. Si un seul département est présent,
#' elle ajoute la classe "departement" au `data.frame`.
#'
#' @param df Un `data.frame` contenant les données des départements, avec la colonne `Code.du.département` utilisée
#' pour vérifier si plusieurs départements sont présents dans le `data.frame`.
#' @return Un `data.frame` auquel la classe "departement" est ajoutée s'il contient un seul département.
#' @export

creer_departement <- function(df) {
  # Vérifier si le DataFrame est composé de plusieurs départements

  unique_departments <- df$Code.du.département |>
    unique() |>
    length()

  if (unique_departments > 1) {
    stop("Le DataFrame est composé de plusieurs départements.") # Arrête la fonction s'il y a plusieurs départements
  }


  # Ajouter au DataFrame la classe "departement" si elle est absente

  if (!inherits(df, "departement")) {
    class(df) <- c("departement", class(df)) # Ajoute la classe "departement" si elle n'est pas présente
  }

  return(df)
}
