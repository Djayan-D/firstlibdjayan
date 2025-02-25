---
title: "Bienvenue sur mon package"
output:
  html_document:
    css: "style.css"
    code_folding: hide
---


# Bienvenue sur **FirstLibDjayan**

Bienvenue sur la documentation de **FirstLibDjayan**, un package R conçu pour l'analyse des données des élus au niveau des communes et départements.

## ![Logo](assets/logo.png){width="200px"}

## Objectifs du package

Le package **FirstLibDjayan** a pour objectif de faciliter l’analyse des données des élus au niveau local. Voici les principales fonctionnalités du package :

- **Analyse des élus** : Extraction et comptage des élus uniques, identification des adjoints, analyse de la distribution des âges pour mieux comprendre la composition des collectivités.
- **Synthèse des communes et départements** : Résumé détaillé des élus par territoire, identification des doyens et benjamins, étude des écarts d’âges par commune et département.
- **Visualisation des tendances** : Génération de graphiques interactifs pour observer la répartition des élus par code professionnel, avec des filtres adaptés aux communes et départements.
- **Génération de rapports automatisés** : Production de rapports personnalisés en **Quarto**, permettant d'obtenir rapidement une synthèse claire des données pour chaque territoire.

## Installation

Pour installer **FirstLibDjayan**, utilisez la commande suivante dans R :

```r
devtools::install_github("djayan-d/firstlibdjayan")
```

---


## 📖 Exemple d'utilisation

Voici un exemple pour illustrer comment utiliser **FirstLibDjayan** dans votre analyse :

```r
library(firstlibdjayan)

# Exemple d'utilisation d'une fonction du package
# Remplacez ceci par une fonction du package, comme summary.commune()
summary.commune(data)  
```
---


## 💡 Fonctionnalités principales

- **`summary.commune()`** : Résumé détaillé des informations relatives à une commune donnée (âge moyen, répartition des âges, etc.).
- **`summary.departement()`** : Résumé des informations relatives à un département entier, incluant les communes, la répartition des âges des élus et d'autres statistiques.
- **`generer_rapport()`** : Génère des rapports au format **PDF** ou **HTML** avec des analyses complètes basées sur les communes et départements.


## 👥 Contribuer

Si vous souhaitez contribuer à ce package, n’hésitez pas à ouvrir une *issue* ou à proposer une *pull request* sur [GitHub](https://github.com/djayan-d/firstlibdjayan).

---

## ✍️ Auteurs

- **DAËRON Djayan** (ton.email@example.com)

---

## 📄 Licence

Ce projet est sous licence **MIT** - voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

**Note** : Si vous avez des questions ou rencontrez des problèmes, n'hésitez pas à ouvrir une issue sur [GitHub](https://github.com/djayan-d/firstlibdjayan).
---
