#' Vérifier le schéma des données
#'
#' Cette fonction vérifie si une `data.frame` contient toutes les colonnes nécessaires au bon fonctionnement des fonctions du package.
#' Si certaines colonnes sont manquantes, la fonction retourne un avertissement.
#' L'avertissement est utilisé car toutes les fonctions du package ne nécessitent pas toutes les colonnes. Cela permet de continuer l'exécution des fonctions, même en cas de colonnes manquantes.
#'
#' @param df La `data.frame` à vérifier.
#' @return NULL Si le schéma est valide, sinon un message d'avertissement indiquant les colonnes manquantes.
#' @export

validate_schema <- function(df) {
  # Schéma minimal pour faire tourner l'ensemble des fonctions du package

  schema <- c(
    "Code.du.département",
    "Libellé.du.département",
    "Code.de.la.commune",
    "Libellé.de.la.commune",
    "Nom.de.l.élu",
    "Prénom.de.l.élu",
    "Date.de.naissance",
    "Code.de.la.catégorie.socio.professionnelle",
    "Libellé.de.la.fonction"
  )


  # Vérifier s'il manque des colonnes

  missing_cols <- setdiff(schema, colnames(df))


  # Ajouter un avertissement s'il manque des colonnes (laisse tourner la fonction)

  if (length(missing_cols) > 0) {
    warning(paste(
      "Attention ! Certaines colonnes nécessaires au bon fonctionnement du package sont manquantes :",
      paste(missing_cols, collapse = ", "),
      ". Cela est susceptible d'entraîner des erreurs dans l'exécution de certaines fonctions, mais l'exécution du package peut continuer."
    ))
  }
}
