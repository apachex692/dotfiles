local pylint_ns = vim.api.nvim_create_namespace("pylint")

local function run_command(cmd, input)
  local output = vim.fn.systemlist(cmd, input)
  return type(output) == "table" and output or {}
end

local function format_with_black(buf, filename)
  local content = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local format_cmd = string.format("black --quiet --stdin-filename %s -", vim.fn.shellescape(filename))
  local formatted = run_command(format_cmd, content)

  if #formatted == 0 then
    vim.notify("Black Formatting Failed", vim.log.levels.ERROR)
    return nil
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted)
  return formatted
end

local function parse_pylint_output(output)
  local success, json = pcall(vim.fn.json_decode, table.concat(output, "\n"))

  if not success or type(json) ~= "table" then
    vim.notify("Pylint Error: Parsing Failed", vim.log.levels.ERROR)
    return {}
  end

  local diagnostics = {}
  local severity_map = {
    error = vim.diagnostic.severity.ERROR,
    warning = vim.diagnostic.severity.WARN,
    refactor = vim.diagnostic.severity.HINT,
    convention = vim.diagnostic.severity.INFO,
  }

  for _, issue in ipairs(json) do
    table.insert(diagnostics, {
      bufnr = 0,
      lnum = (issue.line or 1) - 1,
      col = issue.column or 1,
      end_col = issue.endColumn and tonumber(issue.endColumn) or (issue.column + 1),
      severity = severity_map[issue.type] or vim.diagnostic.severity.WARN,
      source = "pylint",
      message = string.format("%s %s [%s]", issue["message-id"], issue.symbol, issue.type),
    })
  end
  return diagnostics
end

local function lint_with_pylint(buf, filename)
  local disabled_warnings = "C0114,C0115,C0116,C0304"
  local content = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local lint_cmd = string.format(
    "pylint --from-stdin --output-format=json --score=n --disable=%s %s",
    disabled_warnings, vim.fn.shellescape(filename)
  )
  local lint_output = run_command(lint_cmd, content)
  local diagnostics = parse_pylint_output(lint_output)

  if #diagnostics > 0 then
    vim.diagnostic.set(pylint_ns, buf, diagnostics)
  else
    vim.diagnostic.reset(pylint_ns, buf)
  end
end

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.py",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.fn.expand('%')
    lint_with_pylint(buf, filename)
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local filename = vim.fn.expand('%')

    local start_time = vim.loop.hrtime()
    local formatted = format_with_black(buf, filename)
    if not formatted then return end

    vim.api.nvim_win_set_cursor(0, cursor_pos)
    lint_with_pylint(buf, filename)

    local total_time = (vim.loop.hrtime() - start_time) / 1e6
    vim.schedule(function()
      vim.notify(string.format("Formatting & Linting Completed in %.2fms", total_time), vim.log.levels.INFO)
    end)
  end,
})
