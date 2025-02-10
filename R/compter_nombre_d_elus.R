#' Compter le nombre d'élus dans un DataFrame
#'
#' Cette fonction permet de compter le nombre d'élus uniques dans un `data.frame` en fonction de leur
#' nom, prénom et date de naissance. Elle élimine les doublons pour ne compter qu'une seule fois
#' chaque élu, même s'il apparaît plusieurs fois dans le `data.frame`.
#'
#' @param df Un `data.frame` contenant les données des élus, avec les colonnes `Nom.de.l.élu`,
#' `Prénom.de.l.élu` et `Date.de.naissance` utilisées pour déterminer l'unicité de chaque élu.
#' @return Un entier représentant le nombre d'élus uniques dans le `data.frame`.
#' @importFrom dplyr select distinct

compter_nombre_d_elus <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Appliquer les transformations

  nombre_elus <- df |>
    select(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance) |> # Sélectionne les colonnes du triplet
    distinct() |> # Supprie les doublons
    nrow() # Compte le nombre d'élus


  # Retourner le nombre d'élus

  return(nombre_elus)
}
