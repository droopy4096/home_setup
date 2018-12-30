
Color prompt
============

simply add to your .bashrc::

  . bash_colors

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
  . bash_git
  export PROMPT_COMMAND=whats_my_git

SVN prompt
==========

Requirements
------------

* .bash_colors
* .bash_git

Setup
-----

modify  .bashrc::

  
  unset PROMPT_COMMAND
  export -n PROMPT_COMMAND
  export PS1 PS1_SHORT
  GIT_CACHE_TTL=1
  HOSTMANE_COLOR=${Cyan}
  SEPARATOR_COLOR=${Purple}
  . bash_git
  . bash_svn
  export PROMPT_COMMAND=whats_my_repo
  whats_my_repo(){
    whats_my_svn
    whats_my_git
  }

*NOTE* order of execution is important at the moment!

