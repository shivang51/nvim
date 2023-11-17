local on_attach = require "config.lsp.on_attach"

local uv = vim.loop

local function get_node_modules(root_dir)
    -- return util.find_node_modules_ancestor(root_dir) .. '/node_modules' or ''
    -- util.find_node_modules_ancestor()
    local root_node = root_dir .. "/node_modules"
    local stats = uv.fs_stat(root_node)
    if stats == nil then
        return ''
    else
        return root_node
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local default_node_modules = get_node_modules(vim.fn.getcwd())

local ngls_cmd = {
    "node",
    "/home/shivang/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/",
    "--stdio",
    "--tsProbeLocations",
    default_node_modules,
    "--ngProbeLocations",
    default_node_modules,
    "--includeCompletionsWithSnippetText",
    "--includeAutomaticOptionalChainCompletions",
    "--logToConsole",
    "--logFile",
    "/home/shivang/angularls.log",
}

require("lspconfig").angularls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = ngls_cmd,
  on_new_config = function(new_config, _)
    new_config.cmd = ngls_cmd
  end,
})
