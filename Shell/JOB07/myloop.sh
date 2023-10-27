#!/bin/bash

# Fichier texte par défaut
fichier_texte=myloop.txt

# Traite les arguments de ligne de commande
while getopts "f:" opt; do
  case $opt in
    f)
      fichier_texte="$OPTARG"
      ;;
    \?)
      echo "Utilisation : $0 [-f nom_du_fichier.txt]" >&2
      exit 1
      ;;
  esac
done

# Boucle pour créer les phrases de 1 à 10
for i in {1..10}; do
  # Utilise printf pour formater le numéro de phrase avec deux chiffres (par exemple, 01, 02, ..., 10)
  numero_format=$(printf "%02d" $i)
  nom_de_la_phrase="Je suis un script qui arrive à faire une boucle $numero_format"
  
  # Écrit la phrase dans le fichier texte
  echo "$nom_de_la_phrase" >> "$fichier_texte"
done

echo "Les phrases ont été créées avec succès dans le fichier $fichier_texte."
