export HISTSIZE=10000
export HISTFILESIZE=20000
# don't put duplicate lines in the history. See bash(1) for more options
# export HISTCONTROL=ignoredups

# Change prompt
# https://en.wikipedia.org/wiki/ANSI_escape_code
PS1='\[\e[1;91m\]\[\e[32m\][\u@\h \w]\$\[\e[0m\] '

# enable color support of ls and also add handy aliases
eval `dircolors -b`
alias ls='ls --color=auto'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -alh'
alias la='ls -A'
alias l='ls -CFlh'
alias lsc='ls -lcr'      # sort by change time
alias lsa='ls -lur'      # sort by access time

alias ps='ps auxf'
alias openports='netstat -nape --inet'
alias opennet='lsof -i'
alias mkdir='mkdir -p -v'
alias df='df -h'
alias ping='ping -c 4'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Show contents of current foler ordered by descending size (including folder size)
alias duf='du -a -h --max-depth=1 | sort -hr'

alias benchmark='time \dd if=/dev/zero of=/dev/null bs=1M count=32768'

#docker
alias dc='docker-compose'
alias dcl='docker-compose logs'
alias dcrm='docker-compose rm'
alias dcsrm='docker-compose stop && docker-compose rm'
alias dcs='docker-compose stop'
alias dcu='docker-compose up -d'
alias dcul='docker-compose up -d && docker-compose logs'
alias dpl='docker logs'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drm='docker rm'
alias drmi='docker rmi'

#vagrant
alias vstatus='vagrant global-status'
alias vssh='vagrant ssh'
alias vdf='vagrant destroy -f'
alias vss='vagrant snapshot save '
alias vsr='vagrant snapshot restore '
alias vsl='vagrant snapshot list'
alias vsd='vagrant snapshot delete'

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }
 
 upinfo ()
{
echo -ne "${green}$HOSTNAME ${red}uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}
 
 # Makes directory then moves into it
function mkcdr {
    mkdir -p -v $1
    cd $1
}
 
compressdirectory(){
DIRECTORY="$1"
if [ -d "$DIRECTORY" ]; then
	# tar cf - "$DIRECTORY" -P | pv -s $(du -sb "$DIRECTORY" | awk '{print $1}') | gzip > $DIRECTORY.tar.gz #pv not available
	tar -zcvf $DIRECTORY.tar.gz $DIRECTORY
fi

# Creates an archive from given directory
mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }
mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }

 }
 
 up(){
  local d=""
  limit=$1
  for ((i=1 ; i <= limit ; i++))
    do
      d=$d/..
    done
  d=$(echo $d | sed 's/^\///')
  if [ -z "$d" ]; then
    d=..
  fi
  cd $d
}


