-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Autocommand Configuration
local lsp_python_autocmds = require('lsp.languages.python.autocmds')

-- Language: Python
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    lsp_python_autocmds.autocomplete(args)
  end,
})
