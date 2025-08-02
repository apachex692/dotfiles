-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Keymaps Configuration
local helpers = require('helpers')

vim.g.mapleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- File Tree
keymap('n', '<leader>en', ':Ex<CR>', opts)
keymap('n', '<leader>ef', ':FZF<CR>', opts)

-- File Operations
keymap('n', '<leader>r', ':%s//g<Left><Left>', { noremap = true })

-- Buffer Management
keymap('n', '<leader>bl', ':ls<CR>', opts)
keymap('n', '<Tab>', ':bn<CR>', opts)
keymap('n', '<S-Tab>', ':bp<CR>', opts)
keymap('n', '<leader>bda', helpers.close_all_buffers, opts)
keymap('n', '<leader>bdo', helpers.close_other_buffers, opts)

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

-- Quick Fix List
-- keymap('n', '<leader>qn', ':cnext<CR>', opts) -- [l
-- keymap('n', '<leader>qp', ':cprev<CR>', opts) -- ]l
keymap('n', '<leader>qc', ':cclose<CR>', opts)

-- Location List
-- keymap('n', '<leader>ln', ':lnext<CR>', opts) -- [q
-- keymap('n', '<leader>lp', ':lprev<CR>', opts) -- ]q
keymap('n', '<leader>lc', ':lclose<CR>', opts)

-- LSP
-- Diagnostics
keymap('n', '[d', vim.diagnostic.goto_prev, opts)
keymap('n', ']d', vim.diagnostic.goto_next, opts)
keymap('n', '<leader>dl', vim.diagnostic.setloclist, opts)

-- LSP Commands
keymap('n', '<leader>f', vim.lsp.buf.format, opts)
keymap('n', 'gd', vim.lsp.buf.definition, opts)
keymap('n', 'gD', vim.lsp.buf.declaration, opts)
keymap('n', 'go', vim.lsp.buf.type_definition, opts)
keymap('n', 'gr', vim.lsp.buf.references, opts)
keymap('n', 'gi', vim.lsp.buf.implementation, opts) -- gri: Not Working (pre-defined)
keymap('n', 'gS', ':lua vim.lsp.buf.workspace_symbol("")<Left><Left>', { noremap = true })
keymap('n', 'K', vim.lsp.buf.hover, opts) -- Symbol Definition

-- keymap('n', 'gca', vim.lsp.buf.code_action, opts) -- gra
-- keymap('n', 'grn', vim.lsp.buf.rename, opts) -- grn
-- keymap('n', 'gs', vim.lsp.buf.document_symbol, opts) -- gO

-- Formatting
-- Prettier
keymap('n', '<leader>fp', helpers.format_with_prettier, opts)
