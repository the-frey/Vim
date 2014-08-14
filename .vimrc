"--------------------------
"General Stuff
"-------------------------

"autoread when file is changed
set autoread

"filetype plugin
filetype plugin on
filetype indent on
"omnicomplete
set omnifunc=syntaxcomplete#Complete
let g:superTabDefaultCompletionType = "<c-n>"
"Make the pop up menu a resasonble height
set pumheight=15

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

"Bind NERDTree file explorer to q
nnoremap q :NERDTree<CR>

"C++11 is cool yo
let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_cpp_config_file = 'syntastic_conf'
let c_no_curly_error=1

"------------------------
"Folding
"------------------------
"Set maximum numner of nested folds to 5
set foldnestmax=5
"Minimum number of lines folded
set foldminlines=4

"folding method to indent then manual
augroup vimrc
  au BufReadPre * setlocal foldmethod=syntax
  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END

"Set opening and closing folds to F9
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf
nnoremap <C-F9> zR
nnoremap <M-F9> zM

"Map recording to z instead of q
nnoremap z q

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
"Enable html snippets in python
autocmd FileType html set ft=htmldjango.html " For SnipMate


set encoding=utf8

set t_Co=256
"let g:zenburn_high_Contrast=1
"colors zenburn
"colors molokai
colors darkai

"--------------------
"Tabs and shiz
"--------------------

set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" And the other kind of tabs
nnoremap <C-t>  :tabnew<CR>
inoremap <C-t> <Esc>:tabnew<CR>i
nnoremap <Tab> :tabnext<CR>
nnoremap ` :tabprev<CR>
nnoremap tc :tabclose<CR>

set autoindent "Auto indent
"set wrap "Wrap line
set nowrap


"--------------------
"VUNDLE
"--------------------
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'

"My Bundles:

"Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

"NERD Tree
Bundle 'scrooloose/nerdtree'

"Sumblime style multiple-cursors
Bundle 'terryma/vim-multiple-cursors'

"Supertab
Bundle 'ervandew/supertab'

"OmniCppComplete
Bundle 'vim-scripts/OmniCppComplete'

"a.vim Alternate Files quickly
Bundle 'vim-scripts/a.vim'

"Ctrl-P fuzzy finding
Bundle 'kien/ctrlp.vim'

"EasyTags
"Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-easytags'

"Syntastic Syntax checking
Bundle 'scrooloose/syntastic'

" GitGutter
Plugin 'airblade/vim-gitgutter'

"CoffeeScript
Bundle 'kchmck/vim-coffee-script'

filetype on



"--------
"CTAGS
"--------

" configure tags - add additional tags here or comment out not-used ones
au BufNewFile,BufRead *.cpp,*.h,*.hpp,*.c set tags+=~/.vim/tags/cpp
au BufNewFile,BufRead *.cpp,*.h,*.hpp,*.c set tags+=~/.vim/tags/qt4
au BufNewFile,BufRead *.py set tags+=~/.vim/tags/python
" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --exclude=*/venv/* --sort=yes --c++-kinds=+p --python-kinds=-i --fields=+iaS --extra=+q .<CR> 
"Find tags
map <F12> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

map<C-F11> :! find "$PWD" -type d <bar> awk '{print "-I" $0}' > syntastic_conf<CR> :let g:syntastic_cpp_config_file = 'syntastic_conf'<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
