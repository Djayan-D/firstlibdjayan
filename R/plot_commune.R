#' Graphique des codes professionnels des élus d'une commune
#'
#' Cette fonction génère un graphique en barres horizontales représentant le nombre d'élus par code professionnel dans une commune.
#' Le graphique affiche les codes professionnels ayant au moins un élu, triés par nombre décroissant d'élus. Un titre et des étiquettes
#' sont ajoutés pour la lisibilité.
#'
#' @param df Un objet de classe `commune` (un `data.frame` contenant les informations des élus de la commune).
#' @return Un objet de type `ggplot` représentant un graphique en barres horizontales, où l'axe des ordonnées correspond aux codes professionnels
#'   et l'axe des abscisses au nombre d'élus. Le graphique inclut également des étiquettes des valeurs et un titre personnalisé.
#' @importFrom ggplot2 ggplot geom_bar geom_text labs theme_minimal
#' @importFrom dplyr count filter arrange
#' @importFrom stringr str_detect
#' @export

plot.commune <- function(df) {
  # Vérifier que le DataFrame respecte le schéma attendu

  validate_schema(df)


  # Vérifier que l'objet df est bien de la classe "commune"

  if (!inherits(df, "commune")) {
    stop("L'objet doit être de classe 'commune'")
  }


  # Extraire le nom de la commune et du département

  nom_commune <- unique(df$Libellé.de.la.commune)
  nom_departement <- unique(df$Libellé.du.département)


  # Compter le nombre d'élus par code professionnel et filtrer ceux à 0

  count_professions <- df |>
    count(Code.de.la.catégorie.socio.professionnelle) |>
    filter(n > 0) |>
    arrange(desc(n))


  # Construire le titre et l'axe des abscisses

  titre_graphique <- paste(nom_commune, "-", nom_departement)
  axe_x <- paste("Libellés des codes professionnels pour les", sum(count_professions$n), "élus")


  # Générer le graphique en barres horizontal

  ggplot(count_professions, aes(x = n, y = reorder(Code.de.la.catégorie.socio.professionnelle, n))) +
    geom_bar(stat = "identity", fill = "darkblue") +
    geom_text(aes(label = n), hjust = -0.2, color = "black", size = 2) +  # Ajoute les étiquettes des valeurs
    labs(
      title = titre_graphique,
      x = axe_x,
      y = "Code professionnel"
    ) +
    theme_minimal()
}
