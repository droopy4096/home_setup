#!/bin/bash

BASH_HOME=${BASH_HOME:-$(pwd)}

# cd ${HOME}

link_file(){
  linked_file=${1##*/}
  dest_dir=${2:-${HOME}}
  [ -L ${dest_dir}/${linked_file} ] || ln -s $1 ${dest_dir}/${linked_file}
}

bashrc_install(){
  include_file=${1}
  if grep -qF '. ${HOME}/'"${include_file}" ~/.bashrc
  then
    echo "${include_file} already installed in ${HOME}/.bashrc"
  else
    echo '. ${HOME}/'"${include_file}" >> ~/.bashrc
  fi
}

link_file ${BASH_HOME}/.colors
link_file ${BASH_HOME}/.bash_colors
link_file ${BASH_HOME}/.bash_prompt
link_file ${BASH_HOME}/.bash_autoprompt
link_file ${BASH_HOME}/.bash_git
link_file ${BASH_HOME}/.bash_svn
link_file ${BASH_HOME}/.xpath.py
link_file ${BASH_HOME}/.kube_helper
link_file ${BASH_HOME}/.bash_autocompletions

link_file ${BASH_HOME}/bin/k ${HOME}/bin
link_file ${BASH_HOME}/bin/k9s ${HOME}/bin
link_file ${BASH_HOME}/bin/h ${HOME}/bin

bashrc_install .bash_autoprompt
bashrc_install .bash_autocompletions