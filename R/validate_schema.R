#' Vérifier le schéma des données
#'
#' Cette fonction vérifie si un `data.frame` contient toutes les colonnes nécessaires au bon fonctionnement des fonctions du package.
#' Si certaines colonnes sont manquantes, elle émet un avertissement, mais ne bloque pas l'exécution du programme.
#'
#' @param df Un `data.frame` contenant les données à vérifier.
#' @return NULL si le schéma est valide, sinon un avertissement indiquant les colonnes manquantes.
#'
#' @noRd

validate_schema <- function(df) {
  # Vérifier si l'objet est bien un data.frame

  if (!is.data.frame(df)) {
    stop("❌ Erreur : L'objet fourni n'est pas un data.frame.")
  }


  # Schéma minimal requis

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


  # Identifier les colonnes manquantes

  missing_cols <- setdiff(schema, colnames(df))


  # Afficher un avertissement si certaines colonnes sont manquantes

  if (length(missing_cols) > 0) {
    warning(
      paste0(
        "⚠️ Attention : Certaines colonnes essentielles sont absentes :\n",
        "   → ", paste(missing_cols, collapse = ", "), "\n",
        "Cela peut entraîner des erreurs dans certaines fonctions du package."
      )
    )
  }

  return(NULL)  # Retour explicite
}
