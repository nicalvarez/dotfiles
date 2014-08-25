set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Syntastic'
Plugin 'kien/ctrlp.vim'

" UltiSnips + snippets de honza
Plugin 'UltiSnips'
Plugin 'honza/vim-snippets.git'

Plugin 'Rip-Rip/clang_complete'
Plugin 'bufkill.vim'

" Themes
Plugin 'Mustang2'
Plugin 'Solarized'
Plugin 'molokai'

Plugin 'bling/vim-airline'
Plugin 'xeross/vim-hardmode'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

Plugin 'zoomwintab.vim'
Plugin 'Lokaltog/vim-easymotion'

call vundle#end()
filetype plugin indent on

" Configuración del path de clang
let g:clang_library_path = '/usr/lib/llvm-3.4/lib/'
let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

let &keywordprg = ':help'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled=0
if has("gui_running")
    let g:airline_powerline_fonts=1
    let g:Powerline_symbols = 'fancy'
endif

if has("autocmd")
    autocmd BufWritePost .vimrc source $MYVIMRC
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
nnoremap <silent><leader>h <Esc>:call ToggleHardMode()<CR>
let g:HardMode_hjklLimit=2

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

" Hard Mode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

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
if has('gui_macvim')
    set gfn=Sauce\ Code\ Powerline:h13
else
    set gfn=Source\ Code\ Pro\ for\ Powerline\ 11
endif
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
set diffopt=filler,vertical

let g:syntastic_cpp_compiler_options = ' -std=c++11'
let g:syntastic_always_populate_loc_list = 1
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

nmap <F5> :up <bar> make %:r <bar> !./%:r<CR>
nmap <F6> :up <bar> make %:r<CR>
nnoremap <silent><M-C-n> :bn<CR>  
nnoremap <silent><M-C-p> :bN<CR>
if has('gui_macvim')
    nnoremap <silent><D-N> :bn<CR>  
    nnoremap <silent><D-P> :bN<CR>
endif

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
