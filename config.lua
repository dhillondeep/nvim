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

-- Configurations for global highlights
function cfg.set_highlights(base46)
  local colors = base46.get_theme_tb("base_30")

  local highlights = {
    -- global generic highlights
    DeepNvimBorder = { fg = colors.grey },
    DeepNvimTitleBg = { bg = colors.red, fg = colors.black, bold = true },
    DeepNvimTitle = { fg = colors.red, bold = true },
    DeepNvimTitleAltBg = { bg = colors.green, fg = colors.black, bold = true },
    DeepNvimTitleAlt = { fg = colors.green, bold = true },
    DeepNvimSelection = { bg = colors.black2, fg = colors.white, bold = true },
    DeepNvimContent = { fg = colors.white },

    FloatBorder = { link = "DeepNvimBorder" },
  }

  for group, conf in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, conf)
  end
end

deepvim.cfg = cfg
