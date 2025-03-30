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

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})
