" ------------------------------------------------------------
" VUNDLE
" ------------------------------------------------------------

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" ------------------------------------------------------------

" Base
" ==============================

Plugin 'VundleVim/Vundle.vim'

" Languages
" ==============================

" Python
Plugin 'davidhalter/jedi-vim' " completion

" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer' " completion

" XML
Plugin 'othree/xml.vim'

" GLSL
Plugin 'tikhomirov/vim-glsl'

" General Functionality
" ==============================

Plugin 'w0rp/ale'
Plugin 'shougo/neocomplete.vim'

Plugin 'junegunn/fzf.vim'

Plugin 'sirver/ultisnips'
Plugin 'majutsushi/tagbar'

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" Appearance
" ==============================

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'morhetz/gruvbox'

" ------------------------------------------------------------

call vundle#end()
filetype plugin indent on

" ------------------------------------------------------------
" SETTINGS
" ------------------------------------------------------------

" Languages
" ==============================
" Language specific settings are located under ~/.vim/ftplugin/*

" Plugins
" ==============================

" Jedi
let g:jedi#popup_on_dot = 0
let g:jedi#smart_auto_mappings = 0

" Ale
let g:ale_lint_on_text_changed = 'never'

" UltiSnips
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Airline
set laststatus=2

let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

let g:airline_theme = 'gruvbox'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = ''

" Internal / Shipped Plugins
" ==============================

" matchit
runtime! macros/matchit.vim " Extended % matching for HTML, LaTeX, and more ...

" netrw
let g:netrw_banner = 0

" General
" ==============================

set history=128 " Number of rememebered command-lines

set omnifunc=syntaxcomplete#Complete " Enable omni-completion

set scrolloff=10 " Minimal number of screen lines to keep above / below cursor

set textwidth=79 " Wraps text as close to set characters as white space allows

set ttimeoutlen=10 " Lower time that is waited for a key code / sequence

" User Interface
syntax enable " Enables syntax highlighting

set background=dark
silent! colorscheme gruvbox

set number " Show line numbers

set wildmenu " Visual autocomplete for command menu

set cursorline " Highligh current line

set colorcolumn=80
highlight colorcolumn ctermbg=darkgray

" Tabs and Spaces
set tabstop=4 " How many columns a tab counts for
set softtabstop=4 " How many columns are inserted when pressing tab
set shiftwidth=4 " How many columns text will be shifted
set expandtab " Insert spaces when pressing tab

filetype indent on " Load filetype specific indent files

" Searching
set incsearch " Search as characters are entered
set hlsearch " Highlight matches
set ignorecase " Ignores the case when searching
set smartcase " Case sensitive if pattern contains upper case character

set path+=** " Recursive folder search

" ------------------------------------------------------------
" KEY MAPPINGS
" ------------------------------------------------------------

" Plugins
" ==============================

" Tagbar (Tags)
nnoremap <Leader>T :TagbarToggle<CR>

" fzf
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>

" commentary.vim
nnoremap <Leader>c :Commentary<CR>
vnoremap <Leader>c :Commentary<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" General
" ==============================

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Remove all trailing whitespace when pressing <Leader>w
nnoremap <silent> <leader>w m':let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s
            \<Bar> :nohl <Bar> :unlet _s <CR>`'

" Mute search highlighting when pressing Control-l
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
