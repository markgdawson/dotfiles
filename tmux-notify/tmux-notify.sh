#!/bin/bash
export TMUX_WINDOW=$(tmux list-windows \
  -F "#{window_active} #{window_index} #{window_name}" | \
  sort | tail -n 1 | cut -d ' ' -f 2)

# variables
[[ -d ~/.tmux_notify ]] || mkdir ~/.tmux_notify
export tmuxNotify_windowFile=$( printf '%s/.tmux_notify/notify-%s' "$HOME" "$TMUX_WINDOW" )
export tmuxNotify_notificationStr="$@ in ${tmux_window}"


function tmuxCurrentWindow() {
    echo $(tmux display-message -p '#I')
}

# prompt command
function tmuxNotify_prompt() {
    TMUX_CURRENT_WINDOW=$( tmuxCurrentWindow );
    [[ -f ${tmuxNotify_windowFile} && ${TMUX_CURRENT_WINDOW} -ne ${TMUX_WINDOW} ]] && tmux display-message "prompt in window $TMUX_WINDOW"
}

# toggle tmux-notify
function tmuxNotify_toggle() {
    if [[ -f ${tmuxNotify_windowFile} ]]
    then
        tmuxNotify_off;
    else
        tmuxNotify_on;
    fi
}

# off tmux-notify
function tmuxNotify_off() {
    if [[ -f ${tmuxNotify_windowFile} ]]
    then
        rm ${tmuxNotify_windowFile}
    fi
}

# on tmux-notify
function tmuxNotify_on() {
    touch ${tmuxNotify_windowFile}
}

export PROMPT_COMMAND="${PROMPT_COMMAND}"';tmuxNotify_prompt'
