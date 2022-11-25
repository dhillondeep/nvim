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

function others.guess_indent()
  require("guess-indent").setup({
    filetype_exclude = {
      "netrw",
      "tutor",
      "neo-tree",
    },
    buftype_exclude = {
      "help",
      "nofile",
      "terminal",
      "prompt",
    },
  })
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

function others.autopairs()
  return {
    enable_check_bracket_line = true,
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
end

function others.indent_blankline()
  local present, blankline = pcall(require, "indent_blankline")
  if not present then
    return
  end

  require("base46").load_highlight("blankline")

  local options = {
    indentLine_enabled = 1,
    buftype_exclude = {
      "nofile",
      "terminal",
    },
    filetype_exclude = {
      "help",
      "startify",
      "aerial",
      "alpha",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "neo-tree",
      "Trouble",
      "terminal",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "",
    },
    context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "jsx_element",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    },
    show_trailing_blankline_indent = false,
    use_treesitter = true,
    char = "▏",
    context_char = "▏",
    show_current_context = true,
    show_current_context_start = true,
  }

  blankline.setup(options)
end

function others.smart_splits()
  require("smart-splits").setup({
    ignored_filetypes = {
      "nofile",
      "quickfix",
      "qf",
      "prompt",
    },
    ignored_buftypes = { "nofile" },
  })
end

function others.comment()
  local utils = require("Comment.utils")
  require("Comment").setup({
    pre_hook = function(ctx)
      local location = nil
      if ctx.ctype == utils.ctype.blockwise then
        location = require("ts_context_commentstring.utils").get_cursor_location()
      elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
        location = require("ts_context_commentstring.utils").get_visual_start_location()
      end

      return require("ts_context_commentstring.internal").calculate_commentstring({
        key = ctx.ctype == utils.ctype.linewise and "__default" or "__multiline",
        location = location,
      })
    end,
  })
end

return others
