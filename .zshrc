export ZSH=/Users/failip/.oh-my-zsh

ZSH_THEME="büro"
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  osx
  npm
  sublime
  zsh-autosuggestions
  zsh-syntax-highlighting
  git
  docker
)
export DEFAULT_USER="failip"
export EDITOR='vim'
alias c="clear"
alias myip="ifconfig |grep inet"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home"
export PATH=/Users/failip/Applications/tizen/tizen-studio/tools:$PATH
alias ip='echo -e "\033[1;35m$(ifconfig | grep -oE -m1 "\b192.168.0.{3}[0-9]{1,3}\b" | head -1)"'
alias python="python3"
alias 7zip="7za"
alias t="touch"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias server="echo '🏃 Running on 127.0.0.1:80 🏃' && docker run --rm --name=webserver -i -t -p 80:80 -v ~/code/webserver/html:/usr/share/nginx/html nginx"
alias lclhst="chrome 127.0.0.1:80"
alias testdatabase="docker run -e POSTGRES_USER=scsuser -e POSTGRES_PASSWORD=password -e POSTGRES_DB=projektscs --rm -p 5432:5432 postgres"
alias pip="pip3"
search () { chrome "? $*";}
source ~/.oh-my-zsh/oh-my-zsh.sh
if [ "$TMUX" = "" ]; then tmux; fi
alias "?"="search"
