-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Autocommand Configuration
local autocomplete = require('lsp.languages.python.helpers').autocomplete

-- Language: Python
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    autocomplete(args)
  end,
})
