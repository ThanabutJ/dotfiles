set -o vi

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$HOME/go/bin:$PATH
export GOPRIVATE=bitbucket.org

