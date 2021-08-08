alias ll='ls -l'
alias lsa='ls -a'
alias rm='rm -i'

# Tmux
alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmkt="tmux kill-session -t"
alias tmns="tmux new -s"

alias tmatcc="tmux -CC attach -t"
alias tmlscc="tmux -CC ls"
alias tmktcc="tmux -CC kill-session -t"
alias tmnscc="tmux -CC new -s"

#tmuxinator
alias tmtor="tmuxinator"
alias tt="tmuxinator"

alias btton='blueutil -p 1'
alias bttoff='blueutil -p 0'

#config shortcut
alias vimconfig="vim ~/.vimrc"
alias baconfig="vim ~/.bash_aliases"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias zshconfig="vim ~/.zshrc"
alias sozsh="source ~/.zshrc"
alias nvimconfig="vim ~/.config/nvim/init.vim"
alias tmtorconfig="vim ~/.config/tmuxinator"

# programe shortcut
alias vim="nvim"
alias v="nvim"
alias rgr="ranger"
alias vdf="cd $DOTFILEPATH && nvim"

#wireguard
alias wgq="sudo wg-quick"

#docker
alias dk="docker"
alias dkc="docker-compose"
alias dkstopall='docker stop $(docker ps -a -q)'
alias dkrmall='docker rm $(docker ps -a -q)'

#cpm genproto script
alias gprotoall="find ./proto -name \*.proto -exec sh protoc.sh -f {} \;"
alias gproto="find ./proto -name \*.proto | fzf | xargs sh protoc.sh -f"

#lazys
alias lg="lazygit"
alias ld="lazydocker"

# zlua
alias zi="z -i"
alias zl="z -l"
alias zr="z -r"

#ref to function
alias gpt="gitpushtag"

#set brightness
alias setbn="set-brightness.sh"
alias resetbn="set-brightness.sh 7"

# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

#golang
alias gorun="go run main.go"
alias ggo="ginkgo"

#lua
alias luamake=/Users/thanabutjaithima/repos/lua-language-server/3rd/luamake/luamake

#linux keyboard
alias xmap="xmodmap ~/.Xmodmap"
alias kthai="sh set-key-thai.sh"

#optimus-manager
alias opman="optimus-manager"
alias opmans="optimus-manager --status"
alias opmanswi="optimus-manager --switch integrated"
alias opmanswh="optimus-manager --switch hybrid"
alias opmanswn="optimus-manager --switch nvidia"

# _____ _   _ _   _  ____ _____ ___ ___  _   _
#|  ___| | | | \ | |/ ___|_   _|_ _/ _ \| \ | |___
#| |_  | | | |  \| | |     | |  | | | | |  \| / __|
#|  _| | |_| | |\  | |___  | |  | | |_| | |\  \__ \
#|_|    \___/|_| \_|\____| |_| |___\___/|_| \_|___/
#
function fwsc(){
    ws=$(echo "$CPM_CPALL_ROOT\n$CPM_CPR_ROOT" | fzf)
    [ -z "$ws" ] ||  sh "$ws/start"
}

function gitpushtag(){
    git push origin $(git tag --list | fzf)
}

function tmez() {
    arr=(7 cpr 7w)

    #TG_DIR=$(echo "cpall\\nvm-services-gitlab" | fzf)
    TG_PJ=$(printf '%s\n' "${arr[@]}"| fzf)
    TG_DIR=$TG_PJ

    if [ "$TG_DIR" = "cpr" ]; then
        TG_DIR="vm-services-gitlab"
    elif [ "$TG_DIR" = "7"  ]; then
        TG_DIR="cpall"
    elif [ "$TG_DIR" = "7w"  ]; then
        TG_DIR="cpall-workspace/services"
    fi

    DIR_PREFIX="$PRJPATH"
    DIR_PATH="$DIR_PREFIX/$TG_DIR"
    PJ_DIR=$(ls -1 $DIR_PATH | fzf)

    cd "$DIR_PATH/$PJ_DIR"

    SESSION_NAME="$TG_PJ-$PJ_DIR"

    tmux new -A -s $SESSION_NAME
}

function cdez() {
    arr=(7 cpr)
    TG_DIR=$(printf '%s\n' "${arr[@]}"| fzf)
    DIR_PREFIX="$HOME/projects"
    DIR_PATH="$DIR_PREFIX/$TG_DIR"
    PJ_DIR=$(ls -1 $DIR_PATH | fzf)
    cd "$DIR_PATH/$PJ_DIR"
}

function ezdkl(){
    docker logs -f $(docker ps --format 'table {{.Names}}' | fzf)
}

function cdp(){
    p=$(quick-cd)
    [ -z $p ] || cd $p
}
