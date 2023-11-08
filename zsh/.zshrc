
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

export ZSH="$HOME/.oh-my-zsh"
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fpath=(~/.zsh $fpath)

export DEFAULT_USER=cbadke

export PATH=$PATH:~/.local/bin:$HOME/go/bin

myPath=`dirname ${(%):-%N}`
alias average="awk -f $myPath/scripts/awk/average.awk"
alias count="wc -l"
alias cp="cp -i"
alias dots="cd ~/.dotfiles"
alias f="find . -name"
alias g="git"
alias gip="curl ipinfo.io/ip && echo '' && curl ipinfo.io/org"
alias ls="\\ls -Glah"
alias max="awk -f $myPath/scripts/awk/max.awk"
alias min="awk -f $myPath/scripts/awk/min.awk"
alias mv="mv -i"
alias rm="rm -i"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# never beep
setopt NO_BEEP
# include hidden in tab completion
setopt globdots

# Ctrl-left/right jumps words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# make changing directories automatically run ls
function chpwd() {
    emulate -L zsh
    ls -Glah
}


# import other zshrc that might be lying around
for zshrc in $(\ls ~/.zsh/.*-zshrc | sort)
do
    source $zshrc
done


clear
