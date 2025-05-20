-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Global Helpers
local M = {}

function M.format_with_prettier()
  local buf = vim.api.nvim_get_current_buf()
  local filepath = vim.api.nvim_buf_get_name(buf)

  if filepath == "" then
    vim.notify("Invalid File Path", vim.log.levels.ERROR)
    return
  end

  if vim.bo.modified then
    vim.notify("Save File (before formatting)", vim.log.levels.WARN)
    return
  end

  local result = vim.fn.system({ "prettier", "--write", filepath })
  if vim.v.shell_error ~= 0 then
    vim.notify("Prettier Failed:\n" .. result, vim.log.levels.ERROR)
  else
    vim.notify("Formatted with Prettier", vim.log.levels.INFO)
    -- Reload File
    vim.cmd("edit!")
  end
end

-- Buffer Management
local function listed_buffers()
  return vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted
  end, vim.api.nvim_list_bufs())
end

local function close_buffer(buf)
  if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
    vim.cmd('bdelete ' .. buf)
  end
end

-- Close All (except the current one)
function M.close_other_buffers()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(listed_buffers()) do
    if buf ~= current then close_buffer(buf) end
  end
end

-- Close All
function M.close_all_buffers()
  for _, buf in ipairs(listed_buffers()) do
    close_buffer(buf)
  end
end

return M
