-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Auto Commands Configuration
local lsp_python_autocmds = require('lsp.languages.python.autocmds')

-- LSP Formatting
-- When the LSP attaches, if it has formatting capabilities, create an
-- autocommand to format the buffer before saving to disk.
--
-- FIX: If an formatter autocommand is already set, ignore setting it again.
local function setup_formatter(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)

  if client and client.server_capabilities.documentFormattingProvider then
    vim.notify(
      'LSP Formatting: Enabled: ' .. (client and client.name or 'Unknown'),
      vim.log.levels.INFO
    )
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = args.buf,
      callback = function()
        vim.lsp.buf.format({ async = false })
        vim.notify('Formatted')
      end,
    })
  else
    vim.notify(
      'LSP Formatting: Unsupported: ' .. (client and client.name or 'Unknown'),
      vim.log.levels.WARN
    )
  end
end

-- Setup Event Trigger
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    -- All Languages
    setup_formatter(args)

    -- Language Specific
    -- Ruff and Pyright
    lsp_python_autocmds.configure_lsp_capabilities(args)
  end,
})
