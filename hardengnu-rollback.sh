#!/bin/bash

LOGFILE="/var/log/hardengnu-rollback.log"
ROLLBACK_DATE=$(date '+%Y-%m-%d %H:%M:%S')

log_rollback() {
    echo "$ROLLBACK_DATE - $1" | tee -a "$LOGFILE"
}

echo "🔄 Début du rollback HardenGNU..."

# 1. Réinitialiser sysctl
echo "🔧 Réinitialisation de sysctl.conf..."
cp /etc/sysctl.conf /etc/sysctl.conf.bak.hardengnu
grep -vE "hardlinks=1|symlinks=1|disable_ipv6=1|modules_disabled=1|tcp_syncookies=1|randomize_va_space=2|dmesg_restrict=1|perf_event_paranoid=2" /etc/sysctl.conf > /tmp/sysctl_clean
mv /tmp/sysctl_clean /etc/sysctl.conf
sysctl -p
log_rollback "Restauré sysctl.conf"

# 2. Réactiver IPv6
sysctl -w net.ipv6.conf.all.disable_ipv6=0
sysctl -w net.ipv6.conf.default.disable_ipv6=0
log_rollback "IPv6 réactivé"

# 3. Réactiver Bluetooth
systemctl enable bluetooth
systemctl start bluetooth
log_rollback "Service Bluetooth réactivé"

# 4. Remettre les permissions par défaut (attention : approximatif)
chmod 640 /etc/shadow
chmod 640 /etc/gshadow
log_rollback "Permissions shadow/gshadow restaurées"

# 5. Supprimer le mot de passe GRUB si présent
if [ -f /etc/grub.d/bootloader_passwd ]; then
    rm /etc/grub.d/bootloader_passwd
    log_rollback "Mot de passe GRUB supprimé"
fi

echo "✅ Rollback terminé. Voir les logs dans : $LOGFILE"
