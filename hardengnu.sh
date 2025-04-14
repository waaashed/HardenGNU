#!/bin/bash

# Définition des couleurs
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
RESET="\033[0m"

# Fichier de log
LOGFILE="/var/log/hardengnu.log"

# Fonction pour écrire les actions dans le fichier de log
log_action() {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" | tee -a $LOGFILE
}

# Fonction pour afficher la bannière
afficher_banniere() {
    clear
    echo -e "${BLUE}=================================================================================${RESET}"
    echo -e "${YELLOW}██╗  ██╗ █████╗ ██████╗ ██████╗ ███████╗███╗   ██╗ ██████╗ ███╗   ██╗██╗   ██╗${RESET}"
    echo -e "${YELLOW}██║  ██║██╔══██╗██╔══██╗██╔══██╗██╔════╝████╗  ██║██╔════╝ ████╗  ██║██║   ██║${RESET}"
    echo -e "${YELLOW}███████║███████║██████╔╝██║  ██║█████╗  ██╔██╗ ██║██║  ███╗██╔██╗ ██║██║   ██║${RESET}"
    echo -e "${YELLOW}██╔══██║██╔══██║██╔══██╗██║  ██║██╔══╝  ██║╚██╗██║██║   ██║██║╚██╗██║██║   ██║${RESET}"
    echo -e "${YELLOW}██║  ██║██║  ██║██║  ██║██████╔╝███████╗██║ ╚████║╚██████╔╝██║ ╚████║╚██████╔╝${RESET}"
    echo -e "${YELLOW}╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝ ${RESET}"
    echo -e "${BLUE}=================================================================================${RESET}"
    echo -e "${GREEN}                Script de durcissement GNU/Linux"
    echo -e "           Basé sur les recommandations ANSSI v2.0"
    echo -e "----------------------------------------------------------------"
    echo -e "             Auteur : s0d3ep | Date : $(date '+%Y-%m-%d')"
    echo -e "----------------------------------------------------------------${RESET}"
    echo ""
}

# Fonction pour expliquer les niveaux de sécurité
expliquer_niveaux() {
    echo -e "${GREEN}Niveaux de durcissement disponibles dans HardenGNU :${RESET}"
    echo -e "${YELLOW}1) Niveau minimal       : Sécurisation de base, recommandée pour tout système.${RESET}"
    echo -e "${YELLOW}2) Niveau intermédiaire : Renforcement réseau et services système.${RESET}"
    echo -e "${YELLOW}3) Niveau renforcé      : Sécurité accrue, idéal pour des systèmes critiques.${RESET}"
    echo -e "${YELLOW}4) Niveau élevé         : Sécurité maximale, adapté aux environnements sensibles.${RESET}"
    echo ""
}

# Fonction d'affichage des changements avant application
afficher_changements() {
    case $1 in
        1)
            echo -e "\n\033[1;35mLes changements suivants seront appliqués à votre système :\033[0m"
            echo -e "--------------------------------------------"
            echo -e "• Mise à jour des paquets (apt-get update et upgrade)."
            echo -e "• Activation de la randomisation de l'espace d'adresses (kernel.randomize_va_space=2)."
            echo -e "• Restriction des messages d'erreur noyau (kernel.dmesg_restrict=1)."
            echo -e "• Protection des fichiers /etc/shadow et /etc/gshadow (chmod 600)."
            ;;
        2)
            echo -e "\n\033[1;35mLes changements suivants seront appliqués à votre système :\033[0m"
            echo -e "--------------------------------------------"
            echo -e "• Mise à jour des paquets (apt-get update et upgrade)."
            echo -e "• Activation de la randomisation de l'espace d'adresses (kernel.randomize_va_space=2)."
            echo -e "• Restriction des messages d'erreur noyau (kernel.dmesg_restrict=1)."
            echo -e "• Protection des fichiers /etc/shadow et /etc/gshadow (chmod 600)."
            echo -e "• Désactivation et arrêt du service Bluetooth (systemctl disable bluetooth, systemctl stop bluetooth)."
            echo -e "• Activation des cookies TCP (net.ipv4.tcp_syncookies=1)."
            ;;
        3)
            echo -e "\n\033[1;35mLes changements suivants seront appliqués à votre système :\033[0m"
            echo -e "--------------------------------------------"
            echo -e "• Mise à jour des paquets (apt-get update et upgrade)."
            echo -e "• Activation de la randomisation de l'espace d'adresses (kernel.randomize_va_space=2)."
            echo -e "• Restriction des messages d'erreur noyau (kernel.dmesg_restrict=1)."
            echo -e "• Protection des fichiers /etc/shadow et /etc/gshadow (chmod 600)."
            echo -e "• Désactivation et arrêt du service Bluetooth (systemctl disable bluetooth, systemctl stop bluetooth)."
            echo -e "• Activation des cookies TCP (net.ipv4.tcp_syncookies=1)."
            echo -e "• Désactivation des modules noyau (kernel.modules_disabled=1)."
            echo -e "• Désactivation de l'IPv6 (net.ipv6.conf.all.disable_ipv6=1, net.ipv6.conf.default.disable_ipv6=1)."
            ;;
        4)
            echo -e "\n\033[1;35mLes changements suivants seront appliqués à votre système :\033[0m"
            echo -e "--------------------------------------------"
            echo -e "• Mise à jour des paquets (apt-get update et upgrade)."
            echo -e "• Activation de la randomisation de l'espace d'adresses (kernel.randomize_va_space=2)."
            echo -e "• Restriction des messages d'erreur noyau (kernel.dmesg_restrict=1)."
            echo -e "• Protection des fichiers /etc/shadow et /etc/gshadow (chmod 600)."
            echo -e "• Désactivation et arrêt du service Bluetooth (systemctl disable bluetooth, systemctl stop bluetooth)."
            echo -e "• Activation des cookies TCP (net.ipv4.tcp_syncookies=1)."
            echo -e "• Désactivation des modules noyau (kernel.modules_disabled=1)."
            echo -e "• Désactivation de l'IPv6 (net.ipv6.conf.all.disable_ipv6=1, net.ipv6.conf.default.disable_ipv6=1)."
            echo -e "• Activation de la protection des liens symboliques et hardlinks (fs.protected_symlinks=1, fs.protected_hardlinks=1)."
            echo -e "• Protection du mot de passe GRUB (grub-mkpasswd-pbkdf2)."
            ;;
        *)
            echo "Choix invalide."
            exit 1
            ;;
    esac
    echo ""
    read -p "Voulez-vous appliquer ces changements ? (O/N) : " confirmation
    if [[ "$confirmation" =~ ^[oO]$ ]]; then
        return 0
    else
        echo -e "${RED}Opération annulée.${RESET}"
        exit 0
    fi
}

