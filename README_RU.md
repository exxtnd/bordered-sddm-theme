<div align="center">

<br>
<h3> Bordered [Qt5 SDDM Theme] </h3>

<img width="1366" height="768" alt="Screenshot_2026-06-03-04-21-48" src="https://github.com/user-attachments/assets/56f3860a-b650-4714-96dc-c95a1d36d5ac" />

<h6> Минималистиная тема для SDDM, базирующаяся на Qt5 и не привязанная к модулям окружения KDE</h6>

[![License](https://img.shields.io/github/license/igmunv/cremniy?color=orange&style=flat-square)](LICENSE)
<br>
[![Qt 5](https://img.shields.io/badge/Qt-5.15.16-41CD52?style=flat-square&logo=qt)](https://qt.io)
[![DE-Agnostic](https://img.shields.io/badge/DE--Agnostic-Pure_Qt-8A2BE2?style=flat-square&logo=linux)](https://github.com)
[![Dependencies](https://img.shields.io/badge/KDE_Deps-None_/_Lightweight-ff69b4?style=flat-square&logo=speedtest)]()
[![Font](https://shields.io/badge/Font-Audiowide-ff5252?style=flat-square&logo=googlefonts&logoColor=white)](https://fonts://)

[English](https://github.com/S0LYER/bordered-sddm-theme/blob/main/README.md) • Русский

</div>

<br>

## Особенности
* Без привязки к модулям окружения KDE
* Выбрать пользователя можно кликнув по аватарке
* Доступ к смене сессии имеется
* Другой базовый функционал

> [!NOTE]
>  Шрифт, использующийся в теме: [Audiowide font from Google Fonts](https://fonts.google.com/specimen/Audiowide?preview.script=Latn)

## Установка
```
git clone https://github.com/exxtnd/bordered-sddm-theme ./border

cd border

sudo cp -r bordered /usr/share/sddm/themes/ 
```
```
# для применения темы, нужно вручную отредактировать /etc/sddm.conf и /etc/sddm.conf.d/sddm.conf
# если отсутствуют - создайте.
# Впишите в графу "[Theme]" название директории темы, или (если файлы пустые) вставьте полностью этот блок:

[Theme]
Current=bordered 
```

## Участие в разработке

Вклад в проект **приветствуется**.

Будь то исправление ошибок, новая функциональность или улучшение документации — открывайте issue или отправляйте pull request.

## Лицензия

Распространяется на условиях, описанных в [LICENSE](LICENSE).
