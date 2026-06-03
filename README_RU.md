# Bordered [Qt5 SDDM Theme] 
>THIS PROJECT IS IN DEVELOPMENT NOW | ПРОЕКТ В СТАДИИ ДОРАБОТКИ

[README_EN_VER](https://github.com/exxtnd/bordered-sddm-theme/blob/main/README.md)

Ч/Б минималистичная тема для SDDM (Qt5).

## Особенности
* Без привязки к модулям окружения KDE
* Выбрать пользователя можно кликнув по аватарке
* Доступ к смене сессии имеется
* Другой базовый функционал

## Превью
<img width="1366" height="768" alt="Screenshot_2026-06-03-04-21-48" src="https://github.com/user-attachments/assets/be9c607c-595d-4323-8fc4-f3efcd3e1388" />

>Используемый в теме шрифт уже помещен в ее папку. Тем не менее, ссылка на шрифт, откуда брал: [Шрифт Audiowide с Google Fonts](https://fonts.google.com/specimen/Audiowide?preview.script=Latn)

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
----
Пожалуйста, пишите в "Issues" если увидите баги
