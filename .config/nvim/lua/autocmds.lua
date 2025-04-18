-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Global Auto Commands
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'yaml', 'lua', 'html' },
  callback = function()
    vim.notify('Changed Indentation: 2', vim.log.levels.INFO)
    vim.opt.shiftwidth = 2
    vim.opt.softtabstop = 2
  end
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.softtabstop = 4
  end
})
