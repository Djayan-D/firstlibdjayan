#' @title Données des élus
#'
#' @description
#' Un jeu de données contenant des informations sur les élus des départements \strong{Loire-Atlantique},
#' \strong{Gers} ainsi que de la commune de \strong{Faverelles} dans le \strong{Loiret}.
#'
#' @usage elus_sample
#'
#' @format Un \code{data.frame} avec \strong{9 752 lignes} et \strong{16 colonnes} :
#' \describe{
#'   \item{\strong{Code.du.département}}{Code unique du département (\emph{ex : 44 pour Loire-Atlantique, 32 pour Gers}).}
#'   \item{\strong{Libellé.du.département}}{Nom du département (\emph{ex : "Loire-Atlantique", "Gers", "Loiret"}).}
#'   \item{\strong{Code.de.la.collectivité.à.statut.particulier}}{Code identifiant une collectivité spéciale.}
#'   \item{\strong{Libellé.de.la.collectivité.à.statut.particulier}}{Nom de la collectivité spéciale.}
#'   \item{\strong{Code.de.la.commune}}{Code unique de la commune (\emph{ex : 44000 pour Nantes, 32000 pour Auch...}).}
#'   \item{\strong{Libellé.de.la.commune}}{Nom de la commune (\emph{ex : "Nantes", "Auch", "Faverelles"}).}
#'   \item{\strong{Nom.de.l.élu}}{Nom de l’élu.}
#'   \item{\strong{Prénom.de.l.élu}}{Prénom de l’élu.}
#'   \item{\strong{Code.sexe}}{Sexe de l’élu (\emph{M = masculin, F = féminin}).}
#'   \item{\strong{Date.de.naissance}}{Date de naissance (\code{au format "Caractère, à mettre en "Date"}).}
#'   \item{\strong{Code.de.la.catégorie.socio.professionnelle}}{Code socio-professionnel.}
#'   \item{\strong{Libellé.de.la.catégorie.socio.professionnelle}}{Libellé de la catégorie socio-professionnelle.}
#'   \item{\strong{Date.de.début.du.mandat}}{Début du mandat (\code{au format "Caractère, à mettre en "Date"}).}
#'   \item{\strong{Libellé.de.la.fonction}}{Fonction exercée (\emph{ex : maire, conseiller municipal...}).}
#'   \item{\strong{Date.de.début.de.la.fonction}}{Début de la fonction (\code{au format "Caractère, à mettre en "Date"}).}
#'   \item{\strong{Code.nationalité}}{Code nationalité de l’élu.}
#' }
#'
#' @source \href{https://www.data.gouv.fr/fr/datasets/repertoire-national-des-elus-1/#/resources/d5f400de-ae3f-4966-8cb6-a85c70c6c24a}{📂 Trouver les données sur data.gouv.fr}
#'
#' @examples
#' data(elus_sample)
#' head(elus_sample)
"elus_sample"
