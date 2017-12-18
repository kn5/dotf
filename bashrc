case "${OSTYPE}" in
  darwin*)
    alias ls="ls -CFG"
    alias ll="ls -lFhG"
    alias la="ls -CFalG"
    ;;
  linux*)
    alias ls='ls -CF --color'
    alias ll='ls -lFh --color'
    alias la='ls -CFal --color'
    ;;
esac
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ef='exec fish'
alias vim='nvim'
alias sc='screen'
alias ps='ps --sort=start_time'
alias c='clear'

export PS1='\[\e[01;33m\]\D{%Y/%m/%d} \t \[\033[01;32m\]\u@\H\[\033[01;35m\] \w \$\[\033[00m\]\n'
export PATH=$HOME/my_local/homebrew/bin:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export HOMEBREW_CACHE=$HOME/my_local/homebrew/cache
export XDG_CONFIG_HOME=$HOME/.config
export WORKON_HOME=$HOME/.virtualenvs
export PYENV_ROOT=~/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
export TERM=xterm-256color
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/code/go-local
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
