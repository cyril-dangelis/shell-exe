#!/bin/bash

utilisateur="cyril"
number_connexions=$(last "$utilisateur" | grep -c "$utilisateur")
date_actuelle=$(date +"%d-%m-%Y-%H:%M")
nom_fichier=$"$number_connexions-$date_actuelle.log"

echo "nombre de connexions de l'utilisateur $utilisateur : $number_connexions" > "$nom_fichier"

cat "$nom_fichier"

echo "le nombre de connexions a été enregistré dans le fichier : $nom_fichier"

backup_directory="Backup"
if	[ -d "$backup_directory" ]; then
		echo "Le répertoire de sauvegarde '$backup_directory' existe déjà."
	else
		echo "Le répertoire de sauvegarde '$backup_directory' n'existe pas, il sera créé."
		mkdir -p "$backup_directory"
fi

files_to_archive=$"$nom_fichier"

tar -cvf "$backup_directory/$nom_fichier.tar" "$nom_fichier"

echo "Le fichier $nom_fichier a été archivé dans le sous-dossier Backup"

rm "$nom_fichier"
