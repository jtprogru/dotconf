# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##########  MAIN  ##########
source $HOME/.env
export PATH=$HOME:/usr/local/bin:/opt/metasploit-framework/bin:$PATH
export ZSH=/Users/jtprog/.oh-my-zsh
export WPDIR=/Users/jtprog/workplace
export WPDIRPY=/Users/jtprog/workplace/python
export MYLOGDIR=/Users/jtprog/workplace/logs
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export ANSIBLE_VAULT_PASSWORD_FILE=~/.vault_password
export MONO_GAC_PREFIX="/usr/local"
ZSH_THEME="powerlevel10k/powerlevel10k"
export UPDATE_ZSH_DAYS=13
ENABLE_CORRECTION="true"
HIST_STAMPS="yyyy-mm-dd"
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker brew docker-compose emoji osx python themes xcode ansible colored-man-pages iterm2 nmap tmuxinator)

source $ZSH/oh-my-zsh.sh

# User configuration
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"
# ssh
export SSH_KEY_PATH="~/.ssh"
# All alias moved to ~/.zsh_aliases
source ~/.zsh_aliases


setopt menucomplete
zstyle ':completion:*' menu select=1 _complete _ignored _approximate

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
PHP_AUTOCONF="/usr/local/bin/autoconf"

########## Function for packing and unpacking archive
##### Example: unpack file.ext
unpack () {
 if [ -f $1 ] ; then
 case $1 in
 *.tar.bz2)   tar xjf $1        ;;
 *.tar.gz)    tar xzf $1     ;;
 *.bz2)       bunzip2 $1       ;;
 *.rar)       unrar x $1     ;;
 *.gz)        gunzip $1     ;;
 *.tar)       tar xf $1        ;;
 *.tbz2)      tar xjf $1      ;;
 *.tbz)       tar -xjvf $1    ;;
 *.tgz)       tar xzf $1       ;;
 *.zip)       unzip $1     ;;
 *.Z)         uncompress $1  ;;
 *.7z)        7z x $1    ;;
 *)           echo "I don't know how to extract '$1'..." ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi
}
##### Example: pack ext file/dir
pack () {
 if [ $1 ] ; then
 case $1 in
 tbz)       tar cjvf $2.tar.bz2 $2      ;;
 tgz)       tar czvf $2.tar.gz  $2       ;;
 tar)       tar cpvf $2.tar  $2       ;;
 bz2)       bzip $2 ;;
 gz)        gzip -c -9 -n $2 > $2.gz ;;
 zip)       zip -r $2.zip $2   ;;
 7z)        7z a $2.7z $2    ;;
 *)         echo "'$1' cannot be packed via pk()" ;;
 esac
 else
 echo "'$1' is not a valid file"
 fi

}
########### Tab-autocomplete for ssh connections
h=()
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
  h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi
# Дополнительные функции
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export PATH="/usr/local/opt/gnu-getopt/bin:/usr/local/opt/sqlite/bin:$PATH"
export EDITOR="/usr/bin/vim"
export MAILPATH="~/.config/mutt/mail"
export GOPATH="/Users/jtprog/workplace/golang"
export PATH="$PATH:/usr/local/go/bin:/Users/jtprog/workplace/golang/bin:/usr/local/opt/ruby/bin:/usr/local/opt/curl/bin"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export KUBECONFIG=$HOME/.kube/config
PATH=${PATH:+:${PATH}}; export PATH;

fpath=(/usr/local/share/zsh-completions $fpath)

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3
# pip zsh completion end

HOMEBREW_FOLDER="/usr/local/share"
source "$HOMEBREW_FOLDER/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$HOMEBREW_FOLDER/zsh-autosuggestions/zsh-autosuggestions.zsh"
export PATH="/usr/local/opt/nss/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
#For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export NGROK_TOKEN="1R2x6iULPMDmohIOmKBiRUty7vM_3Cfi9asoymfnKPc2UChbu"
# The next line updates PATH for Yandex Cloud CLI.
#if [ -f '/Users/jtprog/.yandex-cloud/path.bash.inc' ]; then source '/Users/jtprog/.yandex-cloud/path.bash.inc'; fi

# added by travis gem
[ -f /Users/jtprog/.travis/travis.sh ] && source /Users/jtprog/.travis/travis.sh
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/Users/jtprog/workplace/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ncurses/lib"
export CPPFLAGS="-I/usr/local/opt/ncurses/include"
export PKG_CONFIG_PATH="/usr/local/opt/ncurses/lib/pkgconfig"

#. $(multiwerf use 1.0 stable --as-file)
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
#source ~/.deployer_completion

export PATH="$HOME/.poetry/bin:/usr/local/opt/python@3.8/bin:$PATH"
#For compilers to find python@3.7 you may need to set:
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"
# For pkg-config to find python@3.7 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/python@3.8/lib/pkgconfig"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="/usr/local/opt/libressl/bin:$PATH"

export LC_CTYPE=ru_RU.UTF-8
export LANG=ru_RU.UTF-8
#export LC_ALL=ru_RU.UTF-8
export LC_ALL='en_US.UTF-8'

DEFAULT_USER="jtprog"

