#!/usr/bin/env zsh

GRC_PROFILE="/etc/profile.d/grc.sh"

mangle-colourify() {
	printf 'GRC="$(which grc)"\n'
	printf 'if [ "$TERM" != dumb ] && [ -n "$GRC" ]; then\n'

	while IFS= read -r alias; do
		funcname="$(cut -d= -f1 <<<"$alias")"

		cmd_raw="$(cut -d= -f2- <<<"$alias")"

		# Remove surrounding quotes
		temp="${cmd_raw%\"}"
		temp="${temp#\"}"
		temp="${temp%\'}"
		command="${temp#\'}"

		printf '\n'
		printf '  unalias "%s" &>0 || true\n' "$funcname"
		printf '  function %s { %s "$@"; }\n' "$funcname" "$command"
	done < <(grep -E '^\s*[^#]\s*alias' <"$GRC_PROFILE" | sed -E 's|^\s*alias\s*(.+)+|\1|g')
	printf 'fi\n'
}

source <(_cached_output "$GRC_PROFILE" mangle-colourify)
