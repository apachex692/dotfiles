-- Author: Apache X692
-- Created on: 29/03/2025
--
-- LSP Configuration: Python
-- Referenced from:
-- 1. https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/pyright.lua
-- 2. https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/ruff.lua
local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  'pyrightconfig.json',
}

-- Configuring LSPs
-- https://docs.astral.sh/ruff/editors/settings
vim.lsp.config['ruff'] = {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = root_files,
  init_options = {
    settings = {
      lineLength = 88,          -- Black
      showSyntaxErrors = false, -- Redundant (handled by Pyright)
      lint = {
        -- Linter Configuration: These are the linters that I think will be
        -- able to identify most of the code smells. These linters are non-
        -- overlapping with Pyright's linting.
        --
        -- To know more about linters supported by Ruff, execute: ruff linter
        select = { 'E', 'I', 'SIM', 'B', 'S', 'N' },
      },
      format = {
        preview = true,
      },
    },
  },
}

-- Configuring Pyright
vim.lsp.config['pyright'] = {
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_markers = root_files,
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  },
}

-- Enable LSPs
vim.lsp.enable('ruff')
vim.lsp.enable('pyright')
