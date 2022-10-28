local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "gopls" }

local local_on_attach = function (client, bufnr)
  on_attach(client, bufnr)

  -- enable formatting
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = local_on_attach,
    capabilities = capabilities,
  }
end
