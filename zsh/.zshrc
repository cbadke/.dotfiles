export DEFAULT_USER=cbadke

export PATH=$PATH:~/.local/bin

alias rm="rm -i"
alias ls="ls -Glah"
alias g="git"

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

function chpwd() {
    emulate -L zsh
    ls -Glah
}


myPath=`dirname ${(%):-%N}`
alias average="awk -f $myPath/scripts/awk/average.awk"
alias min="awk -f $myPath/scripts/awk/min.awk"
alias max="awk -f $myPath/scripts/awk/max.awk"
alias count="wc -l"
alias vim="nvim"
alias vi="nvim"


for zshrc in $(\ls ~/.zsh/.*-zshrc | sort)
do
    source $zshrc
done

if [[ "$LC_TERMINAL" = "iTerm2" ]]
then
    change() {
        image_dir='/Users/cbadke/Pictures/backgrounds/digitalblasphemy/wallpapers/single/3440x1440'
        images=(`\ls $image_dir`)
        num_images=${#images[*]}
        myfilename="${image_dir}/`echo ${images[$((RANDOM%$num_images + 1))]}`"
        base64filename=`echo ""${myfilename}"" | base64`;
        echo "\033]1337;SetBackgroundImageFile=${base64filename}\a"
        unset $RANDOM
    }

    change
fi

clear