# Fonctions de durcissement
durcissement_minimal() {
    log_action "Application des configurations de niveau minimal"
    apt-get update && apt-get upgrade -y
    sysctl -w kernel.randomize_va_space=2
    sysctl -w kernel.dmesg_restrict=1
    echo "kernel.randomize_va_space=2" >> /etc/sysctl.conf
    echo "kernel.dmesg_restrict=1" >> /etc/sysctl.conf
    chmod 600 /etc/shadow
    chmod 600 /etc/gshadow
    log_action "Durcissement minimal appliqué avec succès"
}

durcissement_intermediaire() {
    durcissement_minimal
    log_action "Application des configurations de niveau intermédiaire"
    sysctl -w kernel.perf_event_paranoid=2
    sysctl -w net.ipv4.tcp_syncookies=1
    echo "kernel.perf_event_paranoid=2" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_syncookies=1" >> /etc/sysctl.conf
    systemctl disable bluetooth
    systemctl stop bluetooth
    log_action "Durcissement intermédiaire appliqué avec succès"
}

durcissement_renforce() {
    durcissement_intermediaire
    log_action "Application des configurations de niveau renforcé"
    echo "kernel.modules_disabled=1" >> /etc/sysctl.conf
    sysctl -w kernel.modules_disabled=1
    echo "net.ipv6.conf.all.disable_ipv6=1" >> /etc/sysctl.conf
    echo "net.ipv6.conf.default.disable_ipv6=1" >> /etc/sysctl.conf
    sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1
    log_action "Durcissement renforcé appliqué avec succès"
}

durcissement_eleve() {
    durcissement_renforce
    log_action "Application des configurations de niveau élevé"
    echo "fs.protected_symlinks=1" >> /etc/sysctl.conf
    echo "fs.protected_hardlinks=1" >> /etc/sysctl.conf
    sysctl -w fs.protected_symlinks=1
    sysctl -w fs.protected_hardlinks=1
    grub-mkpasswd-pbkdf2 | tee /etc/grub.d/bootloader_passwd
    log_action "Durcissement élevé appliqué avec succès"
}

# Menu interactif
afficher_banniere
expliquer_niveaux
echo -e "${GREEN}----------------------------------------------------------------${RESET}"
read -p "Sélectionnez le niveau de durcissement à appliquer (1-4). Vous pourrez vérifier les changements avant de confirmer : " CHOIX

# Afficher les changements avant d'appliquer
afficher_changements $CHOIX

# Application du durcissement selon le niveau choisi
case $CHOIX in
    1)
        durcissement_minimal
        ;;
    2)
        durcissement_intermediaire
        ;;
    3)
        durcissement_renforce
        ;;
    4)
        durcissement_eleve
        ;;
    *)
        echo -e "${RED}Choix invalide, veuillez relancer le script.${RESET}"
        exit 1
        ;;
esac

echo -e "${GREEN}================================================================${RESET}"
echo -e "${GREEN}        Durcissement effectué avec succès via HardenGNU !${RESET}"
echo -e "${GREEN}       Consultez $LOGFILE pour les détails.${RESET}"
echo -e "${GREEN}================================================================${RESET}"
exit 0
