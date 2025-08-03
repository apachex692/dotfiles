-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Commands Configuration: Common for All Languages
local lsp_helpers = require('lsp.helpers')

-- List LSP Capabilities
-- A command that lists down the capabilities of LSP servers attached to
-- a particular buffer.
vim.api.nvim_create_user_command(
  'LspCapabilities',
  function()
    local clients = vim.lsp.get_clients()

    for _, client in ipairs(clients) do
      print('🟢 ' .. client.name .. ':')
      for capability, value in pairs(client.server_capabilities) do
        if value then
          print('- ' .. capability)
        end
      end
      print('\n')
    end
  end,
  {}
)

-- List LSP Health
vim.api.nvim_create_user_command(
  'LspInfo',
  function()
    vim.cmd('checkhealth vim.lsp')
  end,
  {}
)

vim.api.nvim_create_user_command(
  'LspEnable',
  function(opts)
    if vim.lsp.config[opts.args] == nil then
      vim.notify("LSP Not Configured: " .. opts.args, vim.log.levels.ERROR)
      return
    end

  vim.lsp.enable(opts.args)
  end,
  {
    nargs = 1,
    desc = 'LSP Identifier'
  }
)

-- Language Specific
-- Python: Set Pyright Interpreter Path
-- XXX: Invoke this command only after the LSP is active (attached to a buffer). It won't
-- work if the LSP is only enabled.
vim.api.nvim_create_user_command(
  'PythonPyrightSetInterpreterPath',
  function(opts)
    lsp_helpers.python_set_pyright_interpreter_path(opts.args)
  end,
  {
    nargs = 1,
    desc = 'Interpreter Path'
  }
)

-- Markdown: Show ToC
vim.api.nvim_create_user_command(
  'MarkdownShowToC',
  function()
    lsp_helpers.show_markdown_toc()
  end,
  {
    nargs = 0,
    desc = 'Show Table of Contents for Markdown'
  }
)
