# ----- Test 1 : Résumé des informations d'une commune -----

test_that("summary.commune génère un résumé correct pour une commune", {
  # Création d'un DataFrame de test

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


  # Ajouter la classe "commune"

  df_test <- creer_commune(df_test)


  # Résumé des informations

  res <- summary.commune(df_test)



  # Vérifier que le résumé contient les bonnes informations

  expect_equal(res$nom_commune, "Nantes")
  expect_equal(res$nombre_elus, 2)  # Nombre d'élus
  expect_type(res$distribution_ages_elus, "list")  # Distribution des âges des élus
  expect_equal(res$elu_plus_age$nom, "Martin")  # L'élu le plus âgé
})





# ----- Test 2 : Erreur si l'objet n'est pas une commune -----

test_that("summary.commune renvoie une erreur si l'objet n'est pas une commune", {
  # Création d'un DataFrame de test sans la classe "commune"

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


  # Vérifier que la fonction génère une erreur si l'objet n'est pas une commune

  expect_error(
    summary.commune(df_test),
    "L'objet doit être de classe 'commune'"
  )
})
