# Language-Indicator-in-Bash-Prompt

##  📝 Description | Описание
```bash
user@host:~/git_repos/Language-Indicator-in-Bash-Prompt 🇩🇪 $ touch file
user@host:~/git_repos/Language-Indicator-in-Bash-Prompt 🇷🇺 $ touch file
```

🔹 **The problem of typing incorrect characters due to an incorrect keyboard layout is common among users who switch between layouts. Constantly looking at another side of the screen to verify the active layout is inconvenient, so this solution reflects the current layout directly in the console.**\
Очень часто случается у пользователей, использующих разные раскладки, что пишутся не верные символы. Постоянно смотреть на другую сторону экрана, перепроверять активный язык затруднительно, поэтому это решение для того, чтобы раскладка отражалась сразу в консоли.

💡 **The solution is implemented on Fedora Wayland KDE, but you can adapt it for other operating systems. You can also use any keyboard layouts you prefer.**\
Решение реализовано на Fedora Wayland KDE, но вы можете адаптировать его под другие ОС. Так же вы можете, конечно же, использовать те раскладки, которые пожелаете.



---

## 🚀 Feature
✅ **Displays a flag based on the current keyboard layout (for example: `🇩🇪` for German, `🇷🇺` for Russian).**\
Отображает флаг в зависимости от текущей раскладки клавиатуры (например: 🇩🇪 для немецкого, 🇷🇺 для русского).

---

## 🛠️ Installation

1. Clone the repository:
```bash
git clone https://github.com/sonaxpro/Dynamic-Bash-Prompt.git
```

2. Add the following lines to your `~/.bashrc` or `~/.profile`:

```bash
source /patch/Dynamic-Bash-Prompt/input-lang.sh
```

3. Apply the changes:
```bash
source ~/.bashrc
```

---

## ⚙️ Configuration | Конфигурация

**You can customize the keyboard layouts by modifying the `setxkbmap` command:**\
*Вы можете настроить раскладки клавиатуры, изменив команду `setxkbmap`:*

```bash
setxkbmap -layout "ru,de" -option "grp:alt_shift_toggle"
```

Add your preferred keyboard layouts (e.g., `us`, `de`, `ru`) in the order you want them to be used.\
*Добавьте предпочитаемые раскладки клавиатуры (например, `us`, `de`, `ru`) в порядке их использования.*

**Example:** | *Пример:*

```bash
setxkbmap -layout "us,de,fr" -option "grp:alt_shift_toggle"
```

You also need to update the `update_lang` function to add the appropriate flags for the new layouts.\
*Также необходимо обновить функцию `update_lang`, чтобы добавить соответствующие флаги для новых раскладок.*

Example:

```bash
case "$LANG" in
    "de") FLAG="🇩🇪" ;;
    "ru") FLAG="🇷🇺" ;;
    "us") FLAG="🇺🇸" ;;
    "fr") FLAG="🇫🇷" ;;
    *) FLAG="❓" ;;
esac
```

---

## 🔍 Example Output | Пример вывода

```bash
user@hostname:~ 🇩🇪 $
```

---

## 🧪 Compatibility | Совместимость

**Tested on:**\
➡️ *Протестировано на:*

- Fedora


---

## 📄 License | Лицензия

This project is licensed under the **MIT License**.\
➡️ *Этот проект распространяется по лицензии **MIT**.*


---


## 🌟 **Star the repo if you find it useful!**

➡️ *Поставьте звезду репозиторию, если считаете его полезным!*
