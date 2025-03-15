setxkbmap -layout "ru,de" -option "grp:alt_shift_toggle" 2>/dev/null

# logfile="/tmp/lang_debug.log"
# echo "" > "$logfile"

update_lang() {
    local FLAG
    local LANG
    local LANG=$(xkb-switch)
    # echo "$(date) [DEBUG] LANG=$LANG" >> "$logfile"

    case "$LANG" in
        "de") FLAG="🇩🇪" ;;
        "ru") FLAG="🇷🇺" ;;
        *) FLAG="❓" ;;
    esac
    
    # echo "$(date) [DEBUG] FLAG=$FLAG" >> "$logfile"
    
    # Обновляем PS1 напрямую
    # PS1="\[\e[1;34m\]\u@\h \[\e[1;32m\]\w \[\e[1;33m\]$FLAG\[\e[0m\]\$ "
    PS1="\[\e[${PROMPT_COLOR}${PROMPT_HIGHLIGHT:+;$PROMPT_HIGHLIGHT}m\]\u@\h\[\e[0m\]:\[\e[${PROMPT_DIR_COLOR}${PROMPT_HIGHLIGHT:+;$PROMPT_HIGHLIGHT}m\]\w\[\e[0m\] $FLAG\$ "


    # echo "$(date) [DEBUG] PS1=$PS1" >> "$logfile"
}

# Удаляем PROMPT_COMMAND от Fedora, чтобы избежать конфликта
unset PROMPT_COMMAND
# echo "$(date) [DEBUG] PROMPT_COMMAND отключён" >> "$logfile"

# Запускаем цикл напрямую через PROMPT_COMMAND в основном процессе
PROMPT_COMMAND='update_lang'
# echo "$(date) [DEBUG] PROMPT_COMMAND=$PROMPT_COMMAND" >> "$logfile"
