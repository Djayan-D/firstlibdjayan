#' Graphique des codes professionnels des élus d'une commune
#'
#' Cette fonction génère un graphique en barres horizontales représentant le nombre d'élus par code professionnel dans une commune.
#' Le graphique affiche les codes professionnels ayant au moins un élu, triés par nombre décroissant d'élus. Un titre et des étiquettes
#' sont ajoutés pour la lisibilité.
#'
#' @param df Un objet de classe \code{commune} (un \code{data.frame} contenant les informations des élus de la commune).
#'
#' @return Un objet de type \code{ggplot} représentant un graphique en barres horizontales, où l'axe des ordonnées correspond aux codes professionnels
#'   et l'axe des abscisses au nombre d'élus. Le graphique inclut également des étiquettes des valeurs et un titre personnalisé.
#'
#' @importFrom ggplot2 ggplot geom_bar geom_text labs theme_minimal
#' @importFrom dplyr count filter arrange
#' @importFrom stringr str_detect
#'
#' @export
#'
#' @examples
#' # Créer un exemple de jeu de données pour Nantes (code 44109)
#' df_commune <- data.frame(
#'   Code.de.la.commune = rep(44109, 10),
#'   Libellé.de.la.commune = rep("Nantes", 10),
#'   Libellé.du.département = rep("Loire-Atlantique", 10),
#'   Code.de.la.catégorie.socio.professionnelle = c(1, 2, 2, 3, 1, 3, 4, 1, 2, 3),
#'   stringsAsFactors = FALSE
#' )
#' df_commune <- creer_commune(df_commune)  # Ajouter la classe "commune"
#'
#' # Appeler la fonction pour générer le graphique
#' plot(df_commune)
#'
#' @seealso
#' \itemize{
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
#'   \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
#'   }



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
