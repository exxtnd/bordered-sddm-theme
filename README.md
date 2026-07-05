<h1 align="center"> Bordered [Qt5 SDDM Theme] </h1>

> [!IMPORTANT]
>THIS PROJECT IS IN DEVELOPMENT NOW | ПРОЕКТ В СТАДИИ ДОРАБОТКИ

<p align="center">
  <font size="6">
    <a href="https://github.com/exxtnd/bordered-sddm-theme/blob/main/README_RU.md">RU version of README</a>
  </font>
</p>

## Features
* Without unnecessary dependencies of KDE 
* User's choice when clicking on the avatar
* Quick access to session management
* Other familiar functions

## Screenshot
<img width="1366" height="768" alt="Screenshot_2026-06-03-04-21-48" src="https://github.com/user-attachments/assets/56f3860a-b650-4714-96dc-c95a1d36d5ac" />


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
---
Please report me in «issues» if you’ll see some bugs
