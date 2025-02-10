# ----- Packages nécessaires -----

library(testthat)  # Charger testthat une seule fois
library(dplyr)     # Pour manipuler les données (si nécessaire pour ton code)
library(lubridate) # Pour la gestion des dates (si nécessaire pour ton code)





# ----- Test 1 : Résumé des informations d'un département -----

test_that("summary.departement génère un résumé correct pour un département", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = c(44000, 44100, 44200),
    Libellé.de.la.commune = c("Nantes", "Saint-Nazaire", "La Baule"),
    Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
    Prénom.de.l.élu = c("Jean", "Paul", "Marie"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15", "1990-08-25")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2, 1),
    Libellé.de.la.fonction = c("Maire", "Adjoint", ""),
    stringsAsFactors = FALSE
  )

  # Ajouter la classe "departement" à l'objet

  df_test <- creer_departement(df_test)


  # Résumé des informations

  res <- summary.departement(df_test)


  # Vérifier que le résumé contient les bonnes informations

  expect_equal(res$nom_departement, "Loire-Atlantique")
  expect_equal(res$nombre_communes, 3)  # Nombre de communes
  expect_equal(res$nombre_elus, 3)  # Nombre d'élus
  expect_type(res$distribution_age_elus, "list")  # Distribution des âges des élus
  expect_equal(res$elu_plus_age$nom, "Martin")  # L'élu le plus âgé
  expect_equal(res$elu_plus_jeune$nom, "Durand")  # L'élu le plus jeune
  expect_equal(res$commune_plus_jeune$nom, "La Baule")  # Commune la plus jeune
  expect_equal(res$commune_plus_agee$nom, "Saint-Nazaire")  # Commune la plus âgée
})






# ----- Test 2 : Erreur si l'objet n'est pas un département -----

test_that("summary.departement renvoie une erreur si l'objet n'est pas un département", {
  # Création d'un DataFrame de test sans la classe "departement"

  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = c(44000, 44100, 44200),
    Libellé.de.la.commune = c("Nantes", "Saint-Nazaire", "La Baule"),
    Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
    Prénom.de.l.élu = c("Jean", "Paul", "Marie"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15", "1990-08-25")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2, 1),
    Libellé.de.la.fonction = c("Maire", "Adjoint", ""),
    stringsAsFactors = FALSE
  )


  # Vérifier que la fonction génère une erreur si l'objet n'est pas un département
  expect_error(
    summary.departement(df_test),
    "L'objet doit être de classe 'departement'"
  )
})
