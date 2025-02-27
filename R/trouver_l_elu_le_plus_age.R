#' Trouve l'élu le plus âgé
#'
#' Cette fonction identifie l'élu le plus âgé en triant les dates de naissance et en sélectionnant
#' l'élu ayant la date de naissance la plus ancienne. Elle retourne son nom, prénom et âge en années.
#'
#' @param df Un `data.frame` contenant les informations des élus, avec les colonnes suivantes :
#'   - `Nom.de.l.élu` : Nom de l'élu.
#'   - `Prénom.de.l.élu` : Prénom de l'élu.
#'   - `Date.de.naissance` : Date de naissance de l'élu (au format Date).
#'
#' @return Une liste contenant :
#'   - `nom` : Nom de l'élu le plus âgé.
#'   - `prénom` : Prénom de l'élu le plus âgé.
#'   - `age` : Âge en années.
#'
#' @importFrom dplyr arrange slice_head
#' @importFrom lubridate today interval time_length
#'
#' @examples
#' df_exemple <- data.frame(
#'   Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
#'   Prénom.de.l.élu = c("Jean", "Sophie", "Paul"),
#'   Date.de.naissance = as.Date(c("1950-03-25", "1982-07-12", "1945-06-08"))
#' )
#'
#' trouver_l_elu_le_plus_age(df_exemple)
#' # Résultat attendu : Liste avec l'élu le plus âgé (Durand Paul 79 ans au 27/02/2025)
#'
#' @noRd


trouver_l_elu_le_plus_age <- function(df) {
  # Vérifier la présence des colonnes requises

  required_cols <- c("Nom.de.l.élu", "Prénom.de.l.élu", "Date.de.naissance")

  if (!all(required_cols %in% colnames(df))) {
    stop("❌ Le data.frame doit contenir les colonnes : ", paste(required_cols, collapse = ", "))
  }

  if (!inherits(df$Date.de.naissance, "Date")) {
    stop("❌ La colonne 'Date.de.naissance' doit être au format Date.")
  }


  # Trouver l'élu le plus âgé

  elu_le_plus_age <- df |>
    arrange(Date.de.naissance) |> # Trie par date de naissance (ascendant)
    slice_head(n = 1) # Sélectionne la première ligne (l'élu le plus âgé)


  # Calculer l'âge en années

  age <- time_length(interval(elu_le_plus_age$Date.de.naissance, today()), "years")


  # Retourner les informations sous forme de liste

  return(list(
    nom = elu_le_plus_age$Nom.de.l.élu,
    prénom = elu_le_plus_age$Prénom.de.l.élu,
    age = floor(age) # Arrondi à l'année complète
  ))
}
