# func to check if command exist
command_exists () {
    type "$1" &> /dev/null;
}

if command_exists figlet; then
    figlet ZOOOMMM | lolcat
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

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

# User configuration

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
alias sozsh="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias rgr="ranger"
alias vim="nvim"
alias nvimconfig="vim ~/.config/nvim/init.vim"
alias vdf="cd ~/mydotfiles && vim ."
alias tmtorconfig="vim ~/.config/tmuxinator"
alias ggo="ginkgo"

#if command_exists bat; then
#    alias cat="bat"
#fi

set -o vi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

plugins=(git vi-mode)

export PRJPATH=$HOME/projects
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$HOME/go/bin:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH
export PATH=$PATH:~/scripts
export PATH=$PATH:/usr/local/go/bin
export GOPRIVATE=gitlab.com
source "$HOME/.cargo/env"

export CMSPATH=$HOME/projects/cms-service
export SVPATH=$HOME/projects/vm-services
export DOTFILEPATH=$HOME/mydotfiles
export CPRPATH=$HOME/projects/vm-services-gitlab

export EDITOR='nvim'

if [ -f /usr/share/nvm/init-nvm.sh ]; then
    source /usr/share/nvm/init-nvm.sh
fi
 

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

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


# add doom emacs to path
export PATH=$PATH:~/.emacs.d/bin

# for lens
export AWS_PROFILE=cpm

alias gorun="go run main.go"


if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

export PATH="/usr/local/opt/expat/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/expat/lib"
export CPPFLAGS="-I/usr/local/opt/expat/include"

export PKG_CONFIG_PATH="/usr/local/opt/expat/lib/pkgconfig"

alias lg="lazygit"

func gitpushtag(){
    git push origin $(git tag --list | fzf)
}
alias gpt="gitpushtag"

alias luamake=/Users/thanabutjaithima/repos/lua-language-server/3rd/luamake/luamake

function cdez() {
    arr=(7 cpr)
    TG_DIR=$(printf '%s\n' "${arr[@]}"| fzf)
    DIR_PREFIX="$HOME/projects"
    DIR_PATH="$DIR_PREFIX/$TG_DIR"
    PJ_DIR=$(ls -1 $DIR_PATH | fzf)
    cd "$DIR_PATH/$PJ_DIR"
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

eval "$(starship init zsh)"


alias setbn="set-brightness.sh"
alias resetbn="set-brightness.sh 7"

# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

