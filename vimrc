" Because vim
set nocompatible

" General
set encoding=utf-8
set number
set nowrap
set scrolloff=5
set colorcolumn=81
set hlsearch
set incsearch
set ignorecase
set smartcase

" Show tabs and lists
"set list
"set list listchars=tab:\|\ ,trail:_
"highlight SpecialKey guifg=<color> ctermfg=<color>

" Tabbing and Indents
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Tmux is dumb
set t_ut=

" Folding
"set foldmethod=indent
"set foldlevel=99

" Set paste mode
set pastetoggle=<F2>

" map uu to exit insert mode
" inoremap uu <ESC>

" ex mode sucks
noremap Q <Nop>

" I hate temp files
set nobackup
set nowritebackup
set noswapfile

" Rubycomplete arguments
"autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby let g:rubycomplete_buffer_loading = 1

" Go is a special case language
autocmd FileType go set noexpandtab
autocmd FileType go set tabstop=4
autocmd FileType go set shiftwidth=4
autocmd FileType go set softtabstop=4

" GoImports wins
let g:go_fmt_command = "goimports"

" CtrlP should only match on filename by default
let g:ctrlp_by_filename = 1

" YCM Has bad keys that conflict with snippets.
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
set completeopt-=preview

" Gitgutter is slow
let g:gitgutter_enabled = 0

" Powerline symbols for status line, preview window makes redrawing painful

" Snippets Triggers
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsListSnippets = '<c-tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Searches stuff
Plugin 'mileszs/ack.vim'
" Makes a an argument text object
"Plugin 'vim-scripts/argtextobj.vim'
" Buffer explorer
"Plugin 'vim-scripts/bufexplorer.zip'
" File/buffer/dir fuzzy searcher
Plugin 'kien/ctrlp.vim'
" Completes open and closing pairs of various surrounds
Plugin 'Raimondi/delimitMate'
" Fuzzy finding
"Plugin 'vim-scripts/FuzzyFinder'
" Makes gists from vim
"Plugin 'mattn/gist-vim'
" Adds vim things in gutter.
"Plugin 'airblade/vim-gitgutter'
" Unde Tree
Plugin 'sjl/gundo.vim'
" Indent lines
"Plugin 'Yggdroot/indentLine'
" Fuzzy finder libs
"Plugin 'vim-scripts/L9'
" Treeviews
Plugin 'scrooloose/nerdtree'
" Network read-write scp/ftp etc
"Plugin 'vim-scripts/netrw.vim'
" Tabs multiple values with regex
"Plugin 'godlygeek/tabular'
" Snippets
Plugin 'SirVer/ultisnips'
" Snippet Pack for Ultisnips
Plugin 'aalvarado/ultisnips-snippets'
" Aliases words and searches
Plugin 'tpope/vim-abolish'
" Powerline substitute
Plugin 'bling/vim-airline'
" Modernizes ga command
"Plugin 'tpope/vim-characterize'
" Solarized color scheme
"Plugin 'altercation/vim-colors-solarized'
" Fugitive Git helper for log viewing
"Plugin 'int3/vim-extradite'
" Git helper
"Plugin 'tpope/vim-fugitive'
" Go helpers
Plugin 'fatih/vim-go'
" Enhances %
"Plugin 'tsaleh/vim-matchit'
" Multiple cursors
"Plugin 'terryma/vim-multiple-cursors'
" For managing sessions more easily
Plugin 'tpope/vim-obsession'
" Makes p and P autoindent.
Plugin 'sickill/vim-pasta'
" Powerline
"Plugin 'Lokaltog/vim-powerline'
" For rails dev
Plugin 'tpope/vim-rails'
" For surrounding text with tags/chars
Plugin 'tpope/vim-surround'
" XP Template snippet engine
" Plugin 'drmingdrmer/xptemplate'
" Super completion
Plugin 'Valloric/YouCompleteMe'
" Vim plugin that displays tags in a window
Plugin 'majutsushi/tagbar'

" Self installed bundles
Plugin 'colorpack'
Plugin 'colorscroll'

call vundle#end()
filetype plugin indent on

" Fuzzyfinder maps
nmap ,f :FufDir<CR>

" CtrlP maps
nmap ,d :CtrlPDir<CR>
nmap ,b :CtrlPBuffer<CR>
let g:ctrlp_map = ',p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rw'
set wildignore+=*/.git/*

nmap <F3> :GitGutterToggle<CR>

" nerdTree
map <C-n> :NERDTreeToggle<CR>
" autoload the tree when start vim
" autocmd vimenter * NERDTree

" tagbar
nmap <F8> :TagbarToggle<CR>

" Automatically open quickfix window
au QuickFixCmdPost grep cwindow 5

" Add a nice rails-friendly find in files command
command! -nargs=1 F grep -i -r --exclude-dir=log --exclude-dir=.git --exclude-dir=tmp --exclude-dir=public/assets --exclude-dir=vendor --exclude=tags <args> .

" Make a command to fold everything up.
command! -nargs=0 Fall set foldmethod=syntax | exe "normal zM" | set foldmethod=manual

" Make a keybind for Go test coverage
au FileType go nmap <leader>t <Plug>(go-coverage)

" Make awesome always-visible status line
"set statusline=%f\ %m%r%y\ d:%03b\ h:%02B\ %{fugitive#statusline()}%=%l,%c\ %P
set laststatus=2

if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
  set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 10
  "set guifont=Powerline\ Consolas\ 14
  set guioptions-=T "Toolbar
  set guioptions-=L "Something
  set guioptions-=l "Left scrollbar
  set guioptions-=m "Menu

  set background=light
  colors solarized

  "let g:airline_theme = 'solarized'
  let g:airline_powerline_fonts = 1
  let g:Powerline_symbols = 'fancy'
else
  colors Mustang
endif

" Syntax and colors
syntax on
set t_Co=256
"set t_Co=8

" Dark Themes
"colors zenburn
"colors jellybeans
"colors kellys
"colors wombat256
"colors xoria256
"colors zmrok
"colors rootwater
"colors psclone
"colors darkburn
"colors slate
"colors sorcerer
"colors solarized
"colors Mustang

" Light Themes
"colors wood
"colors zenesque
"colors autumn
"colors oceanlight
"colors summerfruit256
