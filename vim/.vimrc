set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'terryma/vim-multiple-cursors'

Plugin 'pangloss/vim-javascript', { 'for' : 'javascript.jsx' }
Plugin 'mxw/vim-jsx', { 'for' : 'javascript.jsx' }
Plugin 'tpope/vim-rails', { 'for' : 'ruby' }
Plugin 'hail2u/vim-css3-syntax', { 'for' : 'scss.css' }

call vundle#end()
filetype plugin indent on

inoremap jk <ESC>

let mapleader = "\<Space>"

filetype plugin indent on
syntax on
set encoding=utf-8

" Display
set ruler " show the line number on the bar
set hidden
set nowrap " don't wrap lines
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set showmatch " set show matching paranthesis
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case sensitive otherwise
set smarttab " insert tabs on start of line accord. to shiftwidth, not tabstop
set hlsearch " highlight search terms
set incsearch " show search matches as you type
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set autoread
set updatetime=250
set list lcs=tab:\|\ 
set list
set number

set backspace=indent,eol,start

" Toggle relative numbering
set relativenumber
autocmd! InsertEnter,InsertLeave * set invrelativenumber


" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" scrolling
set sidescrolloff=5           " Keep at least 5 lines left/right
set scrolloff=5               " Keep at least 5 lines above/below

" Indenting
set tabstop=2 softtabstop=0 expandtab shiftwidth=2

" Clipboard
set clipboard=unnamed
set fileformats=unix
set ff=unix

" Copy to clipboard
vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>

" Local Leader
let maplocalleader="\<Space>"

" Easy Motion
map <LocalLeader> <Plug>(easymotion-prefix)
hi EasyMotionTarget ctermbg=none ctermfg=green

" Split
set splitbelow
set splitright

" Search word under cursor
nnoremap <LocalLeader>s *

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeHijackNetrw=0
nnoremap <LocalLeader>m :call NerdTreeToggle()<CR>
nnoremap <LocalLeader>m :NERDTreeToggle<CR>
nnoremap <LocalLeader>f :NERDTreeFind<CR>
let g:NERDTreeWinSize = 50

let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapOpenSplit='<C-s>'

" Ctrlp
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0
let g:ctrlp_working_path_mode = 'r'

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" Buffers
let g:buffergator_viewport_split_policy = 'R'
let g:buffergator_suppress_keymaps = 1
let g:buffergator_mru_cycle_loop = 1

" Update buffer
nnoremap <LocalLeader>r :checktime<CR>

" Go to the previous buffer open
nmap <leader>jj :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>kk :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" Close the current buffer and move to the previous one
nmap <C-q> :bp <BAR> bd #<CR>"

" Open new empty buffer
nmap <leader>T :enew<cr>

" Tcomment
map <LocalLeader>c :TComment<CR>

" Copy file path
nnoremap cp :let @" = expand("%")"

" Unhighlight
nnoremap <LocalLeader>q :nohlsearch<CR>

" Move lines
nnoremap fj :m .+1<CR>==
nnoremap fk :m .-2<CR>==

" Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!
nnoremap <LocalLeader>a :Ack!<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#empty_message = 'local'
" let g:airline#extensions#tmuxline#enabled = 0
set laststatus=2

" Enable list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just file name
let g:airline#extensions#tabline#fnamemod = ':t'

""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""
nnoremap <silent> <LocalLeader>gs :Gstatus<CR>
nnoremap <silent> <LocalLeader>gd :Gdiff<CR>
nnoremap <silent> <LocalLeader>gc :Gcommit<CR>
nnoremap <silent> <LocalLeader>gb :Gblame<CR>
nnoremap <silent> <LocalLeader>gr :Gread<CR>
nnoremap <silent> <LocalLeader>gw :Gwrite<CR>
