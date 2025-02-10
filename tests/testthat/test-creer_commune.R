# ----- Test 1 : Une seule commune -----

test_that("creer_commune ajoute la classe 'commune' pour une seule commune", {
  # Création d'un DataFrame contenant une seule commune

  df_test <- data.frame(
    Code.du.département = c(44,44),
    Libellé.du.département = c("Loire-Atlantique","Loire-Atlantique"),
    Code.de.la.commune = c(44000,44000),
    Libellé.de.la.commune = c("Nantes","Nantes"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )


  # Vérification que la classe "commune" est bien ajoutée

  expect_s3_class(
    creer_commune(df_test),
    "commune"
  )
})





# ----- Test 2 : Plusieurs communes -----

test_that("creer_commune renvoie une erreur si plusieurs communes sont présentes", {
  # Création d'un DataFrame contenant plusieurs communes

  df_test <- data.frame(
    Code.du.département = c(44, 32),
    Libellé.du.département = c("Loire-Atlantique", "Gers"),
    Code.de.la.commune = c(44000, 32000),
    Libellé.de.la.commune = c("Nantes", "Auch"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )


  # Vérification que la fonction génère une erreur avec plusieurs communes

  expect_error(
    creer_commune(df_test),
    "Le DataFrame est composé de plusieurs communes"
  )
})





# ----- Test 3 : Ne pas ajouter la classe plusieurs fois -----

test_that("creer_commune ne duplique pas la classe 'commune' si elle est déjà présente", {
  # Création d'un DataFrame contenant une seule commune

  df_test <- data.frame(
    Code.du.département = c(44,44),
    Libellé.du.département = c("Loire-Atlantique","Loire-Atlantique"),
    Code.de.la.commune = c(44000,44000),
    Libellé.de.la.commune = c("Nantes","Nantes"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )


  # Ajouter manuellement la classe "commune"

  class(df_test) <- c("commune", class(df_test))


  # Vérification que la classe "commune" n'est pas dupliquée

  expect_equal(
    class(creer_commune(df_test)),
    class(df_test)  # La classe ne doit pas changer
  )
})
