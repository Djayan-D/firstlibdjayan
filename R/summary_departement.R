#' Résumé des informations d'un département
#'
#' Cette fonction génère un résumé des informations pour un département donné. Elle retourne une liste contenant des statistiques
#' sur le département, notamment le nombre de communes, le nombre d'élus, la distribution des âges des élus, ainsi que des informations
#' sur les élus les plus âgés et les plus jeunes, ainsi que les communes les plus jeunes et les plus âgées.
#'
#' @param x Un objet de classe `departement` (un `data.frame` contenant les informations des élus et des communes).
#'
#' @return Une liste contenant plusieurs éléments :
#' - `nom_departement` : Le nom du département,
#' - `nombre_communes` : Le nombre de communes dans le département,
#' - `nombre_elus` : Le nombre d'élus dans le département,
#' - `distribution_age_elus` : La distribution des âges des élus dans le département,
#' - `elu_plus_age` : Le nom et l'âge de l'élu le plus âgé,
#' - `elu_plus_jeune` : Le nom et l'âge de l'élu le plus jeune,
#' - `commune_plus_jeune` : La commune avec la moyenne d'âge la plus faible,
#' - `commune_plus_agee` : La commune avec la moyenne d'âge la plus élevée.
#'
#' @importFrom lubridate today
#'
#' @export


summary.departement <- function(x) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(x)


  # Vérifier que l'objet x est bien de la classe "departement"

  if (!inherits(x, "departement")) {
    stop("L'objet doit être de classe 'departement'")
  }


  # Créer la liste des informations du département

  info_departement <- list(
    nom_departement = unique(x$Libellé.du.département),
    nombre_communes = length(unique(x$Code.de.la.commune)),
    nombre_elus = compter_nombre_d_elus(x),
    distribution_age_elus = calcul_distribution_age(x),
    elu_plus_age = trouver_l_elu_le_plus_age(x)[c("nom", "age")], # Sans le prénom (consigne)
    elu_plus_jeune = trouver_l_elu_le_plus_jeune(x)[c("nom", "age")], # Sans le prénom (consigne)
    commune_plus_jeune = trouver_communes_extremes_age(x)$commune_plus_jeune,
    commune_plus_agee = trouver_communes_extremes_age(x)$commune_plus_agee
  )


  # Retourner les informations

  return(info_departement)
}
