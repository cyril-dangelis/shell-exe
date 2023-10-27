#!/bin/bash

# L'option -y dans la commande sudo apt full-upgrade -y sert à automatiser la confirmation de l'utilisateur lors de la mise à jour du système. 

sudo apt update && sudo apt full-upgrade -y
