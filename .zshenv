#PATHS
export PATH=$HOME/go/bin:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin":$PATH
export PATH=$PATH:~/scripts
export PATH=$PATH:/usr/local/go/bin
# add doom emacs to path
export PATH=$PATH:~/.emacs.d/bin
export PATH="/usr/local/opt/expat/bin:$PATH"

###
#  ____            _                                        _     _
# / ___| _   _ ___| |_ ___ _ __ ___   __   ____ _ _ __ __ _| |__ | | ___
# \___ \| | | / __| __/ _ \ '_ ` _ \  \ \ / / _` | '__/ _` | '_ \| |/ _ \
#  ___) | |_| \__ \ ||  __/ | | | | |  \ V / (_| | | | (_| | |_) | |  __/
# |____/ \__, |___/\__\___|_| |_| |_|   \_/ \__,_|_|  \__,_|_.__/|_|\___|
#        |___/
###
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'

#GO
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export GOPRIVATE=gitlab.com

#FZF
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=80%"

# for lens
export AWS_PROFILE=cpm

export LDFLAGS="-L/usr/local/opt/expat/lib"
export CPPFLAGS="-I/usr/local/opt/expat/include"

##
#  __  __                              _     _
# |  \/  |_   _  __   ____ _ _ __ __ _| |__ | | ___
# | |\/| | | | | \ \ / / _` | '__/ _` | '_ \| |/ _ \
# | |  | | |_| |  \ V / (_| | | | (_| | |_) | |  __/
# |_|  |_|\__, |   \_/ \__,_|_|  \__,_|_.__/|_|\___|
#         |___/
##
export DOTFILEPATH=$HOME/mydotfiles

export PRJPATH=$HOME/projects

export CMSPATH=$HOME/projects/cms-service
export SVPATH=$HOME/projects/vm-services
export CPRPATH=$HOME/projects/vm-services-gitlab

export CPALL_WS_PATH=$HOME/projects/cpall/cpall-workspace
export CPR_WS_PATH=$HOME/projects/cpr/cpall-workspace

export Z_LUA_PATH="$HOME/repos/z.lua/z.lua"

export SUMNEKO_ROOT_PATH=$HOME/repos/lua-language-server 
