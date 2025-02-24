% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/validate_schema.R
\name{validate_schema}
\alias{validate_schema}
\title{Vérifier le schéma des données}
\usage{
validate_schema(df)
}
\arguments{
\item{df}{La `data.frame` à vérifier.}
}
\value{
NULL Si le schéma est valide, sinon un message d'avertissement indiquant les colonnes manquantes.
}
\description{
Cette fonction vérifie si une `data.frame` contient toutes les colonnes nécessaires au bon fonctionnement des fonctions du package.
Si certaines colonnes sont manquantes, la fonction retourne un avertissement.
L'avertissement est utilisé car toutes les fonctions du package ne nécessitent pas toutes les colonnes. Cela permet de continuer l'exécution des fonctions, même en cas de colonnes manquantes.
}
