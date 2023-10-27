
# Demande à l'utilisateur d'entrer le premier nombre et stocke la valeur dans la variable var 
read -p var1
# Demande à l'utilisateur d'entrer le deuxième nombre et stocke la valeur dans la variable var2
read -p var2
# Effectue l'addition des deux nombres et stocke le résultat dans la variable som
som=$((var1 + var2))

# Affiche le résultat
echo "La somme de $var1 et $var2 est : $som"
