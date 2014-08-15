set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'scratch.vim'
Plugin 'kien/ctrlp.vim'


" SnipMate y dependencias
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'

Plugin 'Rip-Rip/clang_complete'
Plugin 'bufkill.vim'


Plugin 'Mustang2'
Plugin 'Solarized'
Plugin 'molokai'

Plugin 'xuhdev/SingleCompile'


call vundle#end()
filetype plugin indent on

let g:clang_library_path = '/usr/lib/llvm-3.4/lib/'
let &keywordprg = ':help'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled=0
if has("gui_running")
    let g:airline_powerline_fonts=1
    let g:Powerline_symbols = 'fancy'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


nnoremap <silent> <C-N> :tabnew<CR>

set hidden
nnoremap <C-Q> :BD<CR>
inoremap <C-Q> :BD<CR>
"nnoremap <silent> <C-Q> :bp<bar>confirm bd#<CR>
"inoremap <silent> <C-Q> <Esc>:bp<bar>confirm bd#<CR>

nmap <silent><C-s> :up <CR>
imap <silent><C-s> <Esc>:up <CR>i
nmap <silent> <F9> :NERDTreeToggle <CR>
nmap <F8> :up<CR>:SCCompile <CR>
nmap <F5> :up<CR>:SCCompileRun <CR>
imap <F8> <Esc>:up<CR>:SCCompile <CR>
imap <F5> <Esc>:up<CR>:SCCompileRun <CR>

vnoremap < <gv
vnoremap > >gv

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

imap <Up> <Nop>
imap <Down> <Nop>
imap <Left> <Nop>
imap <Right> <Nop>

map <C-h> <C-W>h
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-l> <C-W>l

nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Leader Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","

nmap <leader>ev :vsp $MYVIMRC<CR>
nmap <leader>es :vsp ~/.vim/bundle/vim-snippets/snippets/<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set smartindent
set smarttab
set expandtab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

if has("gui_running")
    colorscheme molokai
else
    colorscheme delek
endif

set background=dark
set gfn=Source\ Code\ Pro\ for\ Powerline\ 11
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Varias
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set cmdheight=2
set ruler
set ignorecase
set lazyredraw
set showmatch
set smartcase
set incsearch
set hlsearch
nmap <silent> <leader><space> :noh<CR>
set title

set cursorline
set encoding=utf-8
set backspace=indent,eol,start
set foldcolumn=2
set foldmethod=syntax
set foldlevelstart=20
nmap <space> za

set autochdir
set gdefault
set wildmenu
set showcmd
set history=1000

set nowrap

let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:SingleCompile_alwayscompile = 0
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set splitright
set laststatus=2
set pastetoggle=<F12>
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
endif

nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" force saving files that require root permission
"cnoremap w!! w !sudo tee > % /dev/null

" Use Unix as the standard file type
set ffs=unix,dos,mac

nnoremap <silent><M-C-n> :bn<CR>  
nnoremap <silent><M-C-p> :bN<CR>
set scrolloff=4
set mouse=a

augroup ft_vim
    au!
    au FileType vim setlocal foldmethod=marker
    au FileType vim setlocal foldlevel=0
augroup END

cnoremap <C-n> <Down>
cnoremap <C-p> <Up>


if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
