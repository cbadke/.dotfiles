export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=${ZSH_THEME:-wedisagree}

plugins=($plugins git osx docker docker-compose)

source $ZSH/oh-my-zsh.sh

export DEFAULT_USER=cbadke

alias rm="rm -i"
alias ls="ls -Glah"
alias g="git"

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

function chpwd() {
    emulate -L zsh
    ls -Gla
}


myPath=`dirname ${(%):-%N}`
alias average="awk -f $myPath/scripts/awk/average.awk"
alias min="awk -f $myPath/scripts/awk/min.awk"
alias max="awk -f $myPath/scripts/awk/max.awk"
alias count="wc -l"
