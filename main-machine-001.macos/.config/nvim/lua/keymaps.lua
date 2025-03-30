-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Keymaps Configuration
vim.g.mapleader = ' '

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- File Tree
keymap('n', '<leader>en', ':Ex<CR>', opts)
keymap('n', '<leader>ef', ':FZF<CR>', opts)

-- File Operations
keymap('n', '<leader>w', ':w<CR>', opts)
keymap('n', '<leader>r', ':%s//g<Left><Left>', { noremap = true })

-- Tab Management
keymap('n', '<leader>t', ':tabnew<CR>', opts)
keymap('n', '<leader>td', ':tabclose<CR>', opts)
keymap('n', '<leader>tp', ':tabprevious<CR>', opts)
keymap('n', '<leader>tn', ':tabnext<CR>', opts)

-- Split Management
keymap('n', '<leader>h', ':split<CR>', opts)
keymap('n', '<leader>v', ':vsplit<CR>', opts)

-- Focus
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)

-- Resize
-- FIX: Not Working (overrides the above commands instead)
-- keymap('n', '<C-H>', ':vertical resize +3<CR>', opts)
-- keymap('n', '<C-L>', ':vertical resize -3<CR>', opts)
-- keymap('n', '<C-K>', ':resize -3<CR>', opts)
-- keymap('n', '<C-J>', ':resize +3<CR>', opts)

-- Buffer Management
keymap('n', '<leader>bl', ':ls<CR>', opts)
keymap('n', '<Tab>', ':bn<CR>', opts)
keymap('n', '<S-Tab>', ':bp<CR>', opts)
keymap('n', '<leader>bd', ':bd<CR>', opts)

-- LSP
-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

-- LSP Commands
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, opts)
vim.keymap.set('n', 'gca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts) -- Symbol Definition
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
