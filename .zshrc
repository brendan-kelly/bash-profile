# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/brendan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# From .bash_profile

# Helpful command aliases
alias ls='ls -aFG'
alias ll='ls -laGh'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'
alias grep='grep --color=auto -in'

# Helpful git aliases
alias ga="git add"
alias gaa="git add -A"
alias gac="git add -A && git commit -am"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gch="git checkout"
alias gchd="git checkout dev"
alias gchb="git checkout -b"
alias gd="git diff"
alias gdn="git diff --name-only"
alias glg="git log --graph --abbrev-commit --decorate --format=format:'%C(bold red)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias glo="git log --oneline --decorate"
alias garc="git add -A && git rebase --continue"
alias gp="git push"
alias grc="git rebase --continue"
alias gir="git rebase -i HEAD~"
alias gs="git status"
alias gpuo="git push -u origin "
alias gsu='git submodule update --init --recursive'

# Docker aliases
alias dcu="cd ~/hc/ops-v2 && docker-compose up"
# alias dapi="docker exec -it liondesk-api bash"
alias dadmin="docker exec -it liondesk-admin bash"
alias ddev="docker exec -it liondesk-developers bash"

alias work='cd ~/hc/ops-v2/apps/api'

alias md="make dev"

alias ms="make seed"
alias mf="make fixtures"
alias ml="make lint-all"
alias mp="make all-pretty"
alias mm="make mocha"
alias mc="make coverage"
alias mfc="make fixtures && make coverage"
alias msc="make seed && make coverage"
alias mlc="make lint && make coverage"
alias mt="make test"
alias mlp="make lint-all && make all-pretty"
alias mlf="make all-lint-fixed"
alias mlfp="make all-lint-fixed && make all-pretty"

# alias dstopall="docker stop $(docker ps -aq)"
# alias drmall="docker rm $(docker ps -aq)"
# alias drmiall="docker rmi $(docker images -q)"

# Configures the fuck alias
eval $(thefuck --alias)

# Sublime
alias subl-snips="subl ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"
alias subl-snippets="subl ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User"

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

gitRelease ()
{
    git fetch --prune && if [ -z "$1" ]; then
        echo "What changes have taken place since the last tag & release? major | minor | patch?" && git tag && return;
    fi;
    git checkout master;
    git fetch && git pull master;
    npm version "$1";
    git push origin master;
    git push --follow-tags
}

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
  fi
}

prompt_dir() {
  prompt_segment blue black '%c'
}
