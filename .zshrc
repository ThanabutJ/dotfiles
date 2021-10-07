# func to check if command exist
command_exists () {
    type "$1" &> /dev/null;
}

[ -f ~/.zshenv ] && . ~/.zshenv
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

#if command_exists figlet; then
#    figlet ZOOOMMM | lolcat
#fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="af-magic"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    history-substring-search
    colored-man-pages
#    zsh-autosuggestions
#    zsh-z
)

    
[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh

# User configuration
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

if [ -d "$ZSH_PLUGINS/zsh-syntax-highlighting" ];
then
    source "$ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 
fi

plugins=(git vi-mode)

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

if [ -f "${SSH_ENV}" ]; then
     . ${SSH_ENV} > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

#set vi mode
set -o vi


#start z_lua
eval "$(lua $Z_LUA_PATH --init zsh)"

#start startship prompt
eval "$(starship init zsh)"

#call pfetch
pfetch

#fzf keybinding has to be below set vi-mode
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

source /home/zoomarco/.config/broot/launcher/bash/br
