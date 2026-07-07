<div align="center">

<br>
<h3> Bordered [Qt5 SDDM Theme] </h3>

<img width="1366" height="768" alt="Screenshot_2026-06-03-04-21-48" src="https://github.com/user-attachments/assets/56f3860a-b650-4714-96dc-c95a1d36d5ac" />

<h6> Minimalistic theme for SDDM based on Qt5 without unnecessary KDE dependencies</h6>

[![License](https://img.shields.io/github/license/igmunv/cremniy?color=orange&style=flat-square)](LICENSE)
<br>
[![Qt 5](https://img.shields.io/badge/Qt-5.15.16-41CD52?style=flat-square&logo=qt)](https://qt.io)
[![DE-Agnostic](https://img.shields.io/badge/DE--Agnostic-Pure_Qt-8A2BE2?style=flat-square&logo=linux)](https://github.com)
[![Dependencies](https://img.shields.io/badge/KDE_Deps-None_/_Lightweight-ff69b4?style=flat-square&logo=speedtest)]()
[![Font](https://shields.io/badge/Font-Audiowide-ff5252?style=flat-square&logo=googlefonts&logoColor=white)](https://fonts://)

English • [Русский](https://github.com/exxtnd/bordered-sddm-theme/blob/main/README_RU.md)

</div>

<br>

## Features
* Without unnecessary dependencies of KDE 
* User's choice when clicking on the avatar
* Quick access to session management
* Other familiar functions


> [!NOTE]
>  The font used in this theme: [Audiowide font from Google Fonts](https://fonts.google.com/specimen/Audiowide?preview.script=Latn)

## Installation
```
git clone https://github.com/exxtnd/bordered-sddm-theme ./border

cd border

sudo cp -r bordered /usr/share/sddm/themes/ 
```
```
# to apply this theme, you should edit /etc/sddm.conf and /etc/sddm.conf.d/sddm.conf
# if they dont exist, create and copy this into them

[Theme]
Current=bordered 
```

## Contributing

Contributions are **welcome and encouraged**.

Whether it's a bug fix, a new feature, or an improvement to documentation — feel free to open an issue or submit a pull request.

## License

Distributed under the terms described in [LICENSE](LICENSE).
