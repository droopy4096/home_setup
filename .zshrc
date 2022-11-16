
EDITOR=vim

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
if [ -r ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme ] ; then
  source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
fi

if [ -r ~/powerlevel10k/powerlevel10k.zsh-theme ] ; then
  source ~/powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval $(keychain -q --eval --inherit any)

add_to_path(){
  local new_path=$1
  echo ${PATH} | grep -qF ${new_path} || export PATH=${PATH}:${new_path}
}

add_to_path ${HOME}/bin
add_to_path ${HOME}/work/kubernetes-tools/bin
add_to_path ${HOME}/bin/adr-tools/src
add_to_path ${HOME}/.local/bin

if [ -r ${HOME}/.kube/config ]; then
  export KUBECONFIG=$HOME/.kube/config
fi

setopt interactivecomments

## Turn on Emacs mode for Cli
bindkey -e

### dnf install zsh-autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias irb-pry=pry
alias ll="exa -l --git"
alias yaml-diff dyff
alias diff-yaml dyff

if [ -r ${HOME}/.zshrc.local ]; then
  source ${HOME}/.zshrc.local
fi

if command -v kubectl > /dev/null; then
  source <(kubectl completion zsh)
  compdef k=kubectl
fi
if command -v helm > /dev/null; then
  source <(helm completion zsh)
  compdef h=helm
fi


## Should be the last line:
### dnf install zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export GRAPH_VIEWER=gwenview
