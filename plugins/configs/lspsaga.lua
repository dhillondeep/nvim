require("lspsaga").init_lsp_saga({
  border_style = "rounded",
  code_action_keys = {
    quit = "<esc>",
    exec = "<CR>",
  },
  finder_action_keys = {
    open = "<CR>",
    vsplit = "<C-v>",
    split = "<C-s>",
    tabe = "<C-t>",
    quit = "<esc>",
  },
  definition_action_keys = {
    edit = "<CR>",
    vsplit = "<C-v>",
    split = "<C-s>",
    tabe = "<C-t>",
    quit = "<esc>",
  },
  rename_action_quit = "<esc>",
  code_action_icon = "",
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = false,
    cache_code_action = true,
    sign = false,
    update_time = 150,
    sign_priority = 20,
    virtual_text = false,
  },
})

-- set custom highlights

local colors = require("base46").get_theme_tb("base_30")
local highlights = {
  -- code action
  LspSagaCodeActionTitle = { link = "DeepNvimTitle" },
  LspSagaCodeActionBorder = { link = "DeepNvimBorder" },
  LspSagaCodeActionContent = { link = "DeepNvimContent" },

  -- finder
  LspSagaLspFinderBorder = { link = "DeepNvimBorder" },
  LspSagaAutoPreview = { link = "DeepNvimBorder" },
  LspSagaFinderSelection = { link = "DeepNvimSelection" },
  FinderParam = { link = "DeepNvimTitle" },
  DefinitionsIcon = { link = "DeepNvimTitleAlt" },
  Definitions = { link = "DeepNvimTitleAlt" },
  DefinitionCount = { fg = colors.white },
  ReferencesIcon = { link = "DeepNvimTitleAlt" },
  References = { link = "DeepNvimTitleAlt" },
  ReferencesCount = { fg = colors.white },
  ImplementsIcon = { link = "DeepNvimTitleAlt" },
  Implements = { link = "DeepNvimTitleAlt" },
  ImplementsCount = { fg = colors.white },

  --finder spinner
  FinderSpinnerBorder = { link = "DeepNvimBorder" },
  FinderSpinnerTitle = { link = "DeepNvimTitle" },
  FinderSpinner = { link = "DeepNvimTitleAlt" },
  FinderPreviewSearch = { link = "Search" },

  -- hover
  LspSagaHoverBorder = { link = "DeepNvimBorder" },
  LspSagaHoverTrunCateLine = { link = "LspSagaHoverBorder" },

  -- diagnostic
  LspSagaDiagnosticBorder = { link = "DeepNvimBorder" },
  DiagnosticQuickFix = { link = "DeepNvimTitleAlt" },
  DiagnosticMap = { fg = colors.white },
  DiagnosticLineCol = { fg = colors.white },
  LspSagaDiagnosticTruncateLine = { link = "LspSagaDiagnosticBorder" },
  ColInLineDiagnostic = { link = "DeepNvimBorder" },
}

for group, conf in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, conf)
end
