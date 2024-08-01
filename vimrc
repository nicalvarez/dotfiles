let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'tpope/vim-eunuch'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


colorscheme desert
"colorscheme solarized8
set background=dark
set guifont=Monospace\ 12

set number 
set norelativenumber
set autochdir
"set colorcolumn=80


set ignorecase
set showcmd

" Asi veo la lightline
set laststatus=2

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentación
set autoindent
filetype indent on
"set cindent

set clipboard=unnamedplus

nmap <c-h> <c-w><c-h>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>

vmap > >gv
vmap < <gv

" Para navegar en lineas wrapeadas
map j gj
map k gk

" Y ya que estamos, no wrapeemos
set nowrap


" Navegacion de buffers
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>
nnoremap <silent> [B :bf<CR>
nnoremap <silent> ]B :bl<CR>

" Write cuando se necesita sudo
cmap w!! w !sudo tee > /dev/null %

augroup cpp
    autocmd!
    autocmd FileType cpp map <f9> :w<enter> :!g++ -Wno-unused-result -O2 -DLOCAL -std=c++20 -g3 -pg %<enter>
    autocmd FileType cpp map <f5> :!./a.out < in.txt<enter>
    autocmd FileType cpp map <f6> :!./a.out <enter>
    autocmd BufEnter *.cpp :setlocal cindent cino=j1,(0,ws,Ws
augroup END 

augroup latex
    autocmd!
    autocmd FileType tex map <f9> :w<enter> :!pdflatex %:r<enter>
    "autocmd FileType tex map <f9> :up<cr>:!pdflatex tesis<cr>
    autocmd FileType tex map <f5> :!xdg-open %:r.pdf & <enter>
    autocmd FileType tex set spell
    autocmd FileType tex set spelllang=en
augroup END 


set splitright

set nobackup
set nowritebackup
set noswapfile

