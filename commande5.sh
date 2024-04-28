#!/bin/bash

# Vérifier le nombre de paramètres
if [ $# -eq 0 ]; then
    echo "Usage: $0 directory1 [directory2 ...]"
    exit 1
fi

# Fonction pour rendre exécutables les scripts commençant par "sh"
rendre_executables() {
    local repertoire="$1"
    # Parcourir tous les fichiers dans le répertoire
    for fichier in "$repertoire"/*; do
        if [ -f "$fichier" ] && [[ "$fichier" == *".sh" ]]; then
            chmod +x "$fichier"
        fi
    done
}

# Fonction pour copier les fichiers .c et .p dans $HOME/sauve
copier_fichiers() {
    local repertoire="$1"
    local sauvegarde="$HOME/sauve"
    # Créer le répertoire de sauvegarde s'il n'existe pas
    mkdir -p "$sauvegarde"
    # Copier les fichiers .c et .p dans le répertoire de sauvegarde
    cp "$repertoire"/*.c "$repertoire"/*.p "$sauvegarde" 2>/dev/null
}

# Fonction pour déplacer les rapports antérieurs à l'année 2000
deplacer_rapports() {
    local repertoire="$1"
    local archives="$HOME/archives"
    # Créer le répertoire d'archives s'il n'existe pas
    mkdir -p "$archives"
    # Déplacer les rapports antérieurs à l'année 2000
    find "$repertoire" -maxdepth 1 -type f -name "*.rapport" -exec bash -c '
        for fichier; do
            annee=$(echo "$fichier" | grep -oE "[0-9]{4}")
            if [ "$annee" -lt 2000 ]; then
                mv "$fichier" "$archives/$(basename "$fichier").old"
            fi
        done
    ' bash {} +
}

# Boucle sur chaque répertoire fourni en argument
for repertoire in "$@"; do
    # Vérifier si le répertoire existe
    if [ -d "$repertoire" ]; then
        rendre_executables "$repertoire"
        copier_fichiers "$repertoire"
        deplacer_rapports "$repertoire"
    else
        echo "'$repertoire' n'est pas un répertoire valide."
    fi
done

