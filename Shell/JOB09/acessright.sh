#!/bin/bash

FICHIER_CSV="/home/cyril/Shell/JOB09/Shell_Userlist.csv"

while IFS=',' read -r id prenom nom mdp role
do
    if [ "$prenom" != "Prenom" ]; then
        if [ "$role" == "Admin" ]; then
            useradd -m -G sudo "$prenom"
            echo "L'utilisateur $prenom a été ajouté avec des permissions - super utilisateur -"
        else
            useradd -m "$prenom"
            echo "L'utilisateur - $prenom - a été ajouté avec des permissions - normales-"
        fi
    fi
done < "$FICHIER_CSV"
