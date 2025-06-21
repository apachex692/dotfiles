let mapleader = ' '

" Key-bindings
" File Tree
nnoremap <leader>en :Ex<CR>

" File Operations
nnoremap <leader>w :w<CR>
nnoremap <leader>r :%s//g<Left><Left>

" Tab Management
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>

" Split Management
" Splits
nnoremap <leader>h :split<CR>
nnoremap <leader>v :vsplit<CR>

" Focus
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Resize FIX: Not Working
" noremap <silent> <C-H> :vertical resize +3<CR>
" noremap <silent> <C-L> :vertical resize -3<CR>
" noremap <silent> <C-K> :resize -3<CR>
" noremap <silent> <C-J> :resize +3<CR>

" Buffer Management
noremap <leader>bl :ls<CR>
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <leader>bd :bd<CR>

" Settings
" netrw Management
let g:netrw_banner=0
let g:netrw_liststyle=3

set wildmenu
set nocompatible
set wrap

set expandtab
set shiftwidth=4
set softtabstop=4

set number
set relativenumber

set autoindent
set smartindent
set ignorecase

syntax on
colorscheme shine
filetype indent on
highlight Comment cterm=italic

set colorcolumn=90
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

set shortmess+=I

" FZF Base Command with Ignore Patterns
let $FZF_DEFAULT_COMMAND = 'find . -type f ' .
    \ '! -path "./.git/*" ' .
    \ '! -path "./node_modules/*" ' .
    \ '! -path "./venv/*" ' .
    \ '! -path "./.venv/*" ' .
    \ '! -path "./.idea/*" ' .
    \ '! -path "./.env/*" ' .
    \ '! -path "*/__pycache__/*" ' .
    \ '! -name "*.log" ' .
    \ '! -name "*.pyc" ' .
    \ '! -name "*.pyo" ' .
    \ '! -name "*.go" ' .
    \ '! -name "*.out"'
let g:fzf_action = { 'enter': 'confirm e' }
