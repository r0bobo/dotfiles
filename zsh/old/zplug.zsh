# Zplug plugin setup

source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "changyuheng/zsh-interactive-cd"


# Themes

zplug "mafredri/zsh-async", from:github
# zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "dfurnes/purer"

zplug load
