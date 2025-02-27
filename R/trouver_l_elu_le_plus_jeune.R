#' Trouver l'élu le plus jeune
#'
#' Cette fonction extrait les informations de l'élu le plus jeune d'un `data.frame`, en identifiant
#' l'élu ayant la date de naissance la plus récente. Elle retourne un résumé des informations
#' incluant son nom, prénom et âge en années.
#'
#' @param df Un `data.frame` contenant les colonnes suivantes :
#'   - `Nom.de.l.élu` : Nom de l'élu.
#'   - `Prénom.de.l.élu` : Prénom de l'élu.
#'   - `Date.de.naissance` : Date de naissance de l'élu (format Date).
#'
#' @return Une liste contenant :
#'   - `nom` : Le nom de l'élu le plus jeune.
#'   - `prénom` : Le prénom de l'élu le plus jeune.
#'   - `age` : L'âge de l'élu le plus jeune en années.
#'
#' @importFrom dplyr arrange slice_max mutate
#' @importFrom lubridate today interval as.period
#'
#' @noRd


trouver_l_elu_le_plus_jeune <- function(df) {
  # Vérifier la présence des colonnes requises

  required_cols <- c("Nom.de.l.élu", "Prénom.de.l.élu", "Date.de.naissance")

  if (!all(required_cols %in% colnames(df))) {
    stop("❌ Le data.frame doit contenir les colonnes : ", paste(required_cols, collapse = ", "))
  }


  # Vérifier que la colonne Date.de.naissance est au format Date

  if (!inherits(df$Date.de.naissance, "Date")) {
    stop("❌ La colonne 'Date.de.naissance' doit être au format Date.")
  }


  # Extraire l'individu le plus jeune

  elu_le_plus_jeune <- df |>
    slice_max(Date.de.naissance, n = 1) |> # Sélectionne l'élu avec la date de naissance la plus récente
    mutate(age = floor(as.period(interval(Date.de.naissance, today()), unit = "years")$year)) # Calcule l'âge arrondi


  # Retourner les informations sous forme de liste

  return(list(
    nom = elu_le_plus_jeune$Nom.de.l.élu,
    prénom = elu_le_plus_jeune$Prénom.de.l.élu,
    age = elu_le_plus_jeune$age
  ))
}
