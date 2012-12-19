  "--------------------------
  "General Stuff
  "-------------------------

  "autoread when file is changed
  set autoread

  "filetype plugin
  filetype plugin on
  filetype indent on

  set hidden

  set nocompatible

  "Get rid of the menus
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l

  "Stop vim from leaving temp files everywhere
  set backupdir=~/.vimtmp
  set directory=~/.vimtmp
  set undofile
  set undodir=~/.vimtmp

"------------
"UI
"------------

"wildmenu
set wildmenu

"always show current position
set ruler

"ignore case while searching
set ignorecase
set smartcase

"map highlight clear to double-Esc
map <Esc><Esc> :nohl<CR>

"Easy window movement
map <c-l> <c-w>l<c-w>_
map <c-h> <c-w>h<c-w>_
map <c-j> <c-w>j<c-w>_
map <c-k> <c-w>k<c-w>_
map - <C-W><
map + <C-W>>

"regex
set magic

"show matching brackets
set showmatch

"line numbers
"set number
set relativenumber

"Highlight the cursor line
set cursorline

"--------------
"Plugin config
"--------------

"Bind sparkup to F8
let g:sparkupExecuteMapping='<c-x>'

"Bind NERDTree file explorer to q
nnoremap q :NERDTree<CR>

"------------------------
"Folding
"------------------------

"folding method to indent then manual
augroup vimrc
  au BufReadPre * setlocal foldmethod=syntax
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
"Set opening and closing folds to F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf


"---------------------
"Colours and fonts
"---------------------
"
"Enable syntax highlighting
syntax on
" For .less files
au BufNewFile,BufRead *.less set filetype=less

"Enable html snippets in asp
au BufNewFile,BufRead *.asp set filetype=aspvbs.html

set encoding=utf8

set t_Co=256
let g:zenburn_high_Contrast=1
colors zenburn
"colors molokai

"--------------------
"Tabs and shiz
"--------------------

set expandtab
set shiftwidth=2
set tabstop=2
set smarttab

" And the other kind of tabs
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>i
nnoremap <Tab> :tabnext<CR>
nnoremap tc :tabclose<CR>

set autoindent "Auto indent
set smartindent "Smart indet
"set wrap "Wrap line
set nowrap
