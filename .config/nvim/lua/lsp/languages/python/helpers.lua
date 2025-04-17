-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Helpers: Python
local M = {}

function M.autocomplete(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  if client:supports_method('textDocument/completion') then
    vim.notify(
      'LSP Completion: Enabled: ' .. client.name,
      vim.log.levels.INFO
    )
    -- https://neovim.io/doc/user/lsp.html#lsp-attach
    vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
  else
    vim.notify(
      'LSP Completion: Unsupported: ' .. client.name,
      vim.log.levels.INFO
    )
  end
end

-- Pyright: Python Interpreter Path Setter
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
