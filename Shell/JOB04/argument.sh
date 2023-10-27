#!/bin/bash

# Demande à l'utilisateur de saisir le nom du fichier source
read -p "Entrez le nom du fichier source : " source_file

# Vérifie si le fichier source existe
if [ -f "$source_file" ]; then
  # Le fichier source existe, donc il est prêt à être copié

  # Demande à l'utilisateur de saisir le nom du fichier de destination
  read -p "Entrez le nom du fichier de destination : " destination_file

  # Utilise la commande 'cat' pour lire le contenu du fichier source
  # et redirige la sortie vers le fichier de destination
  cat "$source_file" > "$destination_file"
  echo "Le contenu du fichier source $source_file a été écrit dans le fichier de destination $destination_file."
else
  # Le fichier source n'existe pas, donc demande à l'utilisateur de le créer ou d'annuler l'opération
  echo "Le fichier source $source_file n'existe pas."
  read -p "Voulez-vous créer le fichier source avec nano et ajouter du contenu ? (Oui/Non) : " create_file
  if [ "$create_file" = "Oui" ]; then
    nano "$source_file"  # Ouvre le fichier source avec nano pour édition
    echo "Veuillez saisir le contenu dans le fichier source $source_file, puis enregistrez et quittez nano."
    read -p "Appuyez sur Entrée une fois que vous avez terminé." _unused
    # Demande à l'utilisateur de saisir le nom du fichier de destination
    read -p "Entrez le nom du fichier de destination : " destination_file
    # Utilise la commande 'cat' pour lire le contenu du fichier source
    # et redirige la sortie vers le fichier de destination
    cat "$source_file" > "$destination_file"
    echo "Le contenu du fichier source $source_file a été écrit dans le fichier de destination $destination_file."
  else
    echo "Opération annulée. Aucune copie effectuée."
  fi
fi
