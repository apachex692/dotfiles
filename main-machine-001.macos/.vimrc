autocmd BufWritePre *.py execute "silent !black --quiet --stdin-filename % -" | edit!

let mapleader = " "

nnoremap <leader>ex :Ex<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>r :%s//g<Left><Left>

nnoremap <leader>bl :ls<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

for i in range(1, 9)
    execute "nnoremap <leader>b" . i " :buffer " . i . "<CR>"
endfor

let g:netrw_liststyle = 3

set expandtab
set shiftwidth=4
set softtabstop=4

set number
set relativenumber

set autoindent
set smartindent
set ignorecase

syntax on
filetype indent on
colorscheme slate
highlight Comment cterm=italic

set shortmess+=I
