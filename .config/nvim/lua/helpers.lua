-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Global Helpers
local M = {}

function M.format_with_prettier()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)
  local cursor = vim.api.nvim_win_get_cursor(0)

  if filepath == '' then
    vim.notify(
      'Buffer has no name, please save this file before formatting.',
      vim.log.levels.WARN
    )
    return
  end

  vim.cmd('write')

  local output = vim.fn.systemlist(
    { 'prettier', '--stdin-filepath', filepath },
    nil
  )
  local exit_code = vim.v.shell_error

  if exit_code == 0 then
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
    vim.api.nvim_win_set_cursor(0, cursor)
  else
    vim.notify(
      'Prettier Failed:\n' .. table.concat(output, '\n'),
      vim.log.levels.ERROR
    )
  end
end

return M
