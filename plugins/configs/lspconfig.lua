local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local conf = require("lspconfig")

local local_on_attach = function(client, bufnr)
  on_attach(client, bufnr)

  -- enable formatting
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true
end

local servers = require("custom.plugins.configs.lspservers")
for server, config in pairs(servers) do
  -- setup lsp servers
  local opts = {
    on_attach = local_on_attach,
    capabilities = capabilities,
  }
  if next(config) ~= nil then
    opts.settings = config
  end
  conf[server].setup(opts)
end
