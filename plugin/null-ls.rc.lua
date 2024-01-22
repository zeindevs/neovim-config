local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

local lsp_formatting = function(bufnr, async)
  vim.lsp.buf.format({
    -- filter = function(client)
    --   return client.name == "null-ls"
    -- end,
    bufnr = bufnr,
    async = async
  })
end

null_ls.setup {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.formatting.prismaFmt,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.formatting.black.with({
      extra_args = { '--line-length=120' }
    }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.keymap.set('n', '<Leader>f', function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bunfr, desc = '[lsp] format' })

      -- format on save
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = augroup,
        callback = function()
          lsp_formatting(bufnr, async)
        end,
        desc = "[lsp] format on save"
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
