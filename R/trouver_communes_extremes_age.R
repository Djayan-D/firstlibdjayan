#' Trouver les communes avec les âges extrêmes
#'
#' Cette fonction permet d'identifier les communes ayant la moyenne d'âge la plus faible et la plus élevée parmi les élus.
#' Elle calcule la moyenne d'âge pour chaque commune, puis retourne une liste contenant les informations suivantes pour
#' les communes avec les âges les plus jeunes et les plus âgés :
#' - Le nom de la commune,
#' - La distribution des âges des élus.
#'
#' @param df Un `data.frame` contenant les informations des élus, avec la colonne `Date.de.naissance` utilisée pour calculer
#' la moyenne d'âge par commune.
#' @return Une liste contenant deux sous-listes :
#' - `commune_plus_jeune` : La commune avec la moyenne d'âge la plus faible, incluant sa distribution d'âges,
#' - `commune_plus_agee` : La commune avec la moyenne d'âge la plus élevée, incluant sa distribution d'âges.
#' @importFrom dplyr group_by mutate slice_min slice_max ungroup filter
#' @importFrom lubridate today interval
#' @export

trouver_communes_extremes_age <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Calculer la moyenne d'âge par commune

  moyenne_age_commune <- df |>
    group_by(Libellé.de.la.commune) |>
    mutate(moyenne_age = mean(as.period(interval(Date.de.naissance, today()),
                                        unit = "years"
    )$year, na.rm = TRUE)) |>
    distinct(Libellé.de.la.commune, moyenne_age) |> # Garde une seule ligne par commune
    ungroup()


  # Trouver les communes avec la moyenne d'âge la plus faible et la plus élevée

  commune_plus_jeune <- moyenne_age_commune |>
    slice_min(moyenne_age, n = 1) |>
    pull(Libellé.de.la.commune)

  commune_plus_agee <- moyenne_age_commune |>
    slice_max(moyenne_age, n = 1) |>
    pull(Libellé.de.la.commune)


  # Calculer la distribution des âges des deux communes

  distribution_plus_jeune <- df |>
    filter(Libellé.de.la.commune == commune_plus_jeune) |>
    calcul_distribution_age()

  distribution_plus_agee <- df |>
    filter(Libellé.de.la.commune == commune_plus_agee) |>
    calcul_distribution_age()


  # Retourner une liste contenant les informations des deux communes

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
