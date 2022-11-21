print("g 1")
-- global configuration
_G.deepvim = {}

-- configure lsp servers
function deepvim.lspservers()
  return {
    ["gopls"] = {},
    ["sumneko_lua"] = {
      Lua = {
        diagnostics = {
          globals = { "vim", "deepvim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          },
          maxPreload =  100000,
          preloadFileSize =  10000,
        },
      },
    },
    ["jsonls"] = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
    ["yamlls"] = {},
    ["vimls"] = {},
    ["dockerls"] = {},
    ["bashls"] = {},
    ["kotlin_language_server"] = {}
  }
end

-- configure treesitter
function deepvim.treesitter()
  return {
    languages = { "lua", "go", "cpp", "c", "bash", "json", "json5", "gomod", "gowork", "yaml", "html" },
    rainbow = {
      disable = { "html" }
    }
  }
end

-- load global fields and functions
require("custom.utils")
