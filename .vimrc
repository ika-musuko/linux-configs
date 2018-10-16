"vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" airline status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" ale linter
Plugin 'w0rp/ale'

" bulleting
Plugin 'dkarter/bullets.vim'

" fcitx management
Plugin 'vim-scripts/fcitx.vim'

" surround support
Plugin 'tpope/vim-surround'

" . repeat support for plugins
Plugin 'tpope/vim-repeat'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"vimrc
filetype plugin indent on
set fileencodings=utf8
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus

"set relative line numbers
set relativenumber
set number

"easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"normal split creation
set splitbelow
set splitright

"enable 256-color
set t_Co=256

" see command as it's being typed
set showcmd

" mouse support 
set mouse=a

