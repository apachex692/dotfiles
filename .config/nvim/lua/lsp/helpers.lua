-- Author: Apache X692
-- Created on: 29/03/2025
--
-- LSP Helper Functions
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

-- Markdown: Show ToC
function M.show_markdown_toc()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local toc_items = {}

  for linenr, line in ipairs(lines) do
    local hashes, text = line:match("^(#+)%s+(.*)")
    if hashes and text then
      local level = #hashes
      table.insert(toc_items, {
        bufnr = bufnr,
        lnum = linenr,
        col = 1,
        text = string.format("H%d %s", level, text),
      })
    end
  end

  if vim.tbl_isempty(toc_items) then
    vim.notify('No ToC', vim.log.levels.INFO)
    return
  end

  vim.fn.setloclist(0, {}, 'r', {
    title = 'Markdown Table of Contents',
    items = toc_items,
  })

  vim.cmd("lopen")
end

return M
