#!/bin/bash

# Vérifier le nombre de paramètres
if [ $# -lt 2 ]; then
    echo "Usage: $0 file1 file2 [file3 ...]"
    exit 1
fi

# Premier fichier : fichier de destination
destination=$1
shift   # Supprimer le premier paramètre, nous l'utiliserons comme fichier de destination

# Concaténer les fichiers
for fichier in "$@"; do
    # Vérifier si le fichier existe
    if [ ! -f "$fichier" ]; then
        echo "'$fichier' n'est pas un fichier valide."
        continue
    fi

    # Ajouter chaque ligne du fichier à partir de la dernière dans le fichier de destination
    tac "$fichier" | while read -r ligne; do
        echo "$ligne" >> "$destination"
    done
done
