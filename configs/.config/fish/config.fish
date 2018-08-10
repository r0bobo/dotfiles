setpath PATH \
$HOME/.local/bin \
$HOME/.npm/bin \
$HOME/.gem/ruby/2.5.0/bin \
$HOME/.cargo/bin

setpath MANPATH \
$HOME/.local/share/man

setpath INFOPATH \
$HOME/.local/bin \


if test $TERM = "dumb"
    function fish_prompt
        echo "\$ "
    end
end
