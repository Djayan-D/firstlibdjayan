#' Trouve les communes avec les âges extrêmes
#'
#' Cette fonction identifie les communes ayant la moyenne d'âge la plus faible et la plus élevée parmi les élus.
#' Elle calcule la moyenne d'âge pour chaque commune et retourne une liste contenant les informations suivantes :
#' \itemize{
#'   \item `commune_plus_jeune` : La commune avec la moyenne d'âge la plus faible, incluant sa distribution d'âges.
#'   \item `commune_plus_agee` : La commune avec la moyenne d'âge la plus élevée, incluant sa distribution d'âges.
#' }
#'
#' @param df Un `data.frame` contenant les informations des élus, avec les colonnes suivantes :
#'   - `Libellé.de.la.commune` : Nom de la commune.
#'   - `Date.de.naissance` : Date de naissance des élus (au format Date).
#'
#' @return Une liste avec les communes ayant les âges extrêmes et leur distribution d'âges.
#'
#' @importFrom dplyr group_by summarise slice_min slice_max ungroup filter
#' @importFrom lubridate today interval time_length
#'
#' @examples
#' col_exemple <- data.frame(
#'   Libellé.de.la.commune = c("Commune A", "Commune A", "Commune B", "Commune B", "Commune C"),
#'   Date.de.naissance = as.Date(c("1960-05-14", "1985-09-23", "1990-12-10", "2000-07-05", "1975-03-30"))
#' )
#'
#' trouver_communes_extremes_age(col_exemple)
#' # Résultat attendu : Liste avec les communes les plus jeunes et les plus âgées
#'
#' @noRd


trouver_communes_extremes_age <- function(df) {
  # Vérifier la présence des colonnes requises

  required_cols <- c("Libellé.de.la.commune", "Date.de.naissance")

  if (!all(required_cols %in% colnames(df))) {
    stop("❌ Le data.frame doit contenir les colonnes : ", paste(required_cols, collapse = ", "))
  }

  if (!inherits(df$Date.de.naissance, "Date")) {
    stop("❌ La colonne 'Date.de.naissance' doit être au format Date.")
  }


  # Calculer la moyenne d'âge par commune

  moyenne_age_commune <- df |>
    group_by(Libellé.de.la.commune) |>
    summarise(moyenne_age = mean(time_length(interval(Date.de.naissance, today()), "years"), na.rm = TRUE)) |>
    ungroup()


  # Trouver la commune avec la moyenne d'âge la plus faible et la plus élevée

  commune_plus_jeune <- moyenne_age_commune |>
    slice_min(moyenne_age, n = 1, with_ties = FALSE) |>
    pull(Libellé.de.la.commune)

  commune_plus_agee <- moyenne_age_commune |>
    slice_max(moyenne_age, n = 1, with_ties = FALSE) |>
    pull(Libellé.de.la.commune)


  # Calculer la distribution des âges pour ces communes

  distribution_plus_jeune <- df |>
    filter(Libellé.de.la.commune == commune_plus_jeune) |>
    calcul_distribution_age()

  distribution_plus_agee <- df |>
    filter(Libellé.de.la.commune == commune_plus_agee) |>
    calcul_distribution_age()


  # Retourner la liste des résultats

  return(list(
    commune_plus_jeune = list(
      nom = commune_plus_jeune,
      distribution_ages = distribution_plus_jeune
    ),
    commune_plus_agee = list(
      nom = commune_plus_agee,
      distribution_ages = distribution_plus_agee
    )
  ))
}
