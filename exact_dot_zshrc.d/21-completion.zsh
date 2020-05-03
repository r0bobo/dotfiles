if command -v kubectl &>/dev/null; then
    source <(kubectl completion zsh)
fi

if command -v tkn &>/dev/null; then
    source <(tkn completion zsh)
fi
