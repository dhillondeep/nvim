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
    ["yamlls"] = {},
    ["vimls"] = {},
    ["dockerls"] = {},
    ["bashls"] = {},
    ["kotlin_language_server"] = {},
  }
end

function deepvim.nullls_sources(nullls)
  return {
    nullls.builtins.formatting.stylua,
    nullls.builtins.formatting.jq,
    nullls.builtins.formatting.yamlfmt,
  }
end

function deepvim.toggle_autopairs()
  local ok, autopairs = pcall(require, "nvim-autopairs")
  if ok then
    if autopairs.state.disabled then
      autopairs.enable()
    else
      autopairs.disable()
    end
    vim.g.autopairs_enabled = autopairs.state.disabled
    deepvim.ui_notify(string.format("autopairs %s", deepvim.bool2str(not autopairs.state.disabled)))
  else
    deepvim.ui_notify "autopairs not available"
  end
end
