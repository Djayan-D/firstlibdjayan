#' Créer un objet de classe "commune"
#'
#' Cette fonction permet de vérifier si le `data.frame` contient les données d'une seule commune. Si le `data.frame`
#' contient plusieurs communes, la fonction arrête l'exécution avec un message d'erreur. Si une seule commune est présente,
#' elle ajoute la classe "commune" au `data.frame`.
#'
#' @param df Un `data.frame` contenant les données des communes, avec la colonne `Code.de.la.commune` utilisée
#' pour vérifier si plusieurs communes sont présentes dans le `data.frame`.
#' @return Un `data.frame` auquel la classe "commune" est ajoutée s'il contient une seule commune.
#' @throws Error si le `data.frame` contient plusieurs communes (c'est-à-dire plusieurs valeurs distinctes pour `Code.de.la.commune`).
#' @export

creer_commune <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Vérifier si le DataFrame est composé de plusieurs communes

  unique_communes_code <- df$Code.de.la.commune |> # Vérifie grâce au code : plusieurs communes peuvent avoir le même libellé (ex : Saint-Pierre)
    unique() |>
    length()

  if (unique_communes_code > 1) {
    stop("Le DataFrame est composé de plusieurs communes") # Arrête la fonction s'il y a plusieurs communes
  }


  # Ajouter la classe "commune" au df si elle n'est pas présente

  if (!inherits(df, "commune")) {
    class(df) <- c("commune", class(df))
  }


  # Retourner le DataFrame avec la nouvelle classe

  return(df)
}
