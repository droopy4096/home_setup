#!/bin/bash

BASH_HOME=${BASH_HOME:-$(pwd)}

# cd ${HOME}

link_file(){
  linked_file=${1##*/}
  dest_dir=${2:-${HOME}}
  [ -L ${dest_dir}/${linked_file} ] || ln -s $1 ${dest_dir}/${linked_file}
}

link_file ${BASH_HOME}/.colors
link_file ${BASH_HOME}/.bash_colors
link_file ${BASH_HOME}/.bash_prompt
link_file ${BASH_HOME}/.bash_autoprompt
link_file ${BASH_HOME}/.bash_git
link_file ${BASH_HOME}/.bash_svn
link_file ${BASH_HOME}/.xpath.py
link_file ${BASH_HOME}/.kube_helper

link_file ${BASH_HOME}/bin/k ${HOME}/bin
link_file ${BASH_HOME}/bin/k9s ${HOME}/bin
link_file ${BASH_HOME}/bin/h ${HOME}/bin

if grep -qF '. ${HOME}/.bash_autoprompt' ~/.bashrc
then
  echo "autoprompt already installed"
else
  echo '. ${HOME}/.bash_autoprompt' >> ~/.bashrc
fi
