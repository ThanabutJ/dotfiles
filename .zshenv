#PATHS
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:~/scripts
export PATH=$PATH:~/appimages
export PATH=$PATH:~/.local/bin
# add doom emacs to path
export PATH=$PATH:~/.emacs.d/bin
export PATH="/usr/local/opt/expat/bin:$PATH"
export PATH="$HOME/Downloads/dbeaver:$PATH"
export PATH="$HOME/Downloads/Discord:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/repos/lua-language-server-3.5.5-linux-x64/bin:$PATH"

export PKG_CONFIG_PATH="/usr/local/opt/expat/lib/pkgconfig"

###
#  ____            _                                        _     _
# / ___| _   _ ___| |_ ___ _ __ ___   __   ____ _ _ __ __ _| |__ | | ___
# \___ \| | | / __| __/ _ \ '_ ` _ \  \ \ / / _` | '__/ _` | '_ \| |/ _ \
#  ___) | |_| \__ \ ||  __/ | | | | |  \ V / (_| | | | (_| | |_) | |  __/
# |____/ \__, |___/\__\___|_| |_| |_|   \_/ \__,_|_|  \__,_|_.__/|_|\___|
#        |___/
###
# Path to your oh-my-zsh installation.
# export ZSH=/usr/share/oh-my-zsh/
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

#GO
godir=/usr/local
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$godir/go/bin
export GOROOT=$godir/go
export GOPATH=$HOME/go
export GOPRIVATE=git.wndv.co/*
#export GOPRIVATE=gitlab.com
export ACK_GINKGO_DEPRECATIONS=1.16.5

#FZF
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

# for lens
export AWS_PROFILE=cpm

export LDFLAGS="-L/usr/local/opt/expat/lib"
export CPPFLAGS="-I/usr/local/opt/expat/include"

# for fcitx
export GTK_IM_MODULE='fcitx'
export QT_IM_MODULE='fcitx'
export SDL_IM_MODULE='fcitx'
export XMODIFIERS='@im=fcitx'

# ruby path
# export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
# export PATH="$PATH:$GEM_HOME/bin"

##
#  __  __                              _     _
# |  \/  |_   _  __   ____ _ _ __ __ _| |__ | | ___
# | |\/| | | | | \ \ / / _` | '__/ _` | '_ \| |/ _ \
# | |  | | |_| |  \ V / (_| | | | (_| | |_) | |  __/
# |_|  |_|\__, |   \_/ \__,_|_|  \__,_|_.__/|_|\___|
#         |___/
##
SSH_ENV=$HOME/.ssh/environment

export DOTFILEPATH=$HOME/mydotfiles
export MYSCRIPTS=$HOME/scripts
export MYFILES=$HOME/files
export ZSH_PLUGINS=$HOME/repos/zsh-plugins

export PRJPATH=$HOME/projects

export CMSPATH=$HOME/projects/cms-service
export SVPATH=$HOME/projects/vm-services
#export CPRPATH=$HOME/projects/vm-services-gitlab

export CPALL_WS_PATH=$HOME/projects/cpall/cpall-workspace
export CPM_CPALL_ROOT=$HOME/projects/cpall/cpall-workspace
export CPR_WS_PATH=$HOME/projects/cpr/cpr-workspace
export CPM_CPR_ROOT=$HOME/projects/cpr/cpr-workspace

export Z_LUA_PATH="$HOME/repos/z.lua/z.lua"

export SUMNEKO_ROOT_PATH=$HOME/repos/lua-language-server 

#  _     ___ _   _ _____ __  __    _    _   _ 
# | |   |_ _| \ | | ____|  \/  |  / \  | \ | |
# | |    | ||  \| |  _| | |\/| | / _ \ |  \| |
# | |___ | || |\  | |___| |  | |/ ___ \| |\  |
# |_____|___|_| \_|_____|_|  |_/_/   \_\_| \_|
                                            
export LINEMAN_WORKSPACE=$HOME/projects/lmwn

# export PATH=$(pyenv root)/shims:$PATH
