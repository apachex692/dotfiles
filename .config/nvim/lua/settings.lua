-- Author: Apache X692
-- Created on: 29/03/2025

-- netrw Behavior
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- Core Editor Behavior
vim.opt.compatible = false
vim.opt.wildmenu = true
vim.opt.wrap = true
vim.opt.hlsearch = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'

vim.opt.smartindent = true
vim.opt.ignorecase = true

-- Visual Guides
vim.opt.colorcolumn = '90'

-- Completion Behavior
vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'popup' }

-- Short Messages
vim.opt.shortmess:append('I')


-- Colors and Appearance
vim.cmd.colorscheme('shine')
vim.cmd('filetype indent on')

-- Override Styling
vim.api.nvim_set_hl(0, 'Comment', { italic = true })

-- Italicize String Literals
local string_hl = vim.api.nvim_get_hl(0, { name = "String", link = false })
string_hl.italic = true
vim.api.nvim_set_hl(0, "String", string_hl)

-- Environment Variables (FZF)
vim.env.FZF_DEFAULT_COMMAND = table.concat({
    'find . -type f',
    '! -path "./.git/*"',
    '! -path "./node_modules/*"',
    '! -path "./venv/*"',
    '! -path "./.venv/*"',
    '! -path "./.idea/*"',
    '! -path "./.env/*"',
    '! -path "*/__pycache__/*"',
    '! -name "*.log"',
    '! -name "*.pyc"',
    '! -name "*.pyo"',
    '! -name "*.out"',
}, ' ')
vim.g.fzf_action = { enter = 'confirm e' }
