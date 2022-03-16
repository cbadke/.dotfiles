export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(git osx aws docker docker-compose kubectl)

source $ZSH/oh-my-zsh.sh

export DEFAULT_USER=cbadke

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
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
