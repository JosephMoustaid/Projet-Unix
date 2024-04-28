#!/bin/bash

# Vérifier que des répertoires sont fournis en arguments
if [ $# -eq 0 ]; then
    echo "Utilisage : $0 directory1 [directory2 ...]"
    exit 1
fi

# Boucle sur chaque répertoire fourni en argument
for repertoire in "$@"; do
    # Vérifier si le répertoire existe
    if [ -d "$repertoire" ]; then
        # Initialiser les compteurs par 0
        fichiers=0
        sousdirectoires=0

        # Parcours de tous les éléments dans le répertoire donné
        for element in "$repertoire"/*; do
            if [ -f "$element" ]; then
                ((fichiers++))
            elif [ -d "$element" ]; then
                ((sousdirectoires++))
            fi
        done

        echo "Directoire : $repertoire"
        echo "Numero des fichiers : $fichiers"
        echo "Numero de sous repertoires : $sousdirectoires"
    else
        echo "'$repertoire' n'est pas un répertoire valide."
    fi
done

