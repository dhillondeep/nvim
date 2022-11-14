local config = {}

-- return lsp servers
function config.lspservers()
  return { "gopls", "sumneko_lua", "jsonls", "yamlls", "vimls", "dockerls", "bashls", "kotlin_language_server" }
end

return config
