-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Autocommand Helper Functions: Python
local M = {}

function M.configure_lsp_capabilities(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  if not client then return end

  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
  elseif client.name == 'pyright' then
    client.server_capabilities.codeActionProvider = false
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end

return M
