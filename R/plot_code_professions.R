#' Générer un graphique du nombre d'élus par code professionnel
#'
#' Cette fonction permet de générer un graphique en barres horizontal représentant le nombre d'élus
#' par code professionnel. Elle compte le nombre d'élus par code professionnel, filtre ceux avec zéro élu
#' et affiche les résultats sous forme de graphique.
#'
#' @param df Un `data.frame` contenant les données des élus, avec la colonne `Code.de.la.catégorie.socio.professionnelle` utilisée
#' pour déterminer la répartition des élus par code professionnel.
#' @return Un objet `ggplot` représentant un graphique en barres horizontal du nombre d'élus par code professionnel.
#' @importFrom dplyr count filter arrange
#' @importFrom ggplot2 ggplot aes geom_bar geom_text labs theme_minimal

plot_code_professions <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Compter le nombre d'élus par code professionnel

  count_professions <- df |>
    count(Code.de.la.catégorie.socio.professionnelle) |> # Compte le nombre d'élus par code professionnel
    filter(n > 0) |> # Filtre les codes professionnels avec 0 élu
    arrange(desc(n)) # Trie les résultats par nombre décroissant d'élus


  # Générer le graphique en barres horizontal

  ggplot(count_professions, aes(x = n, y = reorder(Code.de.la.catégorie.socio.professionnelle, n))) +
    geom_bar(stat = "identity", fill = "darkblue") +
    geom_text(aes(label = n), hjust = -0.2, color = "black", size = 2) +  # Ajoute les étiquettes des valeurs
    labs(
      title = "Nombre d'élus par code professionnel",
      x = "Nombre d'élus",
      y = "Code professionnel"
    ) +
    theme_minimal()
}
