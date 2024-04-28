#!/bin/bash

compter_nombres() {
    local compte_pairs=0
    local compte_impairs=0
    local compte_negatifs=0
    local compte_nuls=0
    local compte_positifs=0

    for nombre in "$@"; do
        # Vérifier si le nombre est pair
        if [ $((nombre % 2)) -eq 0 ]; then
            ((compte_pairs++))
        else
            ((compte_impairs++))
        fi

        # Vérifier si le nombre est négatif, nul ou positif
        if [ $nombre -lt 0 ]; then
            ((compte_negatifs++))
        elif [ $nombre -eq 0 ]; then
            ((compte_nuls++))
        else
            ((compte_positifs++))
        fi
    done

    echo "Nombre de nombres pairs : $compte_pairs"
    echo "Nombre de nombres impairs : $compte_impairs"
    echo "Nombre de nombres négatifs : $compte_negatifs"
    echo "Nombre de nombres nuls : $compte_nuls"
    echo "Nombre de nombres positifs : $compte_positifs"
}

# Appeler la fonction pour compter les nombres
compter_nombres "$@"
