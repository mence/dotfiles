#!/bin/bash

# Easier navigation: .., ..., ~ and -
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# you could keep going forever if you want, but I'd probably write a function past this point
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# History
alias h="history" #use history to see all commands executed. use ! to run a specific one

# List all files colorized in long format, including dot files
alias la="ls -Gla" # -G = Color; -l = long format; -a = include dotfiles
alias dir='ls -Glah' # -G = Color; -l = long format; -a = include dotfiles; -h = roll file sizes up into units
alias lsdate='ls -Glahtr' # Sorted by last modified date

# List only directories
alias lsd='ls -l | grep "^d"'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias ipconfig="ifconfig" # because Windows derp

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Start an HTTP server from a directory
alias server="open http://localhost:8080/ && python -m SimpleHTTPServer 8080"

# Shortcuts
alias g="git"
alias v="vim"
alias s="subl" # Sublime Text
#alias m="mate" # TextMate

#Personal Shortcuts
alias d="cd ~/Dropbox"
alias p="cd ~/projects"
alias dp="d && cd projects" # If ~/projects is symlinked to Dropbox, this is unnecessary. But not always, so.
alias doc="cd ~/Documents"

# File size
alias fs="stat -f \"%z bytes\""

# Make Spotlight less annoying, especially when super long indexing
alias spotoff="sudo mdutil -a -i off" # Disable Spotlight
alias spoton="sudo mdutil -a -i on" # Enable Spotlight

# Make life nicer
alias grep='grep --color -n' # This can break some scripts that heavily use grep. Use with caution.

# Git Help
alias pull='git pull --rebase --verbose'
alias push='git push'
alias ga='git add'
alias gc='git commit'
alias status='git status'
alias gs='git status'
alias greset='git reset --hard HEAD'
alias gclean='git clean -fdx'
alias stash='git stash'
alias pop='git stash pop'
alias local_commits='git log --branches --not --remotes=origin'
alias update='git stash && git pull && git stash pop' # expanded this from stash-pull-stash pop to allow for removal of other aliases
alias glog='git log --pretty="format:%C(yellow)%h%Cgreen%d%Creset %s %C(white) %an, %ar%Creset"'
alias gl='glog --graph'
alias gla='gl --all'
alias fp='git fetch --all --prune --verbose && git pull --rebase --verbose' #Fetch everything while removing old branches; Pull with rebase
alias gf='git fetch --all --prune --verbose'
alias gff='git fetch --all --verbose --ff-only' #fetch and move your current branch's changes to the tip of the latest
alias gdiff='git diff' # use git diff instead of system diff
alias gbr='git branch -a' # show all git branches, including remotes

# Ruby / Rails
alias r='rails'
alias ber='bundle exec rails'

#This is a long winded command that refreshes master after discarding any changes in a branch. IT CAN BE DESTRUCTIVE.
alias gitpullmaster='echo -e "\033[41m---WARNING---\033[0m" &&
					read -p "You will lose EVERYTHING in your current branch. Press [Enter] key to continue if you are absolutely sure..." &&
					echo -e "\033[33m---DISCARD CHANGES---\033[0m" && git checkout -- . &&
					echo -e "\033[33m---CHECKOUT MASTER---\033[0m" && git co master &&
					echo -e "\033[33m---FETCH MASTER---\033[0m" && git fetch --all --prune --verbose &&
					echo -e "\033[33m---PULL MASTER WITH REBASE---\033[0m" && git pull --rebase --verbose'

# Some of this is here so that pairing is easier
alias ll='ls -Glah' # Added color
alias be='bundle exec'
alias sc='bundle exec rails console'
alias cuke='bundle exec cucumber'
alias ghist='git log --pretty=format:"%h %ad | %s%d [%an]" --graph --date=short' # note that this is different from git hist, which is in .gitaliasconfig

#alias gchanged='git_changed_reflog'
#function git_changed_reflog() {
#	for hash in `git reflog | awk '{print $1}'` ; do git show --name-only $hash; done;
#}

# puts current Git branch in clipboard
function cpbranch() {
    git rev-parse --abbrev-ref HEAD | tr -d '\n' | pbcopy
}