% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/creer_commune.R
\name{creer_commune}
\alias{creer_commune}
\title{Créer un objet de classe "commune"}
\usage{
creer_commune(df)
}
\arguments{
\item{df}{Un `data.frame` contenant les données des communes, avec la colonne `Code.de.la.commune` utilisée
pour vérifier si plusieurs communes sont présentes dans le `data.frame`.}
}
\value{
Un `data.frame` auquel la classe "commune" est ajoutée s'il contient une seule commune.
}
\description{
Cette fonction permet de vérifier si le `data.frame` contient les données d'une seule commune. Si le `data.frame`
contient plusieurs communes, la fonction arrête l'exécution avec un message d'erreur. Si une seule commune est présente,
elle ajoute la classe "commune" au `data.frame`.
}
