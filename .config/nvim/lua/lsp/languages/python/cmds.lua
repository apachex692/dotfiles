-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Command Helper Functions: Python

-- Pyright: Python Interpreter Path Setter
local M = {}

function M.pyright_set_python_path(path)
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = 'pyright',
  }

  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python = vim.tbl_deep_extend(
        'force', client.settings.python, { pythonPath = path }
      )
    else
      client.config.settings = vim.tbl_deep_extend(
        'force', client.config.settings, { python = { pythonPath = path } }
      )
    end
    client.notify('workspace/didChangeConfiguration', { settings = nil })
  end
end

return M
