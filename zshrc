export ZSH=/Users/polmiro/.oh-my-zsh
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
export ZSH_THEME=agnoster
export ZSH_CUSTOM=/Users/polmiro/.zsh-custom
export FZF_DEFAULT_COMMAND='ag -g ""' # Fzf ignores files in gitignore
plugins=(vi-mode github docker tmux git rails rake ruby atom bundler colored-man colorize gem heroku node npm nvm zsh-autosuggestions fasd jira)
source $ZSH/oh-my-zsh.sh

changeZshTheme() {
  current_zsh_theme="agnoster-light"
  new_zsh_theme="agnoster"
  if [ "$1" '==' 'light' ]; then; current_zsh_theme="agnoster"; fi
  if [ "$1" '==' 'light' ]; then; new_zsh_theme="agnoster-light"; fi
  sed -i.bak -e s/export\ ZSH_THEME=$current_zsh_theme/export\ ZSH_THEME=$new_zsh_theme/ ~/.zshrc
  source ~/.zshrc
}

changeItermProfileFromTmux() {
  echo -e "\ePtmux;\e\033]50;SetProfile=$1\a\e\\"
}

changeVimBackground() {
  current_background=$1
  new_background="dark"
  if [ "$1" '==' 'light' ]; then; new_background="light"; fi
  sed -i.bak -e s/background=$current_background/background=$new_background/ ~/.config/nvim/settings/appearance.vim
  for window in `tmux list-windows -F '#I'`; do
    for pane in $(tmux list-panes -t $window -F '#P'); do
      pname=$(tmux display-message -t $window.$pane -p '#{pane_current_command}')
      is_vim=$(printf $pname | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$')
      if [ "$pname" "=" "nvim" ]; then 
        tmux send-keys -t $window.$pane ":set background=$new_background" Enter
      fi
    done
  done
}

dark() {
  changeItermProfileFromTmux dark
  changeZshTheme dark
  changeVimBackground dark
}

light() {
  changeItermProfileFromTmux light
  changeZshTheme light
  changeVimBackground light
}

bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

alias v="nvim"
alias dcd="docker-compose -f docker/development/docker-compose.yml $1"
alias dtd="docker-compose -f docker/test/docker-compose.yml $1"
alias dsd="docker-compose -f docker/sandbox/docker-compose.yml $1"
alias oldvim="vim"
alias vim="nvim"
alias gitbranchcleanup="!git branch --merged | grep  -v '\\*\\|^\\s*\\(master\\|staging\\)$' | xargs -n 1 git branch -d"
