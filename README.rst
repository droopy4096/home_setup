Contents
========

* .bash_root - bash profile for root account
* .bash_color - colorized prompt 
* .bash_git - Git prompt
* .bash_svn - SVN prompt
* .screenrc - configuration for GNU Screen
* Vim:
  
  * .vimrc - base Vim config
  * .vim - plugins etc.

* LXDE:

  * .config/lxsession
  * .config/lxpanel
  * .config/openbox
  * .config/lxterminal




Color prompt
============

simply add to your .bashrc::

  . .bash_colors

Git Prompt
==========

Requirements
------------

* .bash_colors to be enabled (see above)


Setup
-----

add to .bashrc following::

  unset PROMPT_COMMAND
  export -n PROMPT_COMMAND
  export PS1 PS1_SHORT
  GIT_CACHE_TTL=1
  HOSTMANE_COLOR=${Cyan}
  SEPARATOR_COLOR=${Purple}
  . ~/.bash_git
  export PROMPT_COMMAND=whats_my_git

SVN prompt
==========

Requirements
------------

* .bash_colors
* .bash_git

Setup
-----

run setup script::

  $ ./setup.sh
  
this will:

* create all the symlinks
* add entry to .bashrc::

   . ~/.bash_autoprompt
   


*NOTE* order of execution is important at the moment!

