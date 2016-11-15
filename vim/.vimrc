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
set ruler			" show the line number on the bar
set hidden
set nowrap			" don't wrap lines
set autoindent		" always set autoindenting on
set copyindent		" copy the previous indentation on autoindenting
set showmatch		" set show matching paranthesis
set ignorecase		" ignore case when searching
set smartcase		" ignore case if search pattern is all lowercase, case sensitive otherwise
set smarttab		" insert tabs on start of line accord. to shiftwidth, not tabstop
set hlsearch		" highlight search terms
set incsearch		" show search matches as you type
set history=1000	
set undolevels=1000
set title
set visualbell
set noerrorbells
set autoread
set updatetime=250
set list lcs=tab:\|\ 
set list

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

" Local Leader
let maplocalleader="\<Space>"

" Easy Motion
map <LocalLeader> <Plug>(easymotion-prefix)
hi EasyMotionTarget ctermbg=none ctermfg=green

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nnoremap <LocalLeader>m :call NerdTreeToggle()<CR>
let g:NERDTreeWinSize = 50

" Smart Toggle
function! NerdTreeToggle()
  if exists("t:NERDTreeBufName")
	NERDTreeToggle
  else
	NERDTreeFind
  endif
endfunction

let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapOpenSplit='<C-s>'

" Ctrlp
let g:ctrlp_max_depth=40
let g:ctrlp_max_files=0

" Tcomment
map <LocalLeader>c :TComment<CR>

" Copy file path
nnoremap cp :let @" = expand("%")"

" Unhighlight
nnoremap <LocalLeader>q :nohlsearch<CR>

" Move lines
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Jump to front/back of lines
nnoremap <C-h> ^
nnoremap <C-l> $

" Toggle relative numbering
set relativenumber
autocmd! InsertEnter,InsertLeave * set invrelativenumber

" Silver Searcher
let g:ackprg = 'ag --nogroup --nocolor --column'
cnoreabbrev Ack Ack!
nnoremap <LocalLeader>a :Ack!<Space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#empty_message = 'local'
let g:airline#extensions#tmuxline#enabled = 0
set laststatus=2

""""""""""""""""""""""""""""""""""""
" Fugitive
""""""""""""""""""""""""""""""""""""
nnoremap <silent> <LocalLeader>gs :Gstatus<CR>
nnoremap <silent> <LocalLeader>gd :Gdiff<CR>
nnoremap <silent> <LocalLeader>gc :Gcommit<CR>
nnoremap <silent> <LocalLeader>gb :Gblame<CR>
nnoremap <silent> <LocalLeader>gr :Gread<CR>
nnoremap <silent> <LocalLeader>gw :Gwrite<CR>
