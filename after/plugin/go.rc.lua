local status, gonvim = pcall(require, 'go')
if (not status) then return end

gonvim.setup({})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    require('go.format').gofmt()
  end,
  group = format_sync_grp,
})
