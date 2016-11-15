set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript', { 'for' : 'javascript.jsx' }
Plugin 'mxw/vim-jsx', { 'for' : 'javascript.jsx' }
Plugin 'tomtom/tcomment_vim'
Plugin 'ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mileszs/ack.vim'

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

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" scrolling
set sidescrolloff=5           " Keep at least 5 lines left/right
set scrolloff=5               " Keep at least 5 lines above/below

" Indenting
" set tabstop=4
" set softtabstop=4
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
nnoremap <LocalLeader>u :let @+=expand('%')<CR>

" Unhighlight
nnoremap <LocalLeader>q :nohlsearch<CR>

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
