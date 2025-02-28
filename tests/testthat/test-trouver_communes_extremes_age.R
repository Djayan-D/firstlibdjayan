# ----- Test 1 : Vérification de la structure de sortie -----

test_that("trouver_communes_extremes_age retourne une liste avec les bons noms", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Libellé.de.la.commune = c("Commune A", "Commune A", "Commune B", "Commune B", "Commune C"),
    Date.de.naissance = as.Date(c("1960-05-14", "1985-09-23", "1990-12-10", "2000-07-05", "1975-03-30"))
  )


  # Exécuter la fonction

  res <- trouver_communes_extremes_age(df_test)


  # Vérifier que la sortie est bien une liste

  res |>
    expect_type("list")


  # Vérifier que les noms des éléments sont bien commune_plus_jeune et commune_plus_agee

  res |>
    expect_named(c("commune_plus_jeune", "commune_plus_agee"))
})





# ----- Test 2 : Vérification de la structure interne -----

test_that("Les éléments de sortie contiennent les bons sous-éléments", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Libellé.de.la.commune = c("Commune A", "Commune A", "Commune B"),
    Date.de.naissance = as.Date(c("1990-01-01", "1992-06-15", "1965-05-20"))
  )


  # Exécuter la fonction

  res <- trouver_communes_extremes_age(df_test)


  # Vérifier que chaque élément contient un nom et une distribution des âges

  res$commune_plus_jeune |>
    expect_named(c("nom", "distribution_ages"))

  res$commune_plus_agee |>
    expect_named(c("nom", "distribution_ages"))
})





# ----- Test 3 : Vérification des résultats attendus -----

test_that("trouver_communes_extremes_age retourne les bonnes communes", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Libellé.de.la.commune = c("Commune A", "Commune A", "Commune B", "Commune B", "Commune C", "Commune C"),
    Date.de.naissance = as.Date(c("2000-01-01", "1998-05-15", "1960-10-20", "1955-06-30", "1980-07-10", "1982-09-25"))
  )


  # Exécuter la fonction

  res <- trouver_communes_extremes_age(df_test)


  # Vérifier que la commune la plus jeune est bien "Commune A"

  res$commune_plus_jeune$nom |>
    expect_equal("Commune A")


  # Vérifier que la commune la plus âgée est bien "Commune B"

  res$commune_plus_agee$nom |>
    expect_equal("Commune B")
})





# ----- Test 4 : Erreur si une colonne est absente -----

test_that("trouver_communes_extremes_age renvoie une erreur si une colonne est absente", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Date.de.naissance = as.Date(c("1990-01-01", "1965-05-20"))
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    trouver_communes_extremes_age(df_test),
    "❌ Le data.frame doit contenir les colonnes : Libellé.de.la.commune, Date.de.naissance"
  )
})





# ----- Test 5 : Erreur si la colonne Date.de.naissance n'est pas au format Date -----

test_that("trouver_communes_extremes_age renvoie une erreur si Date.de.naissance n'est pas au format Date", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Libellé.de.la.commune = c("Commune A", "Commune B"),
    Date.de.naissance = c("1990-01-01", "1965-05-20") # Pas au format Date
  )


  # Vérifier que la fonction renvoie une erreur

  expect_error(
    trouver_communes_extremes_age(df_test),
    "❌ La colonne 'Date.de.naissance' doit être au format Date."
  )
})
