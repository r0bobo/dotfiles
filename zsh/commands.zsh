# Bash commands run in the end of zsh config read

if [[ $TERMINIX_ID ]]; then
    source /etc/profile.d/vte.sh
fi

if hash neofetch 2>/dev/null;then
   neofetch
fi

