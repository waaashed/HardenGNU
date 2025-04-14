# 🛡️ HardenGNU

**Script de durcissement GNU/Linux**  
Basé sur les recommandations de l'ANSSI (v2.0)

---

## 📌 Description

**HardenGNU** est un script interactif de durcissement conçu pour renforcer la sécurité des systèmes GNU/Linux, en appliquant des configurations inspirées du guide de l’[ANSSI v2.0](https://www.ssi.gouv.fr/uploads/2020/01/NP_M_Referentiel_GNU-Linux_v2.0.pdf).

Il propose plusieurs niveaux de sécurisation, s’adaptant aux besoins de chaque environnement : poste utilisateur, serveur, système critique, etc.

---

## ⚙️ Fonctionnalités principales

- 🔒 Application de règles sysctl et permissions sécurisées
- 🥱 Désactivation de services et modules non essentiels (Bluetooth, IPv6, etc.)
- 🔐 Protection du mot de passe GRUB
- 🔧 Menu interactif avec aperçu des actions avant exécution
- 🫰 **Script de rollback** complet pour restaurer l’état initial
- 📖 **Page de man** fournie (`man hardengnu`) pour une intégration propre

---

## 📁 Niveaux de durcissement disponibles

| Niveau         | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| **1 - Minimal**        | Mises à jour + durcissement basique (/etc/shadow, dmesg, ASLR)         |
| **2 - Intermédiaire**  | + Désactivation Bluetooth + TCP syncookies                            |
| **3 - Renforcé**       | + Désactivation IPv6 et modules noyau                                 |
| **4 - Élevé**          | + Hardening des liens symboliques et ajout d’un mot de passe GRUB     |

---

## 🚀 Installation

```bash
git clone https://github.com/waaashed/HardenGNU.git
cd HardenGNU
chmod +x hardengnu.sh hardengnu-rollback.sh
sudo ./hardengnu.sh
```

---

## 🔄 Rollback

Si besoin, un script de restauration est disponible pour annuler les modifications effectuées par HardenGNU :

```bash
sudo ./hardengnu-rollback.sh
```

### 🔁 Ce que le rollback rétablit :
- 🔧 Les paramètres `sysctl` modifiés
- 🔐 Les permissions d'origine sur `/etc/shadow` et `/etc/gshadow`
- 📶 Le service **Bluetooth** (réactivé)
- 🌐 Le protocole **IPv6** (réactivé)
- 🔑 Le mot de passe GRUB (supprimé s’il avait été configuré)

> Toutes les actions sont journalisées dans `/var/log/hardengnu-rollback.log`.

---

## 🖥️ Compatibilité

- ✅ Debian 10/11/12
- ✅ Ubuntu 20.04 / 22.04 / 24.04

---
