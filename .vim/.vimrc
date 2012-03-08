set nocompatible
set autoindent
set hidden
set wildmenu
set scrolloff=3
set autoread
set ruler
set ai
set si
set hlsearch
set wrap linebreak nolist
set ls=2
set title
set nu
set spell
set incsearch

syntax on
colorscheme desert

let mapleader = ','
let g:ctags_path='/usr/local/bin/ctags'
let g:ctags_statusline=1 

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_Right_Window = 1

map <S-Enter> O<Esc>
map <CR> o<Esc>
map nt :NERDTreeToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map tn :tabnew<cr>
map tl :TlistToggle<cr>
map 0  :tabnext<CR>
map 9  :tabprevious<CR>

map <C-3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>


" Vundle Settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'sukima/xmledit'
Bundle 'SearchComplete'

filetype plugin indent on 
