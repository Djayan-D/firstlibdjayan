#' Compter le nombre d'élus uniques
#'
#' Cette fonction compte le nombre d'élus uniques dans un `data.frame`, en identifiant
#' chaque élu par son nom, prénom et date de naissance. Elle élimine les doublons
#' pour ne compter chaque élu qu'une seule fois.
#'
#' @param df Un `data.frame` contenant les colonnes suivantes :
#'   - `Nom.de.l.élu` : Nom de l'élu.
#'   - `Prénom.de.l.élu` : Prénom de l'élu.
#'   - `Date.de.naissance` : Date de naissance de l'élu (au format Date).
#'
#' @return Un entier représentant le nombre d'élus uniques dans le `data.frame`.
#'
#' @importFrom dplyr select distinct
#'
#' @examples
#' col_exemple <- data.frame(
#'   Nom.de.l.élu = c("Dupont", "Martin", "Dupont"),
#'   Prénom.de.l.élu = c("Jean", "Sophie", "Jean"),
#'   Date.de.naissance = as.Date(c("1980-01-01", "1992-06-15", "1980-01-01"))
#' )
#'
#' compter_nombre_d_elus(col_exemple)
#' # Résultat attendu : 2
#'
#' @noRd


compter_nombre_d_elus <- function(df) {
  # Vérifier la présence des colonnes requises

  required_cols <- c("Nom.de.l.élu", "Prénom.de.l.élu", "Date.de.naissance")

  if (!all(required_cols %in% colnames(df))) {
    stop("❌ Le data.frame doit contenir les colonnes : ", paste(required_cols, collapse = ", "))
  }


  # Vérifier que la colonne Date.de.naissance est au format Date

  if (!inherits(df$Date.de.naissance, "Date")) {
    stop("❌ La colonne 'Date.de.naissance' doit être au format Date.")
  }


  # Sélectionner les colonnes nécessaires et supprimer les doublons

  nombre_elus <- df |>
    select(Nom.de.l.élu, Prénom.de.l.élu, Date.de.naissance) |> # Sélectionne les colonnes du triplet
    distinct() |> # Supprime les doublons
    nrow() # Compte le nombre d'élus uniques


  # Retourner le nombre d'élus

  return(nombre_elus)
}
