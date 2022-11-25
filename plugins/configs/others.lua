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

function others.treesitter()
  local opts = deepvim.opts.treesitter

  return {
    ensure_installed = opts.languages,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    rainbow = {
      enable = true,
      disable = opts.rainbow_disable,
      extended_mode = false,
      max_file_lines = nil,
    },
    autotag = { enable = true },
    incremental_selection = { enable = true },
    indent = { enable = false },
  }
end

function others.notify()
  local notify = require("notify")
  notify.setup({
    fps = 60,
    stages = "fade_in_slide_out",
    timeout = 100,
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
    resize_mode = {
      hooks = {
        on_leave = require("bufresize").register,
      },
    },
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

function others.bufresize()
  vim.cmd([[
    augroup Resize
        autocmd!
        autocmd VimResized * lua require('bufresize').resize()
    augroup END
  ]])
  vim.cmd([[
    augroup Register
        autocmd!
        autocmd BufWinEnter * if !(&ft ==? "neo-tree") | execute "lua require('bufresize').register()" | endif
    augroup END
  ]])
end

function others.flit()
  require("flit").setup({
    keys = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "nvo",
    multiline = false,
    opts = {},
  })
end

return others

  -- white = "#abb2bf",
  -- darker_black = "#1b1f27",
  -- black = "#1e222a", --  nvim bg
  -- black2 = "#252931",
  -- one_bg = "#282c34", -- real bg of onedark
  -- one_bg2 = "#353b45",
  -- one_bg3 = "#373b43",
  -- grey = "#42464e",
  -- grey_fg = "#565c64",
  -- grey_fg2 = "#6f737b",
  -- light_grey = "#6f737b",
  -- red = "#e06c75",
  -- baby_pink = "#DE8C92",
  -- pink = "#ff75a0",
  -- line = "#31353d", -- for lines like vertsplit
  -- green = "#98c379",
  -- vibrant_green = "#7eca9c",
  -- nord_blue = "#81A1C1",
  -- blue = "#61afef",
  -- yellow = "#e7c787",
  -- sun = "#EBCB8B",
  -- purple = "#de98fd",
  -- dark_purple = "#c882e7",
  -- teal = "#519ABA",
  -- orange = "#fca2aa",
  -- cyan = "#a3b8ef",
  -- statusline_bg = "#22262e",
  -- lightbg = "#2d3139",
  -- pmenu_bg = "#61afef",
  -- folder_bg = "#61afef",
