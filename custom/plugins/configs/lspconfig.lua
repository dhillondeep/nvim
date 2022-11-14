local lspconfig = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local conf = require "lspconfig"

local local_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  -- enable formatting
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

function lspconfig.setup(servers)
  -- setup lsp servers
  for _, lsp in ipairs(servers) do
    conf[lsp].setup {
      on_attach = local_on_attach,
      capabilities = capabilities,
    }
  end
end

return lspconfig
