# ----- Packages nécessaires -----
library(testthat)  # Framework de test
library(ggplot2)   # Vérification du type ggplot
library(dplyr)     # Manipulation des données
library(lubridate) # Gestion des dates





# ----- Test 1 : Génération correcte du graphique -----

test_that("plot.commune génère un objet ggplot valide", {
  # Création d'un DataFrame contenant une seule commune

  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = 44000,
    Libellé.de.la.commune = "Nantes",
    Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
    Prénom.de.l.élu = c("Jean", "Paul", "Marie"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15", "1990-08-25")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint", "Conseiller"),
    stringsAsFactors = FALSE
  )


  # Ajouter la classe "commune"

  df_test <- creer_commune(df_test)


  # Génération du graphique

  res <- plot.commune(df_test)


  # Vérification que l'objet est bien un ggplot

  expect_s3_class(res, "ggplot")
})





# ----- Test 2 : Erreur si l'objet n'est pas une commune -----

test_that("plot.commune renvoie une erreur si l'objet n'est pas une commune", {
  # Création d'un DataFrame SANS la classe "commune"

  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = 44000,
    Libellé.de.la.commune = "Nantes",
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )


  # Vérification que la fonction génère bien une erreur

  expect_error(
    plot.commune(df_test),
    "L'objet doit être de classe 'commune'"
  )
})
