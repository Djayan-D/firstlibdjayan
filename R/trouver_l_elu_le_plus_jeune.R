#' Trouver l'élu le plus jeune
#'
#' Cette fonction permet d'extraire les informations de l'élu le plus jeune d'un `data.frame`. L'élu le plus jeune est
#' identifié en fonction de sa date de naissance la plus récente. La fonction retourne un résumé des informations de cet élu,
#' incluant son nom, prénom et son âge calculé en années.
#'
#' @param df Un `data.frame` contenant les informations des élus, avec la colonne `Date.de.naissance` utilisée pour
#' identifier l'élu le plus jeune.
#' @return Une liste contenant :
#' - `nom` : Le nom de l'élu le plus jeune,
#' - `prénom` : Le prénom de l'élu le plus jeune,
#' - `age` : L'âge de l'élu le plus jeune en années.
#' @importFrom dplyr arrange slice_tail mutate
#' @importFrom lubridate today interval
#' @export

trouver_l_elu_le_plus_jeune <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Extraire l'individu le plus jeune

  elu_le_plus_jeune <- df |>
    arrange(Date.de.naissance) |> # Trie par date de naissance (ascendant)
    slice_tail(n = 1) |> # Sélectionne la dernière ligne (l'élu le plus jeune)
    mutate(age = as.period(interval(Date.de.naissance, today()), # Calculer l'âge de l'élu en années
                           unit = "years"
    )$year) # Convertit l'intervalle en années


  # Créer la liste avec les informations de l'élu le plus jeune

  elu_info <- list(
    nom = elu_le_plus_jeune$Nom.de.l.élu,
    prénom = elu_le_plus_jeune$Prénom.de.l.élu,
    age = elu_le_plus_jeune$age
  )


  # Retourner les informations

  return(elu_info)
}
