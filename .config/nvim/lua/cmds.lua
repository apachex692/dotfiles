-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Global Commands
vim.api.nvim_create_user_command('ApacheX692', function()
  local art = [[
    ___    ____  ___   ________  ________   _  _______ ____ ___
   /   |  / __ \/   | / ____/ / / / ____/  | |/ / ___// __ \__ \
  / /| | / /_/ / /| |/ /   / /_/ / __/     |   / __ \/ /_/ /_/ /
 / ___ |/ ____/ ___ / /___/ __  / /___    /   / /_/ /\__, / __/
/_/  |_/_/   /_/  |_\____/_/ /_/_____/   /_/|_\____//____/____/

                            🚁🚁🚁🚁🚁
                An Apache X692 Attack Helicopter
  ]]
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(art, '\n'))
  vim.api.nvim_win_set_buf(0, buf)
end, {})
