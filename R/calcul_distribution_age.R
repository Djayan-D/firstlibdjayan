#' Calcule la distribution des âges des élus
#'
#' Cette fonction détermine la distribution des âges des élus à partir de leur date de naissance.
#' Elle renvoie une liste contenant les quantiles (minimum, quartiles et maximum).
#'
#' @param df Un `data.frame` contenant les données des élus, avec une colonne `Date.de.naissance`
#'   devant être au format Date.
#'
#' @return Une liste des quantiles des âges :
#' \itemize{
#'   \item `Q0` : Âge minimum (0%)
#'   \item `Q25` : Premier quartile (25%)
#'   \item `Q50` : Médiane (50%)
#'   \item `Q75` : Troisième quartile (75%)
#'   \item `Q100` : Âge maximum (100%)
#' }
#'
#' @importFrom lubridate interval today time_length
#'
#' @examples
#' col_exemple <- data.frame(
#'   Date.de.naissance = as.Date(c("1960-05-14", "1985-09-23", "1990-12-10", "2000-07-05", "1975-03-30"))
#' )
#'
#' calcul_distribution_age(col_exemple)
#' # Résultat attendu : Liste avec les quantiles d'âge calculés
#'
#' @noRd



calcul_distribution_age <- function(df) {
  # Vérifier que la colonne Date.de.naissance existe et est au format Date (et NE PAS transformer sinon)

  if (!"Date.de.naissance" %in% colnames(df)) {
    stop("❌ Le dataframe doit contenir une colonne 'Date.de.naissance'.")
  }

  if (!inherits(df$Date.de.naissance, "Date")) {
    stop("❌ La colonne 'Date.de.naissance' doit être au format Date.")
  }


  # Calculer les âges en années

  ages <- time_length(interval(df$Date.de.naissance, today()), "years")


  # Calculer les quantiles

  quantiles <- quantile(ages, probs = c(0, 0.25, 0.5, 0.75, 1)) |> as.vector()


  # Retourner les quantiles sous forme de liste nommée

  return(list(
    Q0 = quantiles[1],
    Q25 = quantiles[2],
    Q50 = quantiles[3],
    Q75 = quantiles[4],
    Q100 = quantiles[5]
  ))
}
