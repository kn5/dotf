export LSCOLORS=gxfxcxdxbxegedabagacad

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
