#' Résumé des informations d'un département
#'
#' Cette fonction génère un résumé des informations pour un département donné.
#' Elle vérifie que l'objet passé en argument est bien de la classe
#' \code{departement}, puis retourne une liste contenant le nom du département et des statistiques sur
#' celui-ci, notamment le nombre de communes, le nombre d'élus, la distribution
#' des âges des élus, ainsi que des informations sur les élus les plus âgés et les
#' plus jeunes, ainsi que les communes les plus jeunes et les plus âgées.
#'
#' @param x Un objet de classe `departement` (un `data.frame` contenant les informations des élus et des communes).
#'
#' @return Une liste contenant plusieurs éléments :
#' \itemize{
#'  \item \code{nom_departement} : Le nom du département
#'  \item \code{nombre_communes} : Le nombre de communes dans le département
#'  \item \code{nombre_elus} : Le nombre d'élus dans le département
#'  \item \code{distribution_age_elus} : La distribution des âges des élus dans le département
#'  \item \code{elu_plus_age} : Le nom et l'âge de l'élu le plus âgé
#'  \item \code{elu_plus_jeune} : Le nom et l'âge de l'élu le plus jeune
#'  \item \code{commune_plus_jeune} : La commune avec la moyenne d'âge la plus faible
#'  \item \code{commune_plus_agee} : La commune avec la moyenne d'âge la plus élevée
#'  }
#'
#' @importFrom lubridate today
#'
#' @export
#'
#' @examples
#' # Créer un exemple de jeu de données pour le département de Loire-Atlantique (code 44)
#' df_loire_atlantique <- data.frame(
#'   Code.de.la.commune = rep(44109, 5),
#'   Libellé.de.la.commune = rep("Nantes", 5),
#'   Libellé.du.département = rep("Loire-Atlantique", 5),
#'   Nom.de.l.élu = c("Dupont", "Dupuis", "Martin", "Lemoine", "Durand"),
#'   Prénom.de.l.élu = c("Jean", "Marie", "Paul", "Anne", "Pierre"),
#'   Date.de.naissance = as.Date(c("1970-01-01", "1980-05-12", "1965-08-22", "1992-10-30", "1950-12-05")),
#'   Code.de.la.catégorie.socio.professionnelle = c(1, 2, 3, 4, 5),
#'   stringsAsFactors = FALSE
#' )
#' df_loire_atlantique <- creer_departement(df_loire_atlantique)  # Ajouter la classe "departement"
#'
#' # Appeler la fonction pour obtenir un résumé des informations du département de Loire-Atlantique
#' summary.departement(df_loire_atlantique)
#'
#' @seealso
#' \itemize{
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
#'   \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
#'   }



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
