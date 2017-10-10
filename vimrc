imap <C-w> <Nop>


colorscheme desert
set number 
set norelativenumber
set autochdir
set colorcolumn=80


set ignorecase
set showcmd

set tabstop=4
set shiftwidth=4
set expandtab

set smartindent
set cindent

set clipboard=unnamedplus

nmap <c-h> <c-w><c-h>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
nmap <c-l> <c-w><c-l>

vmap > >gv
vmap < <gv

augroup cpp
    autocmd!
    autocmd FileType cpp map <f9> :up<enter> :!g++ -Wno-unused-result -O2 -DLOCAL -std=c++14 -g %<enter>
    autocmd FileType cpp map <f5> :!./a.out < in.txt<enter>
    autocmd FileType cpp map <f6> :!./a.out <enter>
augroup END 

augroup latex
    autocmd!
    autocmd FileType tex map <f9> :up<enter> :!pdflatex %:r<enter>
    "autocmd FileType tex map <f9> :up<cr>:!pdflatex tesis<cr>
    autocmd FileType tex map <f5> :!xdg-open %:r.pdf & <enter>
    autocmd FileType tex set spell
    autocmd FileType tex set spelllang=es
augroup END 


set splitright

set nobackup
set nowritebackup
set noswapfile

