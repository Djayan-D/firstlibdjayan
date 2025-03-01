#' Résumé des informations d'une commune
#'
#' Cette fonction génère un résumé des informations pour une commune donnée. Elle vérifie que l'objet passé en argument est bien
#' de la classe \code{commune}, puis retourne une liste contenant :
#' - Le nom de la commune,
#' - Le nombre d'élus,
#' - La distribution des âges des élus,
#' - L'élu le plus âgé.
#'
#' @param x Un objet de classe \code{commune}, qui est un \code{data.frame} contenant les données des élus d'une commune.
#'
#' @return Une liste contenant :
#' - \code{nom_commune} : Le nom de la commune,
#' - \code{nombre_elus} : Le nombre d'élus dans la commune,
#' - \code{distribution_ages_elus} : Les quantiles de la distribution des âges des élus,
#' - \code{elu_plus_age} : Les informations de l'élu le plus âgé.
#'
#' @export


summary.commune <- function(x) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(x)


  # Vérifier que l'objet x est bien de la classe "commune"

  if (!inherits(x, "commune")) {
    stop("L'objet doit être de classe 'commune'")
  }


  # Créer la liste des informations de la commune

  info_commune <- list(
    nom_commune = unique(x$Libellé.de.la.commune),
    nombre_elus = compter_nombre_d_elus(x),
    distribution_ages_elus = calcul_distribution_age(x),
    elu_plus_age = trouver_l_elu_le_plus_age(x)
  )


  # Retourner les informations

  return(info_commune)
}
