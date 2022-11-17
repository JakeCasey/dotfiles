# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/jakecasey/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"


plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

    alias cdp='cd ~/Documents/Projects/'
    alias tl='tmux ls'
    alias ta='tmux attach -t'
    alias tk='tmux kill-session'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#For quick opening of projects
#

alias o="./open.sh"

function newproject() {
  if [ -z "$1" ]
  then
    echo "No project name supplied."
    exit 1
  fi

  mkdir ./"$1"
  cd "$1"
  git clone https://github.com/JakeCasey/skeleton-key-backend.git && 
  git clone https://github.com/JakeCasey/skeleton-key-frontend.git &&
  git clone https://github.com/JakeCasey/skeleton-key-prisma.git
  $(openproject)
}

function openproject() {
  code ./skeleton-key-frontend
  code ./skeleton-key-backend
}

function openlock() {
  code ./deadlock-frontend
  code ./deadlock-backend
}


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /usr/local/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jakecasey/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jakecasey/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jakecasey/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jakecasey/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

#disable no match
unsetopt nomatch

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#Platform specific aliases.

alias gadp="/usr/local/bin/getEverything.sh"
alias gwp="/usr/local/bin/getWordpress.sh"

alias sshp="ssh -i platform-new.pem ubuntu@portal.mydirigible.com"
alias sshc1="ssh -i cluster-1.pem ubuntu@c1.getdirigible.com"
alias pllogs="ssh -i platform-new.pem -t ubuntu@portal.mydirigible.com 'dokku logs backend -t'"

alias python=python3
