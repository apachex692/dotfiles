-- Author: Apache X692
-- Created on: 29/03/2025
--
-- Global Auto Commands
vim.api.nvim_create_autocmd('FileType', {
    pattern = {'yaml', 'lua'},
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
    end
})
