local others = {}

function others.dressing()
  require("dressing").setup({
    input = {
      default_prompt = "➤ ",
      winhighlight = "Normal:Normal,NormalNC:Normal",
    },
    select = {
      backend = { "telescope", "builtin" },
      builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" },
    },
  })
end

function others.notify()
  local notify = require("notify")
  notify.setup({
    stages = "fade",
  })
  vim.notify = notify
end

function others.indentomatic()
  require("indent-o-matic").setup({})
end

function others.window_picker()
  local colors = require("base46").get_theme_tb("base_30")
  require("window-picker").setup({
    use_winbar = "smart",
    other_win_hl_color = colors.statusline_bg,
  })
end

function others.mason_null_ls()
  local mason_null_ls = require("mason-null-ls")
  mason_null_ls.setup({
    automatic_installation = true,
  })
  mason_null_ls.setup_handlers()
end

function others.project()
  require("project_nvim").setup({
    patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
      "!node_modules",
    },
    silent_chdir = false,
  })
end

return others
