alias dcd="docker-compose -f docker/development/docker-compose.yml $1"
alias dtd="docker-compose -f docker/test/docker-compose.yml $1"
alias dsd="docker-compose -f docker/sandbox/docker-compose.yml $1"
alias oldvim="vim"
alias vim="nvim"
alias gitbranchcleanup="!git branch --merged | grep  -v '\\*\\|^\\s*\\(master\\|staging\\)$' | xargs -n 1 git branch -d"
export FZF_DEFAULT_COMMAND='ag -g ""' # Fzf ignores files in gitignore
