# ----- Test 1 : Vérification de la structure de sortie -----

test_that("trouver_l_elu_le_plus_jeune retourne une liste avec les bons noms", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
    Prénom.de.l.élu = c("Jean", "Sophie", "Paul"),
    Date.de.naissance = as.Date(c("2000-06-15", "1995-03-25", "1988-12-10"))
  )


  # Exécuter la fonction

  res <- trouver_l_elu_le_plus_jeune(df_test)


  # Vérifier que la sortie est bien une liste

  res |>
    expect_type("list")


  # Vérifier que les noms des éléments sont bien nom, prénom et age

  res |>
    expect_named(c("nom", "prénom", "age"))
})





# ----- Test 2 : Vérification du bon élu sélectionné -----

test_that("trouver_l_elu_le_plus_jeune trouve bien l'élu le plus jeune", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont", "Martin", "Durand"),
    Prénom.de.l.élu = c("Jean", "Sophie", "Paul"),
    Date.de.naissance = as.Date(c("2000-06-15", "1995-03-25", "1988-12-10"))
  )


  # Exécuter la fonction

  res <- trouver_l_elu_le_plus_jeune(df_test)


  # Vérifier que l'élu sélectionné est bien Dupont Jean (le plus jeune)

  expect_equal(res$nom, "Dupont")
  expect_equal(res$prénom, "Jean")
})





# ----- Test 3 : Vérification du calcul de l'âge -----

test_that("L'âge est correctement calculé", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont"),
    Prénom.de.l.élu = c("Jean"),
    Date.de.naissance = as.Date("2005-01-01")
  )


  # Exécuter la fonction

  res <- trouver_l_elu_le_plus_jeune(df_test)


  # Vérifier que l'âge est correct par rapport à la date d'aujourd'hui

  age_attendu <- floor(time_length(interval(as.Date("2005-01-01"), today()), "years"))

  expect_equal(res$age, age_attendu)
})





# ----- Test 4 : Erreur si une colonne est absente -----

test_that("trouver_l_elu_le_plus_jeune renvoie une erreur si une colonne est absente", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont"),
    Prénom.de.l.élu = c("Jean")
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    trouver_l_elu_le_plus_jeune(df_test),
    "❌ Le data.frame doit contenir les colonnes : Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance"
  )
})





# ----- Test 5 : Erreur si la colonne Date.de.naissance n'est pas au format Date -----

test_that("trouver_l_elu_le_plus_jeune renvoie une erreur si Date.de.naissance n'est pas au format Date", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom.de.l.élu = c("Dupont"),
    Prénom.de.l.élu = c("Jean"),
    Date.de.naissance = c("2000-06-15") # Pas au format Date
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    trouver_l_elu_le_plus_jeune(df_test),
    "❌ La colonne 'Date.de.naissance' doit être au format Date."
  )
})
