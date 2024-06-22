# Dotfiles

## Usage

Use `dot` in order to manage the repository using `gitui`. For all other git operations, the `dotfiles` alias can be used in order to replace the `git` command:

```bash
dotfiles status
dotfiles add file
```

## Setup

In order to setup this repository on a new machine, follow these steps:

```bash
git clone --bare https://github.com/mdahmenzpf/dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```
