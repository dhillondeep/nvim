local cfg = {}

--- Configurations for lspservers
function cfg.lspservers()
  return {
    ["sumneko_lua"] = {
      Lua = {
        diagnostics = {
          globals = { "vim", "deepvim" },
        },
        workspace = {
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
    ["jsonls"] = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  }
end

--- Configuration for null-ls sources
function cfg.nullls_sources(nullls)
  return {
    nullls.builtins.formatting.stylua,
    nullls.builtins.formatting.jq,
    nullls.builtins.formatting.yamlfmt,
  }
end

deepvim.cfg = cfg
