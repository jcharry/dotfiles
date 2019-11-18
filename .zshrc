# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jcharry/.oh-my-zsh"
source ~/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"

# Disable updates using the "frozen" tag
# zplug "k4rthik/git-cal", as:command, frozen:1

# Supports oh-my-zsh plugins and the like
# zplug "plugins/git",   from:oh-my-zsh
# zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# For funsies
# zplug "iam4x/zsh-iterm-touchbar"
# export TOUCHBAR_GIT_ENABLED=true
# export GIT_UNCOMMITTED="+"
# export GIT_UNSTAGED="!"
# export GIT_UNTRACKED="?"
# export GIT_STASHED="$"
# export GIT_UNPULLED="⇣"
# export GIT_UNPUSHED="⇡"

# Can manage local plugins
# zplug "~/.zsh", from:local

zplug mafredri/zsh-async, from:github
zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme

# Load theme file
# zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

## History wrapper
function omz_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    echo >&2 History file deleted. Reload the session to see its effects.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}

# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='omz_history -f' ;;
  "dd.mm.yyyy") alias history='omz_history -E' ;;
  "yyyy-mm-dd") alias history='omz_history -i' ;;
  "") alias history='omz_history' ;;
  *) alias history="omz_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# User configuration
export PATH=/Users/jcharry/squarespace/generated/bin:/Users/jcharry/squarespace/generated/docker:$PATH

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# NVM config
export NVM_DIR="/Users/jcharry/.nvm"
export PATH="$HOME/.cargo/bin:$PATH"

# PATH Stuff
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/user/local/mysql/support-files/:$HOME/bin:$PATH"

# RVM to path (ruby gems)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/opt/ruby/bin:$PATH"

# NVM
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
#
# Set fzf installation directory path
export FZF_BASE=/usr/local/bin/fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

export JIRA_URL=https://jira.squarespace.net
export EDITOR=code


alias ..="cd .."
alias ll='ls -lAh'
alias home='cd ~'
alias mv='mv -i'                #interactively move
alias cp='cp -i'                #interactively cp
alias df='df -Ha'               #show human readable format
#alias du='du -ach | sort -h'    #show human readable sizes and sort
alias mkdir='mkdir -pv'         #automatically create child dirs
alias ls='ls -CF'               #display in columns and show file types
alias lsl='ls -lhFA | less'     #display long lists in less format
alias cpwd='pwd|tr -d "\n"|pbcopy'  #copy working directory path
alias ..='cd ..'                #quick way to go up a dir
alias ss='http-server'          #start a node server
#alias py='python'
alias top='top -o cpu'          #sort top by CPU usage
#alias todo='cat ~/todo.txt'
# alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias js='node'
alias vimrc='nvim ~/.vimrc'
alias bash_profile='nvim ~/.bash_profile'
alias it='git'
alias gi='git'
alias g='git'
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gco='git checkout'
alias chrome='open /Applications/Google\ Chrome.app'
alias firefox='open /Applications/Firefox.app'
alias safari='open /Applications/Safari.app'
alias spotify='open /Applications/Spotify.app'
alias slack='open /Applications/Slack.app'

alias ctags="`brew --prefix`/bin/ctags"

# Directory ENV variables
# export repos='/Users/jcharry/repos'

# Set prompt
# autoload -U promptinit; promptinit
# prompt pure
# prompt spaceship
export PATH="/usr/local/opt/mongodb@3.6/bin:$PATH"
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# voltus stuff
# voltus monorepo so we can pick up scripts from there
export PATH="$PATH:Users/jamiecharry/Dev/voltus/bin"

# go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
