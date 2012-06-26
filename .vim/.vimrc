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
set incsearch

set relativenumber
function! NumberToggle()
	if(&relativenumber != 1)
		set relativenumber
	else
		set number
	endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

syntax on
colorscheme desert

let mapleader = ','

" TagBar settings
let g:ctags_path='/usr/local/bin/ctags'
let g:ctags_statusline=1 
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_autoshowtag = 1
let g:tagbar_sort = 0

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let Tlist_Use_Right_Window = 1

map <S-Enter> O<Esc>
map <CR> o<Esc>
map nt :NERDTreeToggle<CR>

"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>

map tn :tabnew<cr>
map tl :TagbarToggle<cr>

map <C-3> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>




" Vundle Settings
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'sukima/xmledit'
Bundle 'SearchComplete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/vim-statline'
Bundle 'pyflakes/pyflakes'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-markdown'

filetype plugin indent on 

if bufwinnr(1)
	map + <C-W>+
	map - <C-W>-
endif
