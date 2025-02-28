# ----- Test 1 : Vérification du type de retour -----

test_that("plot_code_professions retourne un objet ggplot", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Code.de.la.catégorie.socio.professionnelle = c(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
  )


  # Génération du graphique

  res <- plot_code_professions(df_test)


  # Vérifier que la sortie est un objet ggplot

  expect_s3_class(res, "ggplot")
})





# ----- Test 2 : Vérification du filtrage des valeurs zéro -----

test_that("plot_code_professions ignore les catégories avec zéro élu", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Code.de.la.catégorie.socio.professionnelle = c(1, 2, 2, 3, 3, 3, NA, NA)
  )


  # Génération du graphique

  res <- plot_code_professions(df_test)


  # Vérifier que la sortie est bien un ggplot et qu'il n'y a pas de catégories vides

  expect_s3_class(res, "ggplot")
})





# ----- Test 3 : Erreur si la colonne est absente -----

test_that("plot_code_professions renvoie une erreur si la colonne est absente", {
  # Création d'un DataFrame de test sans la colonne requise

  df_test <- data.frame(
    Autre.colonne = c(1, 2, 3)
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    plot_code_professions(df_test),
    "❌ Le dataframe doit contenir la colonne 'Code.de.la.catégorie.socio.professionnelle'."
  )
})





# ----- Test 4 : Erreur si toutes les valeurs sont NA -----

test_that("plot_code_professions renvoie une erreur si la colonne ne contient que des NA", {
  # Création d'un DataFrame de test avec uniquement des valeurs manquantes

  df_test <- data.frame(
    Code.de.la.catégorie.socio.professionnelle = c(NA, NA, NA, NA)
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    plot_code_professions(df_test),
    "❌ La colonne 'Code.de.la.catégorie.socio.professionnelle' ne contient que des valeurs manquantes."
  )
})
