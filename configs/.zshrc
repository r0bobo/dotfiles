# vim:foldmethod=marker:foldlevel=0:foldenable

# ZSH Config
# ==========

# DUMB TERMINALS {{{
# ==============================================================================
# Disable zsh features when using "dumb" terminal to avoid issues with Emacs Tramp
[[ "$TERM" == "dumb" ]] && unsetopt zle && PS1='$ ' && return

# }}}
# HOST SPECIFIC {{{
# ==============================================================================
if [[ `whoami` == "deatod" ]]; then
    # create a zkbd compatible hash;
    # to add other keys to this hash, see: man 5 terminfo
    typeset -A key

    key[Home]=${terminfo[khome]}
    key[End]=${terminfo[kend]}
    key[Insert]=${terminfo[kich1]}
    key[Backspace]=${terminfo[kbs]}
    key[Delete]=${terminfo[kdch1]}
    key[Up]=${terminfo[kcuu1]}
    key[Down]=${terminfo[kcud1]}
    key[Left]=${terminfo[kcub1]}
    key[Right]=${terminfo[kcuf1]}
    key[PageUp]=${terminfo[kpp]}
    key[PageDown]=${terminfo[knp]}

    # setup key accordingly
    [[ -n "${key[Home]}"      ]] && bindkey "${key[Home]}"      beginning-of-line
    [[ -n "${key[End]}"       ]] && bindkey "${key[End]}"       end-of-line
    [[ -n "${key[Insert]}"    ]] && bindkey "${key[Insert]}"    overwrite-mode
    [[ -n "${key[Backspace]}" ]] && bindkey "${key[Backspace]}" backward-delete-char
    [[ -n "${key[Delete]}"    ]] && bindkey "${key[Delete]}"    delete-char
    [[ -n "${key[Up]}"        ]] && bindkey "${key[Up]}"        up-line-or-history
    [[ -n "${key[Down]}"      ]] && bindkey "${key[Down]}"      down-line-or-history
    [[ -n "${key[Left]}"      ]] && bindkey "${key[Left]}"      backward-char
    [[ -n "${key[Right]}"     ]] && bindkey "${key[Right]}"     forward-char
    [[ -n "${key[PageUp]}"    ]] && bindkey "${key[PageUp]}"    beginning-of-buffer-or-history
    [[ -n "${key[PageDown]}"  ]] && bindkey "${key[PageDown]}"  end-of-buffer-or-history

    # Finally, make sure the terminal is in application mode, when zle is
    # active. Only then are the values from $terminfo valid.
    if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
    fi

    alias nvim='LANG=en_US.UTF-8 nvim'

    alias cdtk='cd ~/work/Customization/tk_cms_user/'
    export TERM=xterm-256color

    # Fix compinit security warning
    autoload -U compaudit
    compaudit | xargs chmod g-w 2>/dev/null

    PURE_PROMPT_SYMBOL='>'
# elif [[ `whoami` == "dean" ]]; then
    # if command -v tmux>/dev/null; then
        # [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
    # fi
fi

# }}}
# GENERAL SETTINGS {{{
# ==============================================================================
export EDITOR='nvim'
export DEFAULT_USER=`whoami`
export USER=`whoami`


# History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

setopt append_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt no_beep
setopt extended_glob


# Completion
setopt always_to_end
setopt auto_menu
setopt complete_in_word

zstyle ':completion:*' menu select
zstyle ':completion:*:default'  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# Add local completion scripts
fpath=($HOME/.zsh/completion $fpath)

autoload -Uz compinit promptinit run-help
compinit
promptinit

setopt auto_cd
setopt auto_pushd



# Fix right prompt offset
ZLE_RPROMPT_INDENT=0

# # Pip auto completion
# if type "pip" > /dev/null; then
#     eval "`pip completion --zsh`"
#     compctl -K _pip_completion pip3
# fi

export KEYTIMEOUT=1

# }}}
# ALIASES {{{
# ==============================================================================

alias zshreload="source ~/.zshrc"
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lAh --color=auto'

function cheat() {
    curl cheat.sh/$1
}

function e() {
    if [ -z $DISPLAY ];then
        emacsclient -ta "" "$@"
    else
        emacsclient -nca "" "$@"
    fi
}

# }}}
# ZPLUG {{{
# ==============================================================================

source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "zuxfoucault/colored-man-pages_mod"
zplug "hlissner/zsh-autopair"
zplug "hcgraf/zsh-sudo"
zplug "zsh-users/zsh-completions"

# Themes
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load


# }}}
# FUNCTIONS {{{
# ==============================================================================

# http://www.owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --no-messages \
       --glob "!(.git,node_modules,.hg)/*"'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
function ff() {
    nvim $(fzf)
}

# Create new session or select existing one
tm() {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null \
            || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi
    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) \
           && tmux $change -t "$session" || echo "No sessions found."
}


# }}}
# PLUGINS {{{
# ==============================================================================

# added by travis gem
[ -f /home/dean/.travis/travis.sh ] && source /home/dean/.travis/travis.sh

# }}}
