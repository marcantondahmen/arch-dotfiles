alias ls="ls --color=always"
alias la="ls -la"
alias cat="bat"
alias gu="gitui"
alias ld="lazydocker"
alias dev="fzfProjects"
alias f="fzfFindDir"
alias ff="fzfFindFile"
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias dot='gitui --directory=$HOME/.dotfiles/ --workdir=$HOME/'
alias tl='tmux attach -t $(tmux ls | fzf --height 30% --layout=reverse --border | awk -F: '"'"'{print $1}'"'"')'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tn='tmux new -s'
alias tr='tmux rename-session'
alias xx='exit'
alias gl="git log --graph --decorate --branches --color --pretty=format:'%>|(18)%C(blue)%h   %C(auto)%d %Creset%s %C(brightblack)- %cr, %ce%Creset' | less -RC"
alias gc="git checkout"
alias gp="git pull"

export COLORTERM=truecolor
export PATH="$HOME/.local/bin:/opt/nvim-linux64/bin:$PATH"

eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/fzf/fzf.zsh

if [ -f ~/.private ]
then
	source ~/.private
fi
