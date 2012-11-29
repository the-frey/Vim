  set nocompatible
  source $VIMRUNTIME/vimrc_example.vim
  "source $VIMRUNTIME/mswin.vim
  "behave mswin

  set diffexpr=MyDiff()
  function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
      if &sh =~ '\<cmd'
        let cmd = '""' . $VIMRUNTIME . '\diff"'
        let eq = '"'
      else
        let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
      endif
    else
      let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction


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

  "map fullscreen
  map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 

  "Get rid of the menus
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=l

  "Make it so it doesn't close the window when I type :q because I'm used to
  "linux dammit!
  cnoreabbrev wq w<bar>bd
  cnoreabbrev q bd

  "Stop vim from leaving temp files everywhere
  set backupdir=~/vimtmp
  set directory=~/vimtmp
  set undofile
  set undodir=~/vimtmp

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
"set the font to something that isn't atrocious
"set guifont=ProggyCleanSZ:h12:cDEFAULT
set guifont=Consolas:h10:cDEFAULT

" Use this setting for when editing Japanese
set guifontwide=MingLiU:h9

"Enable syntax highlighting
syntax on
" For .less files
au BufNewFile,BufRead *.less set filetype=less

"Enable html snippets in asp
au BufNewFile,BufRead *.asp set filetype=aspvbs.html

set encoding=utf8

set t_Co=256
let g:zenburn_high_Contrast=1
"colors zenburn
colors molokai

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
