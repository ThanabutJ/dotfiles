# func to check if command exist
command_exists () {
    type "$1" &> /dev/null;
}

if [ -f ~/.zshenv ]; then
. ~/.zshenv
fi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

#if command_exists figlet; then
#    figlet ZOOOMMM | lolcat
#fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    history-substring-search
    colored-man-pages
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
)

source $ZSH/oh-my-zsh.sh

set -o vi

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias sozsh="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias rgr="ranger"
alias nvimconfig="vim ~/.config/nvim/init.vim"
alias tmtorconfig="vim ~/.config/tmuxinator"
alias ggo="ginkgo"
alias vdf="cd $DOTFILEPATH && vim ."

source "$HOME/.cargo/env"


plugins=(git vi-mode)


if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi
 

SSH_ENV=$HOME/.ssh/environment

# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
    echo succeeded
    chmod 600 ${SSH_ENV}
    . ${SSH_ENV} > /dev/null
    /usr/bin/ssh-add
}

alias wgq="sudo wg-quick"

alias tmat="tmux attach -t"
alias tmls="tmux ls"
alias tmkt="tmux kill-session -t"
alias tmns="tmux new -s"

function tmst() {
    tmuxinator start $(tmuxinator list -n | fzf)
}

function tmedit() {
    tmuxinator new $(tmuxinator list -n | fzf)
}

function tmstop() {
    tmuxinator stop $(tmux ls -F '#S' | fzf)
}

function tmatt() {
    tmat $(tmux ls -F '#S' | fzf)
}

function killport() {
    lsof -i :$1 | grep 'main' | awk '{print $2}' | xargs kill -9
}

alias gprotoall="find ./proto -name \*.proto -exec sh protoc.sh -f {} \;"
alias gproto="find ./proto -name \*.proto | fzf | xargs sh protoc.sh -f"

function cdcpr() {
    cd ~/projects/vm-services-gitlab && cd $(ls -1 | fzf)
}

function cdcpall() {
    cd ~/projects/cpall && cd $(ls -1 | fzf)
}


alias gorun="go run main.go"


if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi



export PKG_CONFIG_PATH="/usr/local/opt/expat/lib/pkgconfig"

alias lg="lazygit"
alias ld="lazydocker"

function gitpushtag(){
    git push origin $(git tag --list | fzf)
}
alias gpt="gitpushtag"

alias luamake=/Users/thanabutjaithima/repos/lua-language-server/3rd/luamake/luamake

alias setbn="set-brightness.sh"
alias resetbn="set-brightness.sh 7"

# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

function tmws() {
    arr=(7 cpr)

    #TG_DIR=$(echo "cpall\\nvm-services-gitlab" | fzf)
    TG_PJ=$(printf '%s\n' "${arr[@]}"| fzf)
    TG_DIR=$TG_PJ

    if [ "$TG_DIR" = "cpr" ]; then
        TG_DIR=$CPR_WS_PATH
    elif [ "$TG_DIR" = "7"  ]; then
        TG_DIR=$CPALL_WS_PATH
    fi

    DIR_PATH="$TG_DIR/services"
    PJ_DIR=$(ls -1 $DIR_PATH | fzf)

    cd "$DIR_PATH/$PJ_DIR"

    SESSION_NAME="$TG_PJ-$PJ_DIR"

    tmux new -A -s $SESSION_NAME
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

funcion ezdkl(){
    docker logs -f $(docker ps --format 'table {{.Names}}' | fzf)
}

eval "$(lua $Z_LUA_PATH --init zsh)"

eval "$(starship init zsh)"
pfetch
