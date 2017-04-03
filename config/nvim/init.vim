call plug#begin('~/.config/nvim/plugged')

" Neovim
Plug 'neomake/neomake'

" Appearance
Plug 'chrisbra/Colorizer'
Plug 'skwp/vim-colors-solarized'
Plug 'jby/tmux.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'

" Helpers
Plug 'qpkorr/vim-bufkill'
Plug 'Shougo/unite.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'


" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'

" Languages
Plug 'jtratner/vim-flavored-markdown'
Plug 'skwp/vim-html-escape'

" Project
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Ruby
Plug 'ck3g/vim-change-hash-syntax'

" Node

" Search
Plug 'skwp/greplace.vim'

" improvements
Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"Plug 'vim-scripts/AnsiEsc.vim.git'

" Distraction free vim
Plug 'junegunn/goyo.vim'

call plug#end()

" global customizations

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all 
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Other ============================
set laststatus=2
set listchars=tab:▸\ ,eol:¬,trail:·
set encoding=utf-8
set clipboard+=unnamedplus
set mouse=nir
set nolist

" Load settings
so ~/.config/nvim/settings.vim

