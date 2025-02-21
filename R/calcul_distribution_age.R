#' Calculer la distribution des âges des élus
#'
#' Cette fonction permet de calculer la distribution des âges des élus à partir de leur date de naissance.
#' Elle retourne les quantiles (0%, 25%, 50%, 75%, 100%) des âges calculés en années.
#'
#' @param df Un `data.frame` contenant les données des élus, avec la colonne `Date.de.naissance` utilisée
#' pour calculer l'âge de chaque élu.
#' @return Une liste contenant les quantiles des âges des élus :
#' - `Q0` : 0% (minimum)
#' - `Q25` : 25% (premier quartile)
#' - `Q50` : 50% (médiane)
#' - `Q75` : 75% (troisième quartile)
#' - `Q100` : 100% (maximum)
#' @importFrom lubridate interval today as.period

calcul_distribution_age <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Calculer les âges en années

  ages <- as.period(interval(df$Date.de.naissance, today()),
                    unit = "years"
  )$year


  # Calculer les quantiles

  quantiles <- quantile(ages, probs = c(0, 0.25, 0.5, 0.75, 1)) |>
    as.vector()


  # Créer la liste des quantiles

  distribution_ages <- list(
    Q0 = quantiles[1],
    Q25 = quantiles[2],
    Q50 = quantiles[3],
    Q75 = quantiles[4],
    Q100 = quantiles[5]
  )


  # Retourner les quantiles

  return(distribution_ages)
}
