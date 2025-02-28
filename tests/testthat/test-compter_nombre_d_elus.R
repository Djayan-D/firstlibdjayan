# ----- Test 1 : Vérification du comptage des élus uniques -----

test_that("compter_nombre_d_elus retourne le bon nombre d'élus uniques", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
    Prénom.de.l.élu = c("Jean", "Sophie", "Claire"),
    Date.de.naissance = as.Date(c("1980-01-01", "1992-06-15", "1980-01-01"))
  )


  # Calcul du nombre d'élus uniques

  res <- compter_nombre_d_elus(df_test)


  # Vérifier que le nombre d'élus uniques est correct (3)

  expect_equal(res, 3)
})





# ----- Test 2 : Gestion des doublons -----

test_that("compter_nombre_d_elus ignore les doublons exacts", {
  # Création d'un DataFrame de test avec doublons
  ## 3 personnes mêmes Nom, Prénom, Date
  ## 2 personnes même Nom, Prénom, Date
  ## 2 personnes même Nom, Prénom, PAS Date
  ## 2 personnes même Nom, PAS Prénom, Date
  ## 2 personnes même PAS Nom, Prénom, Date

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin", "Dupont", "Dupont", "Martin", "Durand", "Martin", "Martin"),
    Prénom.de.l.élu = c("Jean", "Sophie", "Jean", "Jean", "Sophie", "Sophie", "Isabelle", "Sophie"),
    Date.de.naissance = as.Date(c("1980-01-01", "1992-06-15", "1980-01-01", "1980-01-01", "1988-02-28", "1992-06-15", "1992-06-15", "1992-06-15"))
  )


  # Calcul du nombre d'élus uniques

  res <- compter_nombre_d_elus(df_test)


  # Vérifier que les doublons ne sont pas comptés plusieurs fois

  expect_equal(res, 5)
})





# ----- Test 3 : Erreur si une colonne manque -----

test_that("compter_nombre_d_elus renvoie une erreur si une colonne est absente", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Sophie")
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    compter_nombre_d_elus(df_test),
    "❌ Le data.frame doit contenir les colonnes : Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance"
  )
})





# ----- Test 4 : Erreur si la colonne "Date.de.naissance" n'est pas une date -----

test_that("compter_nombre_d_elus renvoie une erreur si Date.de.naissance n'est pas au format Date", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Sophie"),
    Date.de.naissance = c("1980-01-01", "1992-06-15") # Mauvais format (caractères)
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    compter_nombre_d_elus(df_test),
    "❌ La colonne 'Date.de.naissance' doit être au format Date."
  )
})
