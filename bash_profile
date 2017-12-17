if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
export LSCOLORS=gxfxcxdxbxegedabagacad
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
