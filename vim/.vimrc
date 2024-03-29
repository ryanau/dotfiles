set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim' " plugin manager
Plugin 'easymotion/vim-easymotion' " jump to word quickly
Plugin 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] } " file tree
Plugin 'tpope/vim-surround' " changeing quotes
Plugin 'tomtom/tcomment_vim' " easy commenting
Plugin 'jiangmiao/auto-pairs' " insert quotes in pairs
Plugin 'bling/vim-airline' " status bar
Plugin 'vim-airline/vim-airline-themes' " status bar themes
Plugin 'mileszs/ack.vim' " global search
Plugin 'airblade/vim-gitgutter' " show git diff in vim
Plugin 'tpope/vim-fugitive' " git integration
Plugin 'jeetsukumaran/vim-buffergator' " easy buffer nav
Plugin 'christoomey/vim-tmux-navigator' " tmux integration
Plugin 'junegunn/fzf.vim' " search for file
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'tpope/vim-endwise' " adding 'end' in ruby
Plugin 'tpope/vim-abolish' " change casing
Plugin 'tpope/vim-repeat' " repeat commands for some plugins
Plugin 'junegunn/vim-easy-align' " aligning text
Plugin 'garbas/vim-snipmate' " vim snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'honza/vim-snippets'
Plugin 'svermeulen/vim-easyclip' " true blackhole deletion
Plugin 'AndrewRadev/splitjoin.vim' " joining/splitting ruby blocks
Plugin 'neomake/neomake' " linting
Plugin 'ConradIrwin/vim-bracketed-paste' " set paste for you
Plugin 'sheerun/vim-polyglot'
Plugin 'sickill/vim-pasta'
Plugin 'machakann/vim-swap'
Plugin 'tpope/vim-rhubarb'
Plugin 'rhysd/clever-f.vim'
Plugin 'tomlion/vim-solidity'

" Syntax highlighting, file extension support
Plugin 'tpope/vim-rails', { 'for' : 'ruby' }
Plugin 'hail2u/vim-css3-syntax', { 'for' : 'sass.css' }
Plugin 'fleischie/vim-styled-components'
Plugin 'AndrewRadev/vim-eco'

runtime macros/matchit.vim

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
set iskeyword+=- " Don't treat dashes as word separators.

set backspace=indent,eol,start

" Toggle relative numbering
set relativenumber
autocmd! InsertEnter,InsertLeave * set invrelativenumber

" alert for over 100 chars
set colorcolumn=101

" set autochdir

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
let g:EasyMotion_do_mapping = 0 " Disable default mappings"
map <LocalLeader> <Plug>(easymotion-prefix)
hi EasyMotionTarget ctermbg=none ctermfg=green
nmap s <Plug>(easymotion-overwin-f)
let g:EasyMotion_smartcase = 1

" Split
set splitbelow
set splitright

" Search word under cursor
nnoremap <LocalLeader>s *

" Unhighlight
nnoremap <LocalLeader>q :nohlsearch<CR>

" File specific line widths
autocmd BufNewFile,BufReadPre *.rb,*.rake setlocal textwidth=100

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeHijackNetrw=0
nnoremap <LocalLeader>m :call NerdTreeToggle()<CR>
nnoremap <LocalLeader>m :NERDTreeToggle<CR>
nnoremap <LocalLeader>f :NERDTreeFind<CR>
let g:NERDTreeWinSize = 50

let g:NERDTreeMapOpenVSplit='<C-v>'
let g:NERDTreeMapOpenSplit='<C-s>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-p> :FZF -m<CR>
nmap <LocalLeader>a :FzfAg<Space>
nmap <LocalLeader>. :FzfTags<CR>

let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

let g:fzf_files_options =
  \ '--color=always ' .
  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor    " Use ag over grep
endif

" Search directory for word under cursor
nmap S :FzfAg (self\.)?<C-R><C-W><CR>

" Open windows in splits
let g:fzf_action = {
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
\ }

" Appearance
let g:fzf_layout = { 'down': '~30%'  }
let g:fzf_nvim_statusline = 0
let g:fzf_command_prefix = 'Fzf'

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
nnoremap <LocalLeader>u :let @+=expand('%')<CR>

" Close buffer
map <leader>g :bp<bar>sp<bar>bn<bar>bd<CR>.

" Move lines
nnoremap fj :m .+1<CR>==
nnoremap fk :m .-2<CR>==

" Easyclip
nnoremap gm m

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim JSX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

" dark red
hi tsxTagName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme = 'bubblegum'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

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
nmap <silent> <LocalLeader>gr :Gbrowse<CR>
vmap <silent> <LocalLeader>gr :Gbrowse<CR>

let g:fugitive_github_domains = ['github.com']

""""""""""""""""""""""""""""""""""""
" Easy Align
""""""""""""""""""""""""""""""""""""

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)"


""""""""""""""""""""""""""""""""""""
" SplitJoin
""""""""""""""""""""""""""""""""""""
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0


""""""""""""""""""""""""""""""""""""
" Neomake
""""""""""""""""""""""""""""""""""""
" call neomake#configure#automake('w')
let g:neomake_open_list=0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
let g:neomake_logfile = '/usr/local/var/log/neomake.log'
autocmd! BufWritePost * Neomake

""""""""""""""""""""""""""""""""""""
" GitGutter
""""""""""""""""""""""""""""""""""""
nmap <LocalLeader>ha <Plug>GitGutterNextHunk
nmap <LocalLeader>hr <Plug>GitGutterUndoHunk

""""""""""""""""""""""""""""""""""""
" VimPasta
""""""""""""""""""""""""""""""""""""
let g:pasta_disabled_filetypes = ["coffee", "markdown", "yaml", "slim", "nerdtree"]

let g:snipMate = { 'snippet_version' : 1 }
