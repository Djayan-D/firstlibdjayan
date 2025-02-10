#' Compter le nombre d'adjoints dans un DataFrame
#'
#' Cette fonction permet de compter le nombre de lignes dans un `data.frame` où la fonction
#' de l'élu contient le mot "adjoint". Elle utilise la fonction `validate_schema` pour vérifier
#' que le `data.frame` respecte la structure minimale.
#'
#' @param df Un `data.frame` contenant les données des élus. Il doit inclure la colonne
#' `Libellé.de.la.fonction` qui sera utilisée pour rechercher le terme "adjoint".
#' @return Un entier représentant le nombre d'adjoints dans le `data.frame`.
#' @importFrom stringr str_detect
#' @export

compter_nombre_d_adjoints <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Appliquer les transformations

  nombre_adjoints <- df$Libellé.de.la.fonction |>
    str_detect("adjoint") |> # Détecte les cellules où la fonction contient le mot "adjoint"
    sum() # Compte le nombre total d'adjoints


  # Retourner le nombre d'adjoints

  return(nombre_adjoints)
}
