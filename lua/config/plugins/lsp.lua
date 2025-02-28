local config_lsps = function(opts)
  local lspconfig = require("lspconfig");

  lspconfig.lua_ls.setup {}
  -- lspconfig.clangd.setup {}
  -- lspconfig.pyright.setup {}
  -- lspconfig.omnisharp.setup {
  --   cmd = { "omnisharp" }
  -- }
    
    if opts.servers then
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end
end


return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function(_, opts)
      config_lsps(opts);

      local lspconfig = require('lspconfig')


      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format() end)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.server_capabilities.completionProvider then
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
          end
          if client.server_capabilities.definitionProvider then
            vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
          end


          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              callback = function() vim.lsp.buf.format() end
            })
          end
        end,
      })
    end
  }
}
