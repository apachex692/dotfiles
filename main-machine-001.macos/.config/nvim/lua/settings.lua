vim.g.netrw_liststyle = 3

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.completeopt = "menuone,noselect"

vim.cmd("syntax on")
vim.cmd("filetype indent on")
vim.cmd("colorscheme vim")
vim.cmd("highlight Comment cterm=italic")

vim.opt.shortmess:append("I")
