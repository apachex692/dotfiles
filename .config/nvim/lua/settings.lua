-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Settings
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.opt.wildmenu = true
vim.opt.compatible = false
vim.opt.wrap = true
vim.opt.hlsearch = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true

-- Limit: 80 Characters
vim.opt.textwidth = 80
vim.opt.formatoptions:append("t")

-- Guides
vim.opt.colorcolumn = '88'

-- Determines: Menu Completions (set for: LSP completions)
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'popup' }

-- Color Scheme
vim.cmd('syntax on')
vim.cmd('colorscheme slate')
vim.cmd('filetype indent on')
vim.cmd('highlight Comment cterm=italic gui=italic')
vim.cmd('highlight String cterm=italic gui=italic')
vim.cmd('highlight ColorColumn ctermbg=darkgrey guibg=grey')

vim.opt.shortmess:append('I')

-- FZF Base Command with Ignore Patterns
vim.env.FZF_DEFAULT_COMMAND = 'find . -type f ' ..
    '! -path "./.git/*" ' ..
    '! -path "./node_modules/*" ' ..
    '! -path "./venv/*" ' ..
    '! -path "./.venv/*" ' ..
    '! -path "./.idea/*" ' ..
    '! -path "./.env/*" ' ..
    '! -path "*/__pycache__/*" ' ..
    '! -name "*.log" ' ..
    '! -name "*.pyc" ' ..
    '! -name "*.pyo" ' ..
    '! -name "*.go" ' ..
    '! -name "*.out"'
vim.g.fzf_action = { enter = 'confirm e' }
