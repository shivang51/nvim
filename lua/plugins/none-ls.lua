local null_ls = require("null-ls")

local on_attach = require("config.lsp.on_attach")

null_ls.setup({
  on_attach = on_attach,
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.dart_format,
  },
})
