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

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true

vim.cmd('syntax on')
vim.cmd('colorscheme slate')
vim.cmd('filetype indent on')
vim.cmd('highlight Comment cterm=italic')

-- Guides
vim.opt.colorcolumn = '80'
vim.cmd('highlight ColorColumn ctermbg=darkgrey guibg=grey')

vim.opt.shortmess:append('I')

-- FZF Base Command with Ignore Patterns
vim.env.FZF_DEFAULT_COMMAND =
'[ -f .filelist ] && cat .filelist || (find . \\( -name node_modules -o -name .venv -o -name .git -o -name __pycache__ -o -name "*.swp" \\) -prune -o -type f -print | tee .filelist)'
vim.g.fzf_action = { enter = 'confirm e' }

-- Support for Vim Plugins
vim.opt.runtimepath:append('/Users/sakthisanthosh/.vim/')
