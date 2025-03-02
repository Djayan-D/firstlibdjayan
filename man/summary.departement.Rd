% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_departement.R
\name{summary.departement}
\alias{summary.departement}
\title{Résumé des informations d'un département}
\usage{
\method{summary}{departement}(x)
}
\arguments{
\item{x}{Un objet de classe `departement` (un `data.frame` contenant les informations des élus et des communes).}
}
\value{
Une liste contenant plusieurs éléments :
\itemize{
 \item \code{nom_departement} : Le nom du département
 \item \code{nombre_communes} : Le nombre de communes dans le département
 \item \code{nombre_elus} : Le nombre d'élus dans le département
 \item \code{distribution_age_elus} : La distribution des âges des élus dans le département
 \item \code{elu_plus_age} : Le nom et l'âge de l'élu le plus âgé
 \item \code{elu_plus_jeune} : Le nom et l'âge de l'élu le plus jeune
 \item \code{commune_plus_jeune} : La commune avec la moyenne d'âge la plus faible
 \item \code{commune_plus_agee} : La commune avec la moyenne d'âge la plus élevée
 }
}
\description{
Cette fonction génère un résumé des informations pour un département donné.
Elle vérifie que l'objet passé en argument est bien de la classe
\code{departement}, puis retourne une liste contenant le nom du département et des statistiques sur
celui-ci, notamment le nombre de communes, le nombre d'élus, la distribution
des âges des élus, ainsi que des informations sur les élus les plus âgés et les
plus jeunes, ainsi que les communes les plus jeunes et les plus âgées.
}
\examples{
# Créer un exemple de jeu de données pour le département de Loire-Atlantique (code 44)

df_loire_atlantique <- data.frame(
  Code.du.département = rep(44, 5),
  Libellé.du.département = rep("Loire-Atlantique", 5),
  Code.de.la.commune = c(rep(44109, 3), rep(44026, 2)),
  Libellé.de.la.commune = c(rep("Nantes", 3), rep("Carquefou", 2)),
  Nom.de.l.élu = c("Dupont", "Dupuis", "Martin", "Lemoine", "Durand"),
  Prénom.de.l.élu = c("Jean", "Marie", "Paul", "Anne", "Pierre"),
  Date.de.naissance = as.Date(c("1970-01-01", "1980-05-12", "1965-08-22", "1992-10-30", "1950-12-05")),
  Code.de.la.catégorie.socio.professionnelle = c(1, 2, 3, 4, 5),
  stringsAsFactors = FALSE
)
df_loire_atlantique <- creer_departement(df_loire_atlantique)  # Ajouter la classe "departement"

# Appeler la fonction pour obtenir un résumé des informations du département de Loire-Atlantique
summary(df_loire_atlantique)

}
\seealso{
\itemize{
  \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
  \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
  \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
  }
}
