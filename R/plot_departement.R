#' Graphique des codes professionnels des élus d'un département
#'
#' Cette fonction génère un graphique en barres horizontales représentant les 10 codes professionnels les plus représentés parmi les élus
#' d'un département. Le graphique affiche les codes professionnels ayant au moins un élu, triés par nombre décroissant d'élus.
#' Le titre du graphique et l'axe des abscisses sont personnalisés en fonction du nom du département et du nombre de communes.
#'
#' @param df Un objet de classe \code{departement} (un \code{dataframe} contenant les informations des élus du département).
#'
#' @return Un objet de type \code{ggplot} représentant un graphique en barres horizontales, où l'axe des ordonnées correspond aux codes professionnels
#'   et l'axe des abscisses au nombre d'élus. Le graphique inclut également des étiquettes des valeurs et un titre personnalisé.
#'
#' @importFrom ggplot2 ggplot geom_bar geom_text labs theme_minimal
#' @importFrom dplyr count filter arrange slice_head
#'
#' @export
#'
#' @examples
#' # Créer un exemple de jeu de données pour le département de Loire-Atlantique (code 44)
#' df_departement <- data.frame(
#'   Code.du.département = rep(44, 10),
#'   Libellé.du.département = rep("Loire-Atlantique", 10),
#'   Libellé.de.la.commune = c("Nantes", "Saint-Nazaire", "La Baule", "Guérande", "Rezé", "Sautron", "Châteaubriant", "Clisson", "Pornic", "Ancenis"),
#'   Code.de.la.catégorie.socio.professionnelle = c(1, 2, 3, 4, 1, 3, 2, 4, 1, 2),
#'   stringsAsFactors = FALSE
#' )
#' df_departement <- creer_departement(df_departement)  # Ajouter la classe "departement"
#'
#' # Appeler la fonction pour générer le graphique
#' plot(df_departement)
#'
#' @seealso
#' \itemize{
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation sur la création de DataFrame}
#'   \item \href{https://github.com/Djayan-D/firstlibdjayan/}{Code source sur GitHub}
#'   \item \href{https://djayan-d.github.io/firstlibdjayan/}{Documentation en ligne}
#'   }


plot.departement <- function(df) {
  # Vérifier que le DataFrame respecte la structure minimale

  validate_schema(df)


  # Vérifier que l'objet x est bien de la classe "departement"

  if (!inherits(df, "departement")) {
    stop("L'objet doit être de classe 'departement'")
  }


  # Extraire le nom du département

  nom_departement <- unique(df$Libellé.du.département)


  # Calculer le nombre de communes distinctes dans le département

  nb_communes <- df |>
    distinct(Libellé.de.la.commune) |>
    nrow()


  # Compter le nombre d'élus par code professionnel

  count_professions <- df |>
    count(Code.de.la.catégorie.socio.professionnelle) |>
    filter(n > 0) |>
    arrange(desc(n)) |>
    slice_head(n = 10) # Sélectionner les 10 codes professionnels les plus représentés


  # Construire le titre et l'axe des abscisses

  titre_graphique <- paste(nom_departement, "-", nb_communes, "communes")
  axe_x <- paste("Libellés des 10 codes professionnels les plus représentés pour", nom_departement)


  # Générer le bar chart horizontal

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
