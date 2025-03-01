#' Résumé des informations d'une commune
#'
#' Cette fonction génère un résumé des informations pour une commune donnée. Elle
#' vérifie que l'objet passé en argument est bien de la classe \code{commune},
#' puis retourne une liste contenant le nom de la commune et des statistiques sur
#' celle-ci, notamment le nombre d'élus, la distribution des âges des élus, ainsi que des informations sur l'élu le plus âgés.
#'
#' @param x Un objet de classe \code{commune}, qui est un \code{data.frame} contenant les données des élus d'une commune.
#'
#' @return Une liste contenant :
#' \itemize{
#'  \item \code{nom_commune} : Le nom de la commune
#'  \item \code{nombre_elus} : Le nombre d'élus dans la commune
#'  \item \code{distribution_ages_elus} : Les quantiles de la distribution des âges des élus
#'  \item \code{elu_plus_age} : Les informations de l'élu le plus âgé
#'  }
#'
#' @export
#'
#' @examples
#' # Créer un exemple de jeu de données pour Nantes (code 44109)
#' df_nantes <- data.frame(
#'   Code.de.la.commune = rep(44109, 5),
#'   Libellé.de.la.commune = rep("Nantes", 5),
#'   Nom.de.l.élu = c("Dupont", "Dupuis", "Martin", "Lemoine", "Durand"),
#'   Prénom.de.l.élu = c("Jean", "Marie", "Paul", "Anne", "Pierre"),
#'   Date.de.naissance = as.Date(c("1970-01-01", "1980-05-12", "1965-08-22", "1992-10-30", "1950-12-05")),
#'   stringsAsFactors = FALSE
#' )
#' df_nantes <- creer_commune(df_nantes)  # Ajouter la classe "commune"
#'
#' # Appeler la fonction pour obtenir un résumé des informations de la commune de Nantes
#' summary(df_nantes)
#'
#' @seealso
#' \itemize{
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
#'   \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
#'   }


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
