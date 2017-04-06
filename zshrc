export ZSH=/Users/polmiro/.oh-my-zsh
COMPLETION_WAITING_DOTS="true"

plugins=(vi-mode github docker tmux git rails rake ruby atom bundler colored-man colorize gem heroku node npm nvm zsh-autosuggestions fasd jira)
source $ZSH/oh-my-zsh.sh

bindkey -v

export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
export ZSH_THEME=agnoster
export FZF_DEFAULT_COMMAND='ag -g ""' # Fzf ignores files in gitignore

changeItermProfileFromTmux() {
  echo -e "\ePtmux;\e\033]50;SetProfile=$1\a\e\\"
}

changeVimBackground() {
	sed -i.bak -e s/background=$1/background=$2/ ~/.config/nvim/settings/appearance.vim
  for window in `tmux list-windows -F '#I'`; do
    for pane in $(tmux list-panes -t $window -F '#P'); do
      pname=$(tmux display-message -t $window.$pane -p '#{pane_current_command}')
      is_vim=$(printf $pname | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$')
      if [ "$pname" "=" "nvim" ]; then 
        tmux send-keys -t $window.$pane ":set background=$2" Enter
      fi
    done
  done
}

dark() {
  changeItermProfileFromTmux dark
	changeVimBackground light dark
}

light() {
  changeItermProfileFromTmux light
	changeVimBackground dark light
}

alias v="nvim"
alias dcd="docker-compose -f docker/development/docker-compose.yml $1"
alias dtd="docker-compose -f docker/test/docker-compose.yml $1"
alias dsd="docker-compose -f docker/sandbox/docker-compose.yml $1"
alias oldvim="vim"
alias vim="nvim"
alias gitbranchcleanup="!git branch --merged | grep  -v '\\*\\|^\\s*\\(master\\|staging\\)$' | xargs -n 1 git branch -d"
