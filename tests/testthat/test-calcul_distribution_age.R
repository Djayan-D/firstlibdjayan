# ----- Test 1 : Vérification de la structure de sortie -----

test_that("calcul_distribution_age retourne une liste avec les bons noms", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Date.de.naissance = as.Date(c("1960-05-14", "1985-09-23", "1990-12-10", "2000-07-05", "1975-03-30"))
  )


  # Calculer la distribution des âges

  res <- calcul_distribution_age(df_test)


  # Vérifier que la sortie est bien une liste

  res |>
    expect_type("list")


  # Vérifier que les noms des éléments sont bien Q0, Q25, Q50, Q75, Q100

  res |>
    expect_named(c("Q0", "Q25", "Q50", "Q75", "Q100"))
})





# ----- Test 2 : Vérification des valeurs de sortie -----

test_that("calcul_distribution_age retourne les bons quantiles avec today() comme référence", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Date.de.naissance = as.Date(c("1960-05-14", "1985-09-23", "1990-12-10", "2000-07-05", "1975-03-30"))
  )


  # Définir la date de référence

  date_ref <- lubridate::today()


  # Recalculer les âges en années

  expected_ages <- df_test$Date.de.naissance |>
    lubridate::interval(date_ref) |>
    lubridate::time_length("years")


  # Calculer les quantiles attendus

  expected_quantiles <- expected_ages |>
    quantile(probs = c(0, 0.25, 0.5, 0.75, 1)) |>
    as.vector()


  # Calculer la distribution des âges

  res <- calcul_distribution_age(df_test)


  # Vérifier que les valeurs retournées correspondent aux quantiles attendus

  res$Q0   |> expect_equal(expected_quantiles[1])
  res$Q25  |> expect_equal(expected_quantiles[2])
  res$Q50  |> expect_equal(expected_quantiles[3])
  res$Q75  |> expect_equal(expected_quantiles[4])
  res$Q100 |> expect_equal(expected_quantiles[5])
})





# ----- Test 3 : Gestion de l'erreur si la colonne "Date.de.naissance" est absente -----

test_that("calcul_distribution_age renvoie une erreur si la colonne est absente", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Nom = c("Dupont", "Martin")
  )


  # Vérifier que la fonction renvoie une erreur

  df_test |>
    calcul_distribution_age() |>
    expect_error("❌ Le dataframe doit contenir une colonne 'Date.de.naissance'.")
})





# ----- Test 4 : Gestion de l'erreur si la colonne "Date.de.naissance" n'est pas au format Date -----

test_that("calcul_distribution_age renvoie une erreur si la colonne n'est pas au format Date", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Date.de.naissance = c("14/05/1960", "23/09/1985")  # Type incorrect
  )


  # Vérifier que la fonction renvoie une erreur

  df_test |>
    calcul_distribution_age() |>
    expect_error("❌ La colonne 'Date.de.naissance' doit être au format Date.")
})
