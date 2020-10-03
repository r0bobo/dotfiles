#!/usr/bin/env zsh

GRC_PROFILE="/etc/profile.d/grc.sh"
source <(-cached_output "$GRC_PROFILE" -mangle_colourify "$GRC_PROFILE")
