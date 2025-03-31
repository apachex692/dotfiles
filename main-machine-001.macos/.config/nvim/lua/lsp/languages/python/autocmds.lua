-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Autocommand Configuration: Python
local M = {}

function M.autocomplete(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  if client:supports_method('textDocument/completion') then
    vim.notify(
      'LSP Completion: Enabled: ' .. client.name,
      vim.log.levels.INFO
    )
    -- https://neovim.io/doc/user/lsp.html#lsp-attach
    vim.lsp.completion.enable(true, client.id, args.buf)
  else
    vim.notify(
      'LSP Completion: Unsupported: ' .. client.name,
      vim.log.levels.INFO
    )
  end
end

return M
