# Vérifie si TinyTeX est installé au chargement du package.
# TinyTeX est nécessaire pour générer des rapports au format PDF avec Quarto.
# S'il n'est pas installé, l'utilisateur rencontrerait une erreur lors de la génération du rapport.
# Cette fonction installe donc automatiquement TinyTeX si besoin et demande un redémarrage de R.
.onLoad <- function(libname, pkgname) {
  if (!tinytex::is_tinytex()) {
    message("📄 TinyTeX n'est pas installé. Installation en cours... ⏳")
    tinytex::install_tinytex()
    message("✅ Installation terminée. Veuillez redémarrer R pour finaliser la configuration.")
  }
}
