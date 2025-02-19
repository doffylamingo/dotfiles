HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '$HOME/.zshrc'

fpath=($HOME/.config/zsh $fpath)
autoload -Uz compinit
compinit -u
