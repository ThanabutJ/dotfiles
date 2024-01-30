# func to check if command exist
# command_exists () {
#     type "$1" &> /dev/null;
# }

# set -x

# zmodload zsh/zprof

# zmodload zsh/datetime
# setopt promptsubst
# PS4='+$EPOCHREALTIME %N:%i'
# exec 3>&2 2> startlog.$$
# setopt xtrace prompt_subst

[ -f ~/.zshenv ] && . ~/.zshenv
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # git
    history-substring-search
   #  fzf
   #  colored-man-pages
   # zsh-autosuggestions
   #  vi-mode
   # zsh-z
)

# source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh

#fzf keybinding has to be below set vi-mode
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

[ -f "$ZSH/oh-my-zsh.sh" ] && source $ZSH/oh-my-zsh.sh

# User configuration
# [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
# [ -f /usr/share/nvm/init-nvm.sh ] && source /usr/share/nvm/init-nvm.sh

#set vi mode
set -o vi

#start z_lua
eval "$(lua $Z_LUA_PATH --init zsh)"

#start startship prompt
eval "$(starship init zsh)"

#call pfetch
pfetch

[ -f ~/.user-paths ] && source ~/.user-paths

function use_nvm {
#    export NVM_DIR="$HOME/.nvm"
#    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
}

function update_makew {
    echo "installing..."
    go install git.wndv.co/go/makew@latest
    echo "done"
}

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/thanabut.j/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

[ -f "~/.k8s.completion" ] && source ~/.k8s.completion

# pnpm
export PNPM_HOME="/Users/thanabut.j/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zprof > ~/tmp/zshprof

# unsetopt xtrace
# exec 2>&3 3>&-

# set +x
