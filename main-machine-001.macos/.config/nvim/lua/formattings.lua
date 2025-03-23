vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    local content = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    local filename = vim.fn.expand('%')

    local cmd = string.format(
      "black --quiet --stdin-filename %s -",
      vim.fn.shellescape(filename)
    )
    local formatted = vim.fn.systemlist(cmd, content)

    if vim.v.shell_error == 0 then
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted)
      vim.api.nvim_win_set_cursor(0, cursor_pos)
    else
      vim.notify("Black Formatting Failed", vim.log.levels.ERROR)
    end
  end,
})
