% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_commune.R
\name{plot.commune}
\alias{plot.commune}
\title{Graphique des codes professionnels des élus d'une commune}
\usage{
\method{plot}{commune}(df)
}
\arguments{
\item{df}{Un objet de classe `commune` (un `data.frame` contenant les informations des élus de la commune).}
}
\value{
Un objet de type `ggplot` représentant un graphique en barres horizontales, où l'axe des ordonnées correspond aux codes professionnels
  et l'axe des abscisses au nombre d'élus. Le graphique inclut également des étiquettes des valeurs et un titre personnalisé.
}
\description{
Cette fonction génère un graphique en barres horizontales représentant le nombre d'élus par code professionnel dans une commune.
Le graphique affiche les codes professionnels ayant au moins un élu, triés par nombre décroissant d'élus. Un titre et des étiquettes
sont ajoutés pour la lisibilité.
}
