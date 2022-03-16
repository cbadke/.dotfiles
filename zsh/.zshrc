export DEFAULT_USER=cbadke

export PATH=$PATH:~/.local/bin

alias rm="rm -i"
alias ls="ls -Glah"
alias g="git"

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit

# make changing directories automatically run ls
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


# import other zshrc that might be lying around
for zshrc in $(\ls ~/.zsh/.*-zshrc | sort)
do
    source $zshrc
done



clear
