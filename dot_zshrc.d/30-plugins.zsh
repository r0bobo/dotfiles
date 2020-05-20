plugins=(
    '/usr/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh'
    '/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
    '/usr/share/fzf/shell/key-bindings.zsh'
)

for plugin in $plugins; do
    if [[ -r $plugin ]]; then
        source "$plugin"
    fi
done
