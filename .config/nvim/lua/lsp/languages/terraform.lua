-- Author: Apache X692
-- Created on: 29/03/2025
--
-- LSP Configuration: Terraform
-- Referenced from:
-- 1. https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/terraformls.lua
vim.lsp.config['terraform-ls'] = {
  cmd = { 'terraform-ls', 'serve' },
  filetypes = { 'hcl', 'terraform-vars' },
  root_dir = { '.git' },
}

-- Enable
-- vim.lsp.enable('terraform-ls')
