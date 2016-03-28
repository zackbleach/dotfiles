export ZSH=/Users/zack/.oh-my-zsh
# Path to your oh-my-zsh installation.

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME=""
#
#
# export ZSH_THEME="kennethreitz"
export ZSH_THEME="steeef"

# if [ -n "$INSIDE_EMACS" ]; then
    # export ZSH_THEME="sorin"
# fi
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting extract z rbenv vi-mode)

# User configuration

source /Users/zack/.rbenvrc

export PATH="$HOME/.rbenv/shims/:/usr/local/Cellar/gcc/6.1.0/bin:/usr/local/bin:/usr/local/bin:/Library/Java/JavaVirtualMachines/jdk1.8.0_77.jdk/Contents/Home/bin:/Users/zack/.rbenv/shims:/Users/zack/.rbenv/bin:/usr/local/heroku/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/local/Cellar/vim/7.4.273/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/heroku/bin:/usr/local/opt/coreutils/libexec/gnubin:/Users/zack/bin:~/bin:/Users/zack/.fzf/bin:/Users/zack/stripe/password-vault/bin/:/Users/zack/stripe/space-commander/bin:/Users/zack/Documents/dokku-create/:$HOME/anaconda/bin:"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
### VirtualEnvWrapper stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
alias vi=vim
#
function shell-fg () {
    if [ $#BUFFER -ne 0 ]
    then
        zle push-line
    fi
    BUFFER="fg"
    zle accept-line
}
zle -N       shell-fg
bindkey '^Z' shell-fg

alias f='find ./ -name'
alias rc='vim ~/.zshrc'
alias s='source ~/.zshrc'

bindkey "^R" history-incremental-search-backward
alias pr='~/Documents/pr.sh'
alias vi="vim"
alias vim="nvim"
alias targz="tar -cvzf"
alias tmux="TERM=screen-256color-bce tmux"

alias tls='tmux list-sessions'

export PATH=/usr/local/bin:$PATH

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='ag -g ""'
# export FZF_DEFAULT_OPTS='
    # --color=dark,hl:33,hl+:37,fg+:235,bg+:0,fg+:136
    # --color info:254,prompt:37,spinner:108,pointer:235,marker:235
# '
export FZF_DEFAULT_OPTS='
    --color fg:240,bg:-1,hl:33,fg+:241,bg+:221,hl+:33
    --color info:33,prompt:33,pointer:166,marker:166,spinner:33
'
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='noglob ag -g ""'

# To apply the command to CTRL-T as well
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

eval `dircolors ~/.dir_colors`

ctrlp() {
  </dev/tty nvim -c CtrlP
}
zle -N ctrlp

bindkey "^p" ctrlp

ctrlf() {
  </dev/tty nvim -c FZF
}
zle -N ctrlf

bindkey "^f" ctrlf

ctrln() {
  </dev/tty nvim -c ":e $PWD"
}
zle -N ctrln

bindkey "^n" ctrln
### BEGIN HENSON
export PATH="/Users/zack/stripe/henson/bin:$PATH"
export PATH="/Users/zack/Library/Python/2.7/bin:$PATH"
### END HENSON
#
bindkey -v
#
#
alias ssh=sc-ssh-wrapper

rw () {
cat /usr/share/dict/words | grep -v "'" | grep -v "[A-Z]" | shuf -n 2 | xargs echo
}

if (( $+commands[tag] )); then
  tag() { command tag "$@"; source ${TAG_ALIAS_FILE:-/tmp/tag_aliases} 2>/dev/null }
  alias ag=tag
fi

alias gcc=gcc-6

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"


alias | awk '{print "alias "$0}' | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" > ~/.emacs.d/.cache/eshell/alias
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig/:$PKG_CONFIG_PATH"
alias rubocop="$HOME/.rbenv/shims/rubocop"

git config --add oh-my-zsh.hide-dirty 1


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias bundle='~/.rbenv/shims/bundle'
