#!/bin/bash

BASH_HOME=${BASH_HOME:-$(pwd)}

cd ${HOME}

link_file(){
  linked_file=${1##*/}
  [ -L ${linked_file} ] || ln -s $1
}

link_file ${BASH_HOME}/.bash_colors
link_file ${BASH_HOME}/.bash_prompt
link_file ${BASH_HOME}/.bash_autoprompt
link_file ${BASH_HOME}/.bash_git
link_file ${BASH_HOME}/.bash_svn

if grep -qF '. ${HOME}/.bash_autoprompt' ~/.bashrc
then
  echo "autoprompt already installed"
else
  echo '. ${HOME}/.bash_autoprompt' >> ~/.bashrc
fi
