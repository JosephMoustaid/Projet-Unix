#!/bin/bash

# Vérifier le nombre de paramètres
if [ $# -eq 0 ]; then
    echo "Usage: $0 string1 file1 [string2 file2 ...]"
    exit 1
fi

# Fonction pour rechercher et afficher les lignes correspondantes dans un fichier
rechercher_lignes() {
    local chaine="$1"
    local fichier="$2"
    
    # Vérifier si le fichier existe
    if [ ! -f "$fichier" ]; then
        echo "Le fichier '$fichier' n'existe pas."
        return
    fi

    # Nombre de lignes contenant la chaîne recherchée
    local nombre_lignes=$(grep -c "$chaine" "$fichier")

    # Afficher le nom du fichier et le nombre de lignes contenant la chaîne recherchée
    echo "Nom du fichier : $fichier"
    echo "Nombre de lignes contenant la chaîne '$chaine' : $nombre_lignes"
    
    # Afficher les lignes contenant la chaîne recherchée avec leurs numéros dans le fichier
    grep -n "$chaine" "$fichier"
}

# Boucler sur les couples de paramètres
for (( i = 1; i <= $#; i+=2 )); do
    chaine="${!i}"
    fichier="${@:i+1:1}"
    rechercher_lignes "$chaine" "$fichier"
    echo
done
