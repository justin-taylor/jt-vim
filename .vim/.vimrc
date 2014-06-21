set nocompatible
set smartindent
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
set t_Co=256
set backspace=indent,eol,start
let g:NERDTreeDirArrows=0
let g:NERDTreeShowLineNumbers=1

setlocal expandtab
setlocal textwidth=80
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4

set relativenumber
autocmd BufNew,BufAdd,BufCreate,BufRead,BufNewFile * set relativenumber
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

set tags=./tags,tags;

map <S-Enter> O<Esc>
map <CR> o<Esc>

map nt :NERDTreeToggle<CR>
map mt :NERDTreeMirror<CR>

map <F4> :execute "vimgrep /" .expand("<cword>") . "/j **" <Bar> cw<CR>

map <C-l> :tabnext<CR>
map <C-h> :tabprevious<CR>

map tn :tabnew<cr>
map tl :TagbarToggle<cr>

set wildignore+=*/bin,*/gen,*.class,*.swp,*.zip,*.so

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
Bundle 'kien/ctrlp.vim'
Bundle 'hsanson/vim-android'
Bundle 'Shougo/vimproc'
Bundle 'saltstack/salt-vim'
Bundle 'hughbien/md-vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'sentientmachine/Pretty-Vim-Python'

filetype plugin indent on 

if bufwinnr(1)
	map = <C-W>+
	map - <C-W>-
	map + <C-W>>
	map _ <C-W><
endif

set tags+=/Users/jtaylor/.vim/tags
let g:android_sdk_path='/opt/android-sdk/'

let g:syntastic_java_javac_config_file_enabled=1
let g:syntastic_java_checkstyle_conf_file='~/.vim/android_classpath'
let g:syntastic_python_checkers = ['pyflakes']

autocmd BufNewFile,BufRead *.pde setlocal ft=arduino
autocmd BufNewFile,BufRead *.ino setlocal ft=arduino
autocmd BufNewFile,BufRead *.sls setlocal ft=sls

set swapfile
set dir=~/.vim/backups
set backup
set backupdir=~/.vim/backups

if filereadable(glob('./.vimrc.local'))
    so ./.vimrc.local
endif
