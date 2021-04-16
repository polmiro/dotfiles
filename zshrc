export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim
export GOPATH=/users/polmiro/go
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/Versions/9.5/bin:$PATH"
export ZSH=/Users/polmiro/.oh-my-zsh
export ZSH_THEME=agnoster
export ZSH_CUSTOM=/Users/polmiro/.zsh-custom
export FZF_DEFAULT_COMMAND='ag -g ""' # Fzf ignores files in gitignore
export DEFAULT_USER=polmiro
export KEYTIMEOUT=1
plugins=(
  vi-mode
  github
  docker
  tmux
  git
  rails
  rake
  ruby
  bundler
  colored-man-pages
  colorize
  gem
  heroku
  node
  npm
  nvm
  fasd
  history-substring-search
)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=default"
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

source $ZSH/oh-my-zsh.sh

changeItermProfileFromTmux() {
  echo -e "\ePtmux;\e\033]50;SetProfile=$1\a\e\\"
}

changeZshTheme() {
  current_zsh_theme="agnoster-light"
  new_zsh_theme="agnoster"
  if [ "$1" '==' 'light' ]; then; current_zsh_theme="agnoster"; fi
  if [ "$1" '==' 'light' ]; then; new_zsh_theme="agnoster-light"; fi
  sed -i.bak -e s/export\ ZSH_THEME=$current_zsh_theme$/export\ ZSH_THEME=$new_zsh_theme/ ~/.zshrc

  for window in `tmux list-windows -F '#I'`; do
    for pane in $(tmux list-panes -t $window -F '#P'); do
      pname=$(tmux display-message -t $window.$pane -p '#{pane_current_command}')
      if [ "$pname" "=" "zsh" ]; then
        tmux send-keys -t $window.$pane "source ~/.zshrc" Enter
      fi
    done
  done
}

changeVimBackground() {
  current_background="light"
  new_background="dark"
  if [ "$1" '==' 'light' ]; then; current_background="dark"; fi
  if [ "$1" '==' 'light' ]; then; new_background="light"; fi

  for window in `tmux list-windows -F '#I'`; do
    for pane in $(tmux list-panes -t $window -F '#P'); do
      pname=$(tmux display-message -t $window.$pane -p '#{pane_current_command}')
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

fbr () {
  git checkout $(git for-each-ref --sort=-committerdate refs/heads/ | awk '{print $3}' | cut -c $(echo " refs/head/" | wc -c)- | fzf-tmux)
}

bindkey -v
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

alias dcd="docker-compose -f docker-compose.yml -f docker-compose.dev.yml $1"
alias dcd="docker-compose -f docker-compose.yml -f docker-compose.dev.yml $1"
alias dsd="docker-compose -f docker-compose.yml -f docker-compose.sandbox.yml $1"
alias gitbranchcleanup="!git branch --merged | grep  -v '\\*\\|^\\s*\\(master\\|staging\\)$' | xargs -n 1 git branch -d"
alias dc="docker-compose $1"

. /Library/Python/3.8/site-packages/powerline/bindings/zsh/powerline.zsh


. /usr/local/opt/asdf/asdf.sh
