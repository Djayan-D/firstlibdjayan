#' Trouver l'élu le plus âgé
#'
#' Cette fonction permet de trouver l'élu le plus âgé dans un `data.frame`. Elle trie les élus par
#' date de naissance et sélectionne l'élu ayant la date de naissance la plus ancienne. L'âge de l'élu
#' est ensuite calculé en années.
#'
#' @param df Un `data.frame` contenant les données des élus, avec les colonnes `Nom.de.l.élu`,
#' `Prénom.de.l.élu` et `Date.de.naissance` nécessaires pour déterminer l'élu le plus âgé.
#' @return Une liste contenant les informations suivantes sur l'élu le plus âgé :
#' - `nom` : Le nom de l'élu
#' - `prénom` : Le prénom de l'élu
#' - `age` : L'âge de l'élu en années
#' @importFrom dplyr arrange slice_head mutate
#' @importFrom lubridate interval today as.period
#' @export

trouver_l_elu_le_plus_age <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Extraire l'individu le plus âgé

  elu_le_plus_age <- df |>
    arrange(Date.de.naissance) |> # Trie par date de naissance (ascendant)
    slice_head(n = 1) |> # Sélectionne la première ligne (l'élu le plus âgé)
    mutate(age = as.period(interval(Date.de.naissance, today()), # Calculer l'âge de l'élu en années
                           unit = "years"
    )$year) # Convertit l'intervalle en années


  # Créer la liste avec les informations de l'élu le plus âgé

  elu_info <- list(
    nom = elu_le_plus_age$Nom.de.l.élu,
    prénom = elu_le_plus_age$Prénom.de.l.élu,
    age = elu_le_plus_age$age
  )
}
