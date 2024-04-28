#!/bin/bash

# Fonction pour afficher le menu
afficher_menu() {
    echo "Menu:"
    echo "1. Commande 1"
    echo "2. Commande 2"
    echo "3. Commande 3"
    echo "4. Commande 4"
    echo "5. Commande 5"
    echo "6. Commande 6"
    echo "7. Quitter"
    echo
}

# Boucle principale
while true; do
    afficher_menu

    # Lire l'entrée utilisateur
    read -p "Choisissez une commande (1-7) : " choix

    # Vérifier l'entrée utilisateur
    case $choix in
        1)
            read -p "Entrez les noms de répertoires : " repertoires
            ./commande1.sh $repertoires
            ;;
        2)
            read -p "Entrez une date chiffrée : " date_chiffree
            ./commande2.sh $date_chiffree
            ;;
        3)
            read -p "Entrez des nombres séparés par des espaces : " nombres
            ./commande3.sh $nombres
            ;;
        4)
            read -p "Entrez des noms de fichiers : " fichiers
            ./commande4.sh $fichiers
            ;;
        5)
            read -p "Entrez des noms de répertoires : " repertoires
            ./commande5.sh $repertoires
            ;;
        6)
            read -p "Entrez des couples (chaine de caractères fichier) : " couples
            ./commande6.sh $couples
            ;;
        7)
            echo "Au revoir!"
            exit 0
            ;;
        *)
            echo "Choix invalide. Veuillez saisir un nombre entre 1 et 7."
            ;;
    esac
done
