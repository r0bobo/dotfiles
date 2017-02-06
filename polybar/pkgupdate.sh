#!/bin/bash

pac=$(checkupdates | wc -l)
aur=$(pacaur -k | grep ":: aur" | wc -l)

pkgs=$((pac + aur))

if [[ "$pkgs" != "0" ]]
then
    # echo "%{colors.foreground-right}%{T3}%{T-}%{F-}  $pkgs"
    echo "%{F#ebdbb2}%{T3}%{T-}%{F-}  $pkgs"
else
    # echo "%{colors.foreground-right-inactive}%{T-}%{F-}"
    echo "%{F#928374}%{T-}%{F-}"
fi
