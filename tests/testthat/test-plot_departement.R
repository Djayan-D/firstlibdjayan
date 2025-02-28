# ----- Test 1 : Génération correcte du graphique -----

test_that("plot.departement génère un objet ggplot valide", {
  # Création d'un DataFrame de test respectant la structure demandée
  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = c(44000, 44100, 44200, 44300, 44400),
    Libellé.de.la.commune = c("Nantes", "Saint-Nazaire", "Rezé", "Saint-Herblain", "Orvault"),
    Nom.de.l.élu = c("Dupont", "Martin", "Durand", "Bernard", "Leroy"),
    Prénom.de.l.élu = c("Jean", "Paul", "Marie", "Luc", "Sophie"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15", "1990-08-25", "1965-02-10", "1980-11-03")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2, 2, 3, 4),
    Libellé.de.la.fonction = c("Maire", "Adjoint", "", "Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )


  # Ajouter la classe "departement"

  df_test <- creer_departement(df_test)


  # Génération du graphique

  res <- plot.departement(df_test)


  # Vérification que l'objet est bien un ggplot

  expect_s3_class(res, "ggplot")
})





# ----- Test 2 : Erreur si l'objet n'est pas un département -----

test_that("plot.departement renvoie une erreur si l'objet n'est pas un département", {
  # Création d'un DataFrame SANS la classe "departement"
  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = c(44000, 44100),
    Libellé.de.la.commune = c("Nantes", "Saint-Nazaire"),
    Nom.de.l.élu = c("Dupont", "Martin"),
    Prénom.de.l.élu = c("Jean", "Paul"),
    Date.de.naissance = as.Date(c("1985-10-22", "1970-05-15")),
    Code.de.la.catégorie.socio.professionnelle = c(1, 2),
    Libellé.de.la.fonction = c("Maire", "Adjoint"),
    stringsAsFactors = FALSE
  )


  # Vérification que la fonction génère bien une erreur

  expect_error(
    plot.departement(df_test),
    "L'objet doit être de classe 'departement'"
  )
})





# ----- Test 4 : Vérification du filtrage des 10 catégories max -----
test_that("plot.departement ne montre que les 10 catégories les plus représentées", {
  # Création d'un jeu de données avec 15 catégories différentes
  df_test <- data.frame(
    Code.du.département = 44,
    Libellé.du.département = "Loire-Atlantique",
    Code.de.la.commune = rep(44000, 15),
    Libellé.de.la.commune = rep("Nantes", 15),
    Nom.de.l.élu = paste("Élu", 1:15),
    Prénom.de.l.élu = paste("Prénom", 1:15),
    Date.de.naissance = as.Date("1980-01-01") - (1:15 * 365),
    Code.de.la.catégorie.socio.professionnelle = 1:15, # 15 catégories différentes
    Libellé.de.la.fonction = rep("", 15),
    stringsAsFactors = FALSE
  )

  df_test <- creer_departement(df_test)


  # Générer le graphique

  res <- plot.departement(df_test)


  # Extraire les données du graphique

  data_plot <- ggplot2::ggplot_build(res)$data[[1]]


  # Vérifier qu'on a bien 10 catégories affichées au maximum

  expect_lte(nrow(data_plot), 10)
})
