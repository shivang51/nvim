local on_attach = require "config.lsp.on_attach"

local servers = { 'clangd', 'rust_analyzer', 'lua_ls', 'gopls', 'angularls', 'tsserver' }

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require("config.lsp.angularls")

-- Ensure the servers above are installed
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

require("mason-lspconfig").setup_handlers {
  function (server_name)
      require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
  }
  end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
    --     ["rust_analyzer"] = function ()
    --         require("rust-tools").setup {}
    --     end_
}


require'lspconfig'.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

