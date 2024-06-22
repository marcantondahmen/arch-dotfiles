source <(fzf --zsh)

export FZF_DEFAULT_OPTS="--color=16 --cycle --preview-window=border-sharp"

fzfProjects() {
	local projects=$(fd '\.git$' ~/dev -t d -H -I -E node_modules -x dirname {} \; 2>/dev/null)
	local selected=$(printf "$projects" | \
		fzf \
		--no-multi \
		--preview='(cd {1} && [ -f README.* ] && bat --color=always --style=numbers --theme=base16 README.* || ls -l)'\
	)

	if [ ! -z "$selected" ]
	then
		cd $selected
		nvim
	fi
}

fzfFindDir() {
	local dirPreview='echo "Directory contents:" && ls -lA --color=always {} | awk '"'"'{print $9}'"'"
	local selected=$(fd --type directory -H -I -E node_modules -E .git . $(pwd) | \
		fzf \
		--no-multi \
		--preview="$dirPreview" \
	)

	if [ ! -z "$selected" ]
	then
		cd "$selected"
	fi
}

fzfFindFile() {
	local filePreview='if file -b --mime-type {} | grep -qiE "text|json"; then bat --color=always --style=numbers --theme=base16 {}; else echo "Binary file"; fi'
	local selected=$(fd --type file -H -I -E node_modules -E .git . $(pwd) | \
		fzf \
		--no-multi \
		--preview="$filePreview" \
	)

	if [ ! -z "$selected" ]
	then
		cd $(dirname "$selected") && nvim "$selected"
	fi
}

