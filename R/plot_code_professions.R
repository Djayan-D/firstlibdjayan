#' Générer un graphique du nombre d'élus par code professionnel
#'
#' Cette fonction crée un graphique en barres horizontales représentant la répartition des élus par code professionnel.
#' Elle compte le nombre d'élus par code, filtre ceux ayant zéro élu et affiche les résultats sous forme d'un graphique ggplot.
#'
#' @param df Un `data.frame` contenant les données des élus, avec la colonne `Code.de.la.catégorie.socio.professionnelle` utilisée
#' pour calculer la répartition.
#'
#' @return Un objet `ggplot` représentant un graphique en barres horizontales du nombre d'élus par code professionnel.
#'
#' @importFrom dplyr count filter arrange
#' @importFrom ggplot2 ggplot aes geom_col geom_text labs theme_minimal theme element_text
#'
#' @noRd


plot_code_professions <- function(df) {
  # Vérifier la présence de la colonne requise

  if (!"Code.de.la.catégorie.socio.professionnelle" %in% colnames(df)) {
    stop("❌ Le dataframe doit contenir la colonne 'Code.de.la.catégorie.socio.professionnelle'.")
  }


  # Vérifier qu'il y a bien des valeurs non manquantes dans cette colonne

  if (all(is.na(df$Code.de.la.catégorie.socio.professionnelle))) {
    stop("❌ La colonne 'Code.de.la.catégorie.socio.professionnelle' ne contient que des valeurs manquantes.")
  }


  # Compter le nombre d'élus par code professionnel

  count_professions <- df |>
    count(Code.de.la.catégorie.socio.professionnelle, name = "Nombre") |>
    filter(Nombre > 0) |> # Exclure les catégories sans élu
    arrange(desc(Nombre))


  # Vérifier qu'il y a bien des données après le filtrage

  if (nrow(count_professions) == 0) {
    warning("⚠ Aucune donnée disponible après filtrage. Vérifiez la colonne 'Code.de.la.catégorie.socio.professionnelle'.")
    return(NULL)
  }


  # Générer le graphique en barres horizontales

  ggplot(count_professions, aes(x = Nombre, y = reorder(Code.de.la.catégorie.socio.professionnelle, Nombre))) +
    geom_col(fill = "darkblue", width = 0.7) +  # Couleur améliorée
    geom_text(aes(label = Nombre), hjust = -0.2, color = "black", size = 3) +  # Ajustement des labels
    labs(
      title = "Répartition des élus par code professionnel",
      x = "Nombre d'élus",
      y = "Code professionnel"
    ) +
    theme_minimal() +
    theme(
      text = element_text(size = 12), # Meilleure lisibilité des textes
      axis.text.y = element_text(size = 10) # Éviter les textes trop petits
    )
}
