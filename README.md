> [!IMPORTANT]
> This repository is no longer maintained. My current dotfiles can be found [here](https://github.com/marcantondahmen/dotfiles).

---

# Marc's Arch Dotfiles

This repository contains all dotfiles that I use for my _day job_ as a software engineer. Feel free to create your own fork and modify them to meet your own requirements. In case you are also looking for a quick way to get Arch-Linux up and running, take a look at the [arch-setup](https://github.com/marcantondahmen/arch-setup) repository.

![Screenshot](https://raw.githubusercontent.com/marcantondahmen/arch-setup/master/screenshot.png)

## Usage

Use `dot` in order to manage the repository using `gitui`. For all other git operations, the `dotfiles` alias can be used in order to replace the `git` command:

```bash
dotfiles status
dotfiles add file
```

## Setup

In order to setup this repository on a new machine, follow these steps:

```bash
git clone --bare https://github.com/marcantondahmen/arch-dotfiles.git $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
```

---

&copy; 2024 Marc Anton Dahmen, MIT license
