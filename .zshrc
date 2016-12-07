## Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DEFAULT_USER=$(whoami)
. ~/.zshenv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pure"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
if [[ $OSTYPE == 'darwin'* ]] then
    plugins=(plugins osx macports)
fi

# User configuration

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=10

alias rl='readlink -f'
alias gap='git add -p'
alias grep='grep --color=auto'

# output colors
export RCol='\e[0m'    # Text Reset

#      Regular                Bold                    Underline               High Intensity          BoldHigh Intens          Background              High Intensity Backgrounds
export Bla='\e[0;30m'; export BBla='\e[1;30m'; export UBla='\e[4;30m'; export IBla='\e[0;90m'; export BIBla='\e[1;90m'; export On_Bla='\e[40m'; export On_IBla='\e[0;100m';
export Red='\e[0;31m'; export BRed='\e[1;31m'; export URed='\e[4;31m'; export IRed='\e[0;91m'; export BIRed='\e[1;91m'; export On_Red='\e[41m'; export On_IRed='\e[0;101m';
export Gre='\e[0;32m'; export BGre='\e[1;32m'; export UGre='\e[4;32m'; export IGre='\e[0;92m'; export BIGre='\e[1;92m'; export On_Gre='\e[42m'; export On_IGre='\e[0;102m';
export Yel='\e[0;33m'; export BYel='\e[1;33m'; export UYel='\e[4;33m'; export IYel='\e[0;93m'; export BIYel='\e[1;93m'; export On_Yel='\e[43m'; export On_IYel='\e[0;103m';
export Blu='\e[0;34m'; export BBlu='\e[1;34m'; export UBlu='\e[4;34m'; export IBlu='\e[0;94m'; export BIBlu='\e[1;94m'; export On_Blu='\e[44m'; export On_IBlu='\e[0;104m';
export Pur='\e[0;35m'; export BPur='\e[1;35m'; export UPur='\e[4;35m'; export IPur='\e[0;95m'; export BIPur='\e[1;95m'; export On_Pur='\e[45m'; export On_IPur='\e[0;105m';
export Cya='\e[0;36m'; export BCya='\e[1;36m'; export UCya='\e[4;36m'; export ICya='\e[0;96m'; export BICya='\e[1;96m'; export On_Cya='\e[46m'; export On_ICya='\e[0;106m';
export Whi='\e[0;37m'; export BWhi='\e[1;37m'; export UWhi='\e[4;37m'; export IWhi='\e[0;97m'; export BIWhi='\e[1;97m'; export On_Whi='\e[47m'; export On_IWhi='\e[0;107m';

if [[ "$TERM" == "dumb" ]]
then
    PS1="> "
fi

# for runtests
export TESSTBINDIR="${HOME}/Source/maxwell-nefem/bin/debug"
export BENCHBINDIR="${HOME}/Source/rubens-modified-code/maxwell-nefem/bin/debug"

if [[ "$TERM" != "screen" ]]
then
    #tmux new-session -A -s main
fi

export EDITOR='~/bin/ec'

function vpn-disconnect {
    /usr/bin/env osascript <<-EOF
tell application "System Events"
        tell current location of network preferences
                set VPN to service "SwanseaUni-VPN" -- your VPN name here
                if exists VPN then disconnect VPN
        end tell
end tell
return
EOF
}

if [[ "$(hostname)" == "mark-ixtreme-M5860" ]] then
  export MATLAB_JAVA='/usr/lib/jvm/java-8-oracle/jre'
fi

if [[ $OSTYPE == 'darwin'* ]] then
    export PATH=/usr/local/texlive/2015/bin/universal-darwin:/opt/local/libexec/gnubin/:$PATH
    INTELINITSCRIPT="/opt/intel/composerxe/bin/compilervars.sh intel64"
else
    INTELINITSCRIPT="/opt/intel/composer_xe_2013_sp1/bin/compilervars.sh intel64"
    PATH="/opt/intel/composer_xe_2013_sp1.2.144/bin/intel64:${PATH}"
    alias open='xdg-open'
fi
[[ -f $INTELINITSCRIPT ]] && . $INTELINITSCRIPT
