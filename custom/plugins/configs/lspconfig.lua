local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "gopls", "sumneko_lua", "jsonls", "yamlls", "vimls", "dockerls", "bashls", "kotlin_language_server" }

local local_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  -- enable formatting
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

-- install mason lsp servers
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = servers
})

-- setup lsp servers
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = local_on_attach,
    capabilities = capabilities,
  }
end
