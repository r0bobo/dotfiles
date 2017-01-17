# Zplug plugin setup

source $ZPLUG_HOME/init.zsh

# zplug "zsh-users/zsh-history-substring-search"

zplug "zsh-users/zsh-autosuggestions"

zplug "zsh-users/zsh-syntax-highlighting", defer:2


# Themes

# zplug "agnoster/agnoster-zsh-theme", use:"agnoster.zsh-theme"

zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme

# zplug "mafredri/zsh-async", from:github 

# zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

zplug load
