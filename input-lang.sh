setxkbmap -layout "ru,de" -option "grp:alt_shift_toggle" 2>/dev/null

# logfile="/tmp/lang_debug.log"
# echo "" > "$logfile"

update_lang() {
    local FLAG
    local LANG
    local LANG=$(xkb-switch)
    # echo "$(date) [DEBUG] LANG=$LANG" >> "$logfile"

    case "$LANG" in
        "de") FLAG="🇩🇪" ;;  # German flag
        "ru") FLAG="🇷🇺" ;;  # Russian flag
        *) FLAG="❓" ;;      # Unknown layout
    esac
    
    # echo "$(date) [DEBUG] FLAG=$FLAG" >> "$logfile"
    
    # Update PS1 directly
    # PS1="\[\e[1;34m\]\u@\h \[\e[1;32m\]\w \[\e[1;33m\]$FLAG\[\e[0m\]\$ "
    PS1="\[\e[${PROMPT_COLOR}${PROMPT_HIGHLIGHT:+;$PROMPT_HIGHLIGHT}m\]\u@\h\[\e[0m\]:\[\e[${PROMPT_DIR_COLOR}${PROMPT_HIGHLIGHT:+;$PROMPT_HIGHLIGHT}m\]\w\[\e[0m\] $FLAG\$ "


    # echo "$(date) [DEBUG] PS1=$PS1" >> "$logfile"
}

# Remove PROMPT_COMMAND from Fedora to avoid conflicts
unset PROMPT_COMMAND
# echo "$(date) [DEBUG] PROMPT_COMMAND disabled" >> "$logfile"

# Start the loop directly through PROMPT_COMMAND in the main process
PROMPT_COMMAND='update_lang'
# echo "$(date) [DEBUG] PROMPT_COMMAND=$PROMPT_COMMAND" >> "$logfile"
