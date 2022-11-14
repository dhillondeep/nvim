local msonlspconfig = {}

function msonlspconfig.setup(servers)
  -- install mason lsp servers
  require('mason').setup({})
  require('mason-lspconfig').setup({
    ensure_installed = servers
  })
end

return msonlspconfig
