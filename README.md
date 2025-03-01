---
title: "Bienvenue sur mon package"
output:
  html_document:
    css: "style.css"
    code_folding: hide
    highlight: tango
    theme: cerulean
---

# Bienvenue sur **FirstLibDjayan**

Bienvenue dans la documentation de **FirstLibDjayan**, un package R qui facilite l’analyse des données des élus au niveau des communes et départements.



## Objectifs du package

Le package **FirstLibDjayan** a pour objectif de faciliter l’analyse des données des élus au niveau local. Voici les principales fonctionnalités :

<div class="bubble">Analyse des élus</div> 
<div class="bubble">Synthèse des communes et départements</div> 
<div class="bubble">Visualisation des tendances</div> 
<div class="bubble">Génération de rapports automatisés</div>

### Fonctionnalités clés :

- **Analyse des élus** : Extraction et comptage des élus uniques, identification des adjoints, analyse de la distribution des âges pour mieux comprendre la composition des collectivités.
- **Synthèse des communes et départements** : Résumé détaillé des élus par territoire, identification des doyens et benjamins, étude des écarts d’âges par commune et département.
- **Visualisation des tendances** : Génération de graphiques interactifs pour observer la répartition des élus par code professionnel, avec des filtres adaptés aux communes et départements.
- **Génération de rapports automatisés** : Production de rapports personnalisés en **Quarto**, permettant d'obtenir rapidement une synthèse claire des données pour chaque territoire.

---

## Installation

Pour installer **FirstLibDjayan**, utilisez la commande suivante dans R :

```r
library(devtools)
devtools::install_github("Djayan-D/firstlibdjayan")
```

ou

```r
library(remotes)
remotes::install_github("Djayan-D/firstlibdjayan")
```

---

## 📖 Exemple d'utilisation

Voici un exemple pour illustrer comment utiliser **FirstLibDjayan** dans votre analyse :

```r
library(firstlibdjayan)

summary.commune(data)  
```

---

## 💡 Fonctionnalités principales

- **`summary()`**  
  Résumé détaillé des informations relatives à un objet de classe donnée. Cette fonction permet d'afficher un ensemble de statistiques et d'analyses liées à la commune ou au département. Les éléments inclus peuvent être l'âge moyen des élus, la répartition des âges, et d'autres données démographiques ou statistiques liées.  
  **Fonctionnement :**
  - **commune** : Lorsque l'objet est de type **commune**, `summary()` fournit un résumé détaillé des informations sur cette commune spécifique, telles que l'âge moyen des élus, la répartition des âges par tranche, et d'autres statistiques locales.
  - **departement** : Lorsque l'objet est de type **departement**, `summary()` affiche un résumé des informations pour l'ensemble du département, incluant les données de toutes les communes qui le composent. Il inclut également la répartition des âges des élus à l'échelle du département et d'autres statistiques globales.

- **`plot()`**  
  Génère un graphique en barres horizontales représentant le nombre d'élus par code professionnel dans une commune ou un département. Le graphique affiche les codes professionnels ayant au moins un élu, triés par nombre décroissant d'élus. Un titre et des étiquettes sont ajoutés pour la lisibilité.  
  **Fonctionnement :**
  - **commune** : Lorsque l'objet est de type **commune**, `plot()` génère un graphique en barres horizontales qui montre le nombre d'élus pour chaque code professionnel dans cette commune spécifique. Le graphique affiche les codes professionnels ayant au moins un élu, triés par nombre décroissant. Le titre du graphique comprend le nom de la commune ainsi que le nom du département. En bas, le nombre total d'élus dans cette commune est indiqué.
  - **departement** : Lorsque l'objet est de type **departement**, `plot()` génère un graphique similaire, mais il affiche les 10 codes professionnels les plus représentés dans le département. Le titre du graphique comprend le nom du département et le nombre total de communes dans le département. En bas, le nombre total d'élus dans l'ensemble du département est affiché.

- **`generer_rapport()`**  
  Génère des rapports complets au format **PDF** ou **HTML**, contenant des analyses détaillées sur les communes et départements. Ce rapport inclut des statistiques, des graphiques et des résumés complets des informations relatives aux objets de type commune et/ou département. Il permet de générer un document structuré et lisible pour une présentation ou une analyse approfondie.  
  **Fonctionnement :**
  - **commune** : Si l'objet est de type **commune**, le rapport généré se concentrera uniquement sur les données de cette commune, incluant des résumés statistiques, des graphiques et une analyse détaillée de ses élus.
  - **departement** : Si l'objet est de type **departement**, le rapport inclura des données sur toutes les communes du département et donnera une analyse plus large, comprenant des informations sur la répartition des âges des élus à l'échelle du département.


---

## 👥 Contribuer

Si vous souhaitez contribuer à ce package, n’hésitez pas à ouvrir une *issue* ou à proposer une *pull request* sur [GitHub](https://github.com/djayan-d/firstlibdjayan).

---

## ✍️ Auteur

- **DAËRON Djayan** (daeron.djayan@gmail.com)

---

## 📄 Licence

Ce projet est sous licence **MIT** - voir le fichier [LICENSE](LICENSE-text.html) pour plus de détails.

---

**Note** : Si vous avez des questions ou rencontrez des problèmes, n'hésitez pas à ouvrir une issue sur [GitHub](https://github.com/djayan-d/firstlibdjayan).

---

