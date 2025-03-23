vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>ex", ":Ex<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)
keymap("n", "<leader>r", ":%s//g<Left><Left>", { noremap = true, silent = false })

keymap("n", "<leader>bl", ":ls<CR>", opts)
keymap("n", "<leader>bn", ":bn<CR>", opts)
keymap("n", "<leader>bp", ":bp<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)

for i = 1, 9 do
  keymap("n", "<leader>b" .. i, ":buffer " .. i .. "<CR>", { noremap = true, silent = true })
end
