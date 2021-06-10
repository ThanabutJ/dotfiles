# func to check if command exist
command_exists () {
    type "$1" &> /dev/null;
}

if command_exists figlet; then
    figlet ZOOOMMM | lolcat
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
 #ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


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

#if command_exists bat; then
#    alias cat="bat"
#fi

set -o vi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

plugins=(git vi-mode)

export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$HOME/go/bin:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH
export GOPRIVATE=gitlab.com
source "$HOME/.cargo/env"

export CMSPATH=$HOME/projects/cms-service
export SVPATH=$HOME/projects/vm-services
export DOTFILEPATH=$HOME/mydotfiles
export CPRPATH=$HOME/projects/vm-services-gitlab

export EDITOR='nvim'

alias alphassh="cd ~/projects && ssh -i bastion-cpr-vm-alpha.pem ec2-user@ec2-13-212-78-163.ap-southeast-1.compute.amazonaws.com -N -L 3306:mysql.cpr-vm-alpha.local:3306  -L 6379:redis-01.cpr-vm-alpha.local:6379 -L 9092:b-1.kafka-cpr-vm-alph.l5lxn3.c4.kafka.ap-southeast-1.amazonaws.com:9092  -L 9093:b-2.kafka-cpr-vm-alph.l5lxn3.c4.kafka.ap-southeast-1.amazonaws.com:9092"
alias stagingssh="cd ~/projects && ssh -i bastion-cpr-vm-staging.pem ec2-user@ec2-13-250-61-46.ap-southeast-1.compute.amazonaws.com -N -L 3306:mysql.cpr-vm-staing.local:3306  -L 6379:redis-01.cpr-vm-staging.local:6379 -L 9092:b-1.kafka-cpr-vm-stag.l9gfyc.c4.kafka.ap-southeast-1.amazonaws.com:9092  -L 9093:b-2.kafka-cpr-vm-stag.l9gfyc.c4.kafka.ap-southeast-1.amazonaws.com:9092"

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



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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
    arr=(7 cpr)

    #TG_DIR=$(echo "cpall\\nvm-services-gitlab" | fzf)
    TG_PJ=$(printf '%s\n' "${arr[@]}"| fzf)
    TG_DIR=$TG_PJ

    if [ "$TG_DIR" = "cpr" ]; then
        TG_DIR="vm-services-gitlab"
    elif [ "$TG_DIR" = "7"  ]; then
        TG_DIR="cpall"
    fi

    DIR_PREFIX="$HOME/projects"
    DIR_PATH="$DIR_PREFIX/$TG_DIR"
    PJ_DIR=$(ls -1 $DIR_PATH | fzf)

    cd "$DIR_PATH/$PJ_DIR"

    SESSION_NAME="$TG_PJ-$PJ_DIR"
    # Check if the session exists, discarding output
    # We can check $? for the exit status (zero for success, non-zero for failure)
    #tmux has-session -t $SESSION_NAME 2>/dev/null

#    if[ $? != 0]; then
#        tmux new -s $SESSION_NAME
#    fi
    tmux new -A -s $SESSION_NAME
}
