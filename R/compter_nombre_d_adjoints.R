#' Compte le nombre d'adjoints dans un DataFrame
#'
#' Cette fonction compte le nombre de lignes dans un `data.frame` où la fonction
#' de l'élu contient le mot "adjoint".
#'
#' @param df Un `data.frame` contenant les données des élus. Il doit inclure la colonne
#'   `Libellé.de.la.fonction`, qui sera utilisée pour rechercher le terme "adjoint".
#'
#' @return Un entier représentant le nombre d'adjoints dans le `data.frame`.
#'
#' @importFrom stringr str_detect
#'
#' @examples
#' col_exemple <- data.frame(
#'   Libellé.de.la.fonction = c("Maire", "Adjoint au maire", "Conseiller", "Adjoint")
#' )
#'
#' compter_nombre_d_adjoints(col_exemple)
#' # Résultat attendu : 2
#'
#' @noRd


compter_nombre_d_adjoints <- function(df) {
  # Vérifier que la colonne Libellé.de.la.fonction existe

  if (!"Libellé.de.la.fonction" %in% colnames(df)) {
    stop("❌ Le dataframe doit contenir une colonne 'Libellé.de.la.fonction'.")
  }


  # Compter le nombre de lignes contenant "adjoint" (insensible à la casse)

  nombre_adjoints <- sum(str_detect(tolower(df$Libellé.de.la.fonction), "adjoint"))


  # Retourner le nombre d'adjoints

  return(nombre_adjoints)
}
