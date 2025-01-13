# 🤖 ADB & Fastboot Installer++ v2.9.5 - [AFI++]

---

### 📙 Informations:

Auto ADB Installer (ADB & Fastboot Installer) [AFI++] is the first ever self-updating debugging tool that automatically fetches latest libraries, drivers and executables - with every new API release, keeping it always up to date with latest Android, ADB & Fastboot features!

Additionally, with this open-source, self-maintaining repository you always have a reliable ADB installer source, without having to search for links to hosts that are down or files that have expired, among tons of a malware and viruses.

### 📕 Updated API and Drivers:

**Android ADB and Fastboot Installer++ v2.9.5**<br>
This is probaly the only installer with updated ADB libraries to the **latest Android SDK/NDK** and **Android API 35 / R15**.<br>
You can start the SDK Update Action by using built-in GitHub Action - **`Update Android SDK`** and the repository will do the rest!

### 📒 Automated Workflow:

Use the predefined **GitHub Actons**, to simply update the SDK, publish branch or build the project!<br>
Work has never been so easy!

##### Latest SDK Update Status: 

[![Update SDK](https://github.com/ovsky/adb-fastboot-installer/actions/workflows/update-android-sdk.yml/badge.svg)](https://github.com/ovsky/adb-fastboot-installer/actions)

### 📗 Idea:

The idea behind the **AFI++** is:<br>
_Simply the best, always up-to-date, totally reliable, open-source, and easy to use version of the system-wide `ADB and Fastboot`._


### 📚 Misc:
##### **- ADBO Functionality - added in v2.9.0:**
[ADBO](https://github.com/ovsky/ADBO) is the *Meta Quest* fork of ADB which is way waster in many situations and uses file-streaming.
You can use it along existing ADB by our implementation - simply using the `adbo` command instead of `adb` to acess some of the features.

##### **- Server Ready - Silent Install - added in 2.8.0:**
**AFI++** has built-indetection of any kayboard interactions. Thanks to this, our tool is fully server-ready and can be provided in configuration backages - beacause, when needed, it can install itself completely automatically without any outside decisions needed.

##### **- Fully Secure - Encryption - added in 1.4.7:**
We are using encryption in every stage of feching the NDK/SDK sources. All connections are based on the GitHub Secrets, so there is no possibility that some of sources or targets will be hacked or above all replaced by a hacker, to push some potential malware. So, it makes AFI++ complete secure solution! 

---

# 📘 [ Index ]()

- 🌟 [1. Installation](#installation)
- ⚔️ [2. Features](#features)
- 🐧 [3. Author](#author)

#

---

#

# [🌟 ️1. Installation ](#installation)

##### Install ways:

You can install using the repository source or download the latest pre-built release from:
https://github.com/ovsky/adb-fastboot-installer/releases

###### Source:

1. Simply, clone or download the repository, and run the:
   `install.bat` script (as administrator).
2. During the installation process, type [Y/N] [Yes/No] to specify your installation preferences.
3. Everything is ready!

###### Pre-build:

1. Download and unpack latest release, then open the unpacked directory.
2. Run `adb-installer++.exe`.
3. During the installation process, type [Y/N] [Yes/No] to specify your installation preferences.
4. Everything is ready!

###### Arguments:

1. Use the `--silent` argument if you want to perform a fully automatic, silent installation.
2. Use the `--silent-no-driver` if you want to perform a fully automatic, silent installation without the ADB driver.

###### Check:

To check installation, restart your terminal/CMD and type:
`adb version`.

Your result should be something like:

```
Android Debug Bridge version 1.0.41
Version 31.0.3-7562133
Installed as C:\adb\adb.exe
```

If not try to installing it once again.

---

# [⚔️ 2. Features ](#features)

When setting up Linux on your Android device, you have several options to choose from. Understanding the differences between them can help you decide which environment best suits your needs:

| Feature       | Value                              |
| ------------- | ---------------------------------- |
| 🐥 Small Size | 📁 9MB                             |
| 🐅 Super Fast | ⏳15 Secound Install               |
| 🐉 All-in-One | 📦 ADB + Fastboot + Drivers        |
| 🐈 Easy       | 📖 One-click-run                   |
| 🪼 Open Source | ✅ Latest SDK, NDK and Drivers     |
| 🐳 Clean      | 🔻 ADB and Drivers from Google SDK |

---

# [🐧 ️3. Author](#author)

This repository is inspired on the original `15 seconds ADB Installer` script from famous `Snoop05`, who deserves many thanks!

Author of this repo, actions, workflow, installer and updates is `ovsky`, known profesionally as Przemysław Orłowski - owner of this GitHub Account and [`orlowski.works`](http://orlowski.works/) portfolio site (check it!).
I have updated the installer files to the latest Android SDK/NDK and Android API 35 / R15.

#

---
