-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Diagnostics Configuration
-- $HOME/.local/state/nvim/lsp.log
vim.lsp.set_log_level('warn')

vim.diagnostic.config({
  -- Disables inline diagnostic message from LSPs and enables
  -- floating window instead.
  virtual_text = false,
  signs = { text = {
    [vim.diagnostic.severity.ERROR] = '❗️',
    [vim.diagnostic.severity.WARN] = '⚠️',
    [vim.diagnostic.severity.INFO] = 'ℹ️',
    [vim.diagnostic.severity.HINT] = '🔎',
  }},

  float = {
    focusable = false,
    border = 'rounded',
    source = true,
    header = 'LSP Diagnostics',
    prefix = '💥 ',
  },
})
