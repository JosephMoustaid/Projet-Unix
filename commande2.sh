#!/bin/bash

# Tableau des jours de la semaine
jours=("Lundi" "Mardi" "Mercredi" "Jeudi" "Vendredi" "Samedi" "Dimanche")

# Tableau des mois de l'année
mois=("janvier" "février" "mars" "avril" "mai" "juin" "juillet" "août" "septembre" "octobre" "novembre" "décembre")

# Fonction pour obtenir le jour de la semaine
get_jour_semaine() {
    local jour=$1
    local mois=$2
    local annee=$3

    # Conversion de la date en timestamp UNIX
    local timestamp=$(date -d "$annee-$mois-$jour" +%s)

    # Jour de la semaine (0 pour dimanche, 1 pour lundi, ..., 6 pour samedi)
    local jour_semaine=$(( (timestamp / (24 * 60 * 60)) % 7 ))

    # Affichage du jour de la semaine
    echo "${jours[$jour_semaine]}"
}

# Récupérer les arguments
jour=$1
mois=$2
annee=$3

# Afficher la date en toutes lettres
echo "$(get_jour_semaine $jour $mois $annee) $jour ${mois[$mois - 1]} $annee"
