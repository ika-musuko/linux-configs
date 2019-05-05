""""" VUNDLE """""
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
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'vim-airline/vim-airline'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'rhysd/clever-f.vim'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'vim-scripts/DrawIt'
Plugin 'rhysd/vim-crystal'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'thosakwe/vim-flutter'

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
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
autocmd VimLeave * call system("xsel -ib", getreg('+'))

""""" PLUGIN SPECIFIC VIMRC """""
map <C-n> :NERDTreeToggle<CR>
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)
let g:clever_f_use_migemo=1

""""" CUSTOM COMMANDS """""
"automatically generate a groff doc from current buffer (requires groff)
command! Doc ! groff -ms % -T pdf > %:r.pdf

"open the current doc as a sent presentation (requires https://tools.suckless.org/sent/)
command! Sent AsyncStop! | sleep 100m | AsyncRun sent %

" Enable Flutter menu
"call FlutterMenu()

" Some of these key choices were arbitrary;
" it's just an example.
nnoremap <leader>fa :FlutterRun<cr>
nnoremap <leader>fq :FlutterQuit<cr>
nnoremap <leader>fr :FlutterHotReload<cr>
nnoremap <leader>fR :FlutterHotRestart<cr>

""""" STANDARD VIMRC """""
" Source a global configuration file if available

filetype plugin indent on
"main settings
syntax enable
set showcmd         " see command as it's being typed
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set hlsearch        " highlight searches
set fileencodings=utf8
set tabstop=4
set shiftwidth=4
set autoindent
set ai
set expandtab
set ls=2            " always show status line
set number
set relativenumber
set clipboard=unnamedplus
set ttimeoutlen=100 " less esc key lag
set background=dark

"vanilla custom commands
command! -nargs=1 Tab set expandtab ts=<args> sw=<args> ai " set custom tab with (ex, :Tab 2)
" force :W and :Q to act like lowercase counterparts
command! W :w 
command! Q :q

"keyboard commands            
map <leader>[ :set virtualedit=""<CR>
map <leader>] :set virtualedit+=all<CR>
map <F11> :noh<CR>

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

" spellcheck color
hi SpellBad ctermfg=015 ctermbg=001 cterm=none guifg=#FFFFFF guibg=#FF0000 gui=none

autocmd FileType crystal setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType dart setlocal shiftwidth=2 tabstop=2 noai 
