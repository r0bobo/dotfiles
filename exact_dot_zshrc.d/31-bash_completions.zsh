bash_completions=(
    consul
    terraform
    vault
)

autoload -U +X bashcompinit
bashcompinit

for comp in $bash_completions; do
    if _path=$(which $comp) 2>/dev/null; then
        complete -o nospace -C "$_path" "$comp"
    fi
done
