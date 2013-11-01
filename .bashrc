# !/bin/bash

# Source Bash sub-files
source ~/.dotfiles/.bash_aliases
source ~/.dotfiles/.bash_brew
source ~/.dotfiles/.bash_design
source ~/.dotfiles/.bash_rvm # RVM specific config

# restore normal bin folders if you've been screwing around with the path
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

#Default prompt design
#export PS1="\u@\h:\w$ "

# -----------------------------------------------
# Startup:
# \033 is the escape sequence for colors
# Echoes a yellow Australia, and colored environment variables
# -----------------------------------------------

startup_prompt() {
    local date_formatted=`date +"%A %d %B %C%y"`
    local time_formatted=`date +"%r"`
    local current_filesystem_disk_usage=`df -H $PWD | grep -vE '^Filesystem' | awk '{ print $5 " " $1 }'`

    echo ""
    echo -e "\033[33m  .-_|\   \033[0m\033[90m[\033[0m \033[36m$USER\033[0m\033[90m @ \033[0m\033[36m$HOSTNAME\033[0m \033[90m]\033[0m"
    echo -e "\033[33m /     \  \033[0m\033[90m[\033[0m $date_formatted $time_formatted \033[90m]\033[0m"
    echo -e "\033[33m \_.-._/  \033[0m\033[90m[\033[0m Current Disk Usage: \033[33m$current_filesystem_disk_usage\033[0m \033[90m]\033[0m"
    echo -e "\033[33m      v   \033[0m"
    echo ""
}

startup_prompt