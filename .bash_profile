# This loads configuration from .bashrc
# But we're not gonna do that...
#if [ -f ~/.bashrc ]; then
    #source ~/.bashrc
#fi

# Welcome Message
echo -n "Welcome to UNIX " ; whoami
echo ""
echo -n "Today is " ; date "+%m-%d-%y %H:%M:%S"
echo ""
cal
echo ""
echo -n "Uptime: " ; uptime

# Git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Git bash completion
source ~/.git-completion.bash

# Set aliases
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
alias py='python'
alias top='top -o cpu'          #sort top by CPU usage
alias todo='cat ~/todo.txt'
alias vim='nvim'
alias js='node'

# Navigation aliases - folders that I go to all the time...
alias classes='cd ~/Documents/School/ITP/Classes/'
alias cls='cd ~/Documents/School/ITP/Classes/'
alias dev='cd ~/Documents/Dev'
alias noFreeLunch='cd /Users/jamiecharry/Documents/Dev/IPK/noFreeLunch'

# Colorize output
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
#eval 'dircolors /Users/jamiecharry/dircolors-solarized-master'
#export LSCOLORS=GxFxCxDxBxegedabagaced

# Grep options
export GREP_OPTIONS="--color=auto"  # Show grep results in color, but only when outputting in terminal window

# PATH Stuff
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$HOME/bin:$PATH"

# RVM to path (ruby gems)
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"  #macports I think
#PATH=/opt/local/bin:$PATH

# History information
export HISTSIZE=10000                   # 500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p '
export HISTCONTROL=ignoreboth           # ignoredups:ignorespace
export HISTIGNORE="history:pwd:exit:df:ls:ls -la:ll"

# Bash prompt
#export PS1='\W 🌍  '
#export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PS1="\W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\] 🌍  "

# A quick way to count the most common bash commands
#cut -f1 -d" " .bash_history | sort | uniq -c | sort -nr | head -n 30

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
#export PATH="/usr/local/sbin:$PATH"

# GIF function

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# AWS Configuration
export AWS_DEFAULT_PROFILE=jamie.charry
