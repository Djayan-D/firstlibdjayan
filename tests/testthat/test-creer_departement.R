# ----- Test 1 : Un seul département -----

test_that("creer_departement ajoute la classe 'departement' pour un seul département", {

  df_test <- data.frame(
    Code.du.département = c(44,44),
    Libellé.du.département = c("Loire-Atlantique","Loire-Atlantique"),
    Code.de.la.commune = c(44000, 44100),
    Libellé.de.la.commune = c("Nantes", "Saint-Herblain"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )

  expect_message(
    res <- creer_departement(df_test),
    "✅ Classe 'departement' ajoutée au DataFrame."
  )

  expect_s3_class(res, "departement")
})





# ----- Test 2 : Plusieurs départements -----

test_that("creer_departement renvoie une erreur si plusieurs départements sont présents", {

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

  expect_error(
    creer_departement(df_test),
    "❌ Erreur : Le DataFrame contient plusieurs départements."
  )
})





# ----- Test 3 : Ne pas ajouter la classe plusieurs fois -----

test_that("creer_departement ne duplique pas la classe 'departement' si elle est déjà présente", {

  df_test <- data.frame(
    Code.du.département = c(44, 44),
    Libellé.du.département = c("Loire-Atlantique", "Loire-Atlantique"),
    Code.de.la.commune = c(44000, 44100),
    Libellé.de.la.commune = c("Nantes", "Saint-Herblain"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )

  class(df_test) <- c("departement", class(df_test))

  expect_silent(res <- creer_departement(df_test))  # Ne doit pas afficher de message
  expect_equal(class(res), class(df_test))  # La classe ne doit pas changer
})
