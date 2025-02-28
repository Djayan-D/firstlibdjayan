library(testthat)

# ----- Test 1 : Vérification avec un DataFrame valide -----

test_that("validate_schema accepte un DataFrame valide sans avertissement", {
  # Création d'un DataFrame de test

  df_valide <- data.frame(
    Code.du.département = c("01", "02"),
    Libellé.du.département = c("Département 1", "Département 2"),
    Code.de.la.commune = c("01001", "02002"),
    Libellé.de.la.commune = c("Commune A", "Commune B"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Sophie"),
    Date.de.naissance = as.Date(c("1970-05-15", "1985-09-23")),
    Code.de.la.catégorie.socio.professionnelle = c("31", "42"),
    Libellé.de.la.fonction = c("Maire", "1er Adjoint")
  )


  # Vérifier qu'aucun avertissement n'est levé

  expect_warning(validate_schema(df_valide), NA)
})





# ----- Test 2 : Vérification avec des colonnes manquantes -----

test_that("validate_schema émet un avertissement si des colonnes sont absentes", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Code.du.département = c("01", "02"),
    Libellé.du.département = c("Département 1", "Département 2"),
    Libellé.de.la.commune = c("Commune A", "Commune B"),
    Prénom.de.l.élu = c("Jean", "Sophie"),
    Code.de.la.catégorie.socio.professionnelle = c("31", "42"),
    Libellé.de.la.fonction = c("Maire", "1er Adjoint")
  )


  # Vérifier que l'avertissement mentionne bien les colonnes manquantes

  expect_warning(
    validate_schema(df_test),
    "⚠️ Attention : Certaines colonnes essentielles sont absentes : Code.de.la.commune, Nom.de.l.élu, Date.de.naissance"
  )
})




# ----- Test 3 : Vérification avec un objet qui n'est pas un data.frame -----

test_that("validate_schema génère une erreur si l'entrée n'est pas un data.frame", {
  # Création d'un vecteur de test

  vec_test <- c(3,1,4,1,5,9,2,6,5)


  # Vérifier que la fonction renvoie une erreur

  expect_error(validate_schema(vec_test), "❌ Erreur : L'objet fourni n'est pas un data.frame.")
})





# ----- Test 4 : Vérification avec un DataFrame vide -----

test_that("validate_schema émet un avertissement avec un DataFrame vide", {
  # Création d'un DataFrame de test

  df_test <- data.frame()


  # Vérifier que la fonction renvoie un warning

  expect_warning(
    validate_schema(df_test),
    "⚠️ Attention : Certaines colonnes essentielles sont absentes :"
  )
})
