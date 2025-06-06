-- Author: Apache X692
-- Created on: 29/03/2025
--
-- LSP Configuration: Go
-- Referenced from:
-- 1. https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/pyright.lua
vim.lsp.config['gopls'] = {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = {
    'go.mod',
  },
}

-- Enable
-- vim.lsp.enable('gopls')
