-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Global Auto Commands
local augroup = vim.api.nvim_create_augroup('ApacheX692Config', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'yaml', 'lua', 'html', 'hcl' },
  callback = function()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'markdown' },
  callback = function()
    vim.opt_local.wrap = false
  end
})

vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end
})
