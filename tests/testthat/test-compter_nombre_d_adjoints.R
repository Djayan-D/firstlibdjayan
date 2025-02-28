# ----- Test 1 : Vérification du comptage correct -----

test_that("compter_nombre_d_adjoints retourne le bon nombre d'adjoints", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Libellé.de.la.fonction = c(
      "Maire",
      "2ème adjoint au Maire",
      "1er adjoint au Maire",
      "",
      "3ème adjoint au Maire",
      ""
    )
  )


  # Calculer le nombre d'adjoints attendus

  expected_count <- 3


  # Calculer le nombre d'adjoints retourné

  res <- compter_nombre_d_adjoints(df_test)


  # Vérifier que le comptage est correct

  res |>
    expect_equal(expected_count)
})





# ----- Test 2 : Vérification du comptage avec aucune occurrence -----

test_that("compter_nombre_d_adjoints retourne 0 si aucun adjoint n'est présent", {
  # Création d'un DataFrame de test

  df_test <- data.frame(
    Libellé.de.la.fonction = c(
      "Maire",
      "",
      "",
      ""
    )
  )


  # Calculer le nombre d'adjoints retourné

  res <- compter_nombre_d_adjoints(df_test)


  # Vérifier que la fonction retourne 0

  res |>
    expect_equal(0)
})





# ----- Test 3 : Gestion de l'erreur si la colonne "Libellé.de.la.fonction" est absente -----

test_that("compter_nombre_d_adjoints renvoie une erreur si la colonne est absente", {
  # Création d'un DataFrame de test sans la colonne requise

  df_test <- data.frame(
    Nom = c("Dupont", "Martin")
  )


  # Vérifier que la fonction renvoie une erreur

  df_test |>
    compter_nombre_d_adjoints() |>
    expect_error("❌ Le dataframe doit contenir une colonne 'Libellé.de.la.fonction'.")
})
