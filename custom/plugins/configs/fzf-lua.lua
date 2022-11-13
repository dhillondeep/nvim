local actions = require "fzf-lua.actions"

require("fzf-lua").setup({
  winopts = {
    height           = 0.87,            -- window height
    width            = 0.80,            -- window width
    preview = {
      border         = 'noborder',
      default        = 'bat',
      scrollbar      = 'false',
      vertical       = 'down:55%',      -- up|down:size
      horizontal     = 'right:55%',     -- right|left:size
    },
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    hl = {
      normal         = 'Normal',        -- window normal color (fg+bg)
      border         = 'FloatBorder',   -- border color
      help_normal    = 'Normal',        -- <F1> window normal
      help_border    = 'FloatBorder',   -- <F1> window border
    },
  },
  fzf_opts = {
    -- options are sent as `<left>=<right>`
    -- set to `false` to remove a flag
    -- set to '' for a non-value flag
    -- for raw args use `fzf_args` instead
    ['--info']        = 'inline',
    ['--layout']      = 'reverse',
    ['--color']       = 'pointer:129,marker:010',
    ['--ansi']        = '',
  },
  previewers = {
    bat = {
      cmd             = "bat",
      args            = os.getenv("BAT_ARGS"),
      theme           = os.getenv("BAT_THEME"),
    },
  },
  files = {
    prompt            = 'Files❯   ',
    fd_opts           = os.getenv("FD_OPTS") .. " --type f --type s",
  },
  lines = {
    prompt            = 'Lines❯   ',
  },
  blines = {
    prompt            = 'BLines❯   ',
  },
  grep = {
    prompt            = 'Search❯   ',
    rg_opts           = os.getenv("RG_OPTS"),
    actions = {
      ["ctrl-g"]      = { actions.grep_lgrep }
    },
    continue_last_search  = false,
    no_header             = true,    -- hide grep|cwd header?
    no_header_i           = true,    -- hide interactive header?
  },
  file_icon_colors = {
    ["sh"] = "green",
  },
  keymap = {
    builtin = {
      -- neovim `:tmap` mappings for the fzf win
      ["<F1>"]        = "toggle-help",
      ["<C-f>"]       = "toggle-fullscreen",
    },
    fzf = {
      ["ctrl-w"]      = "toggle-preview-wrap",
      ["ctrl-p"]      = "toggle-preview",
      ["ctrl-d"]      = "preview-page-down",
      ["ctrl-u"]      = "preview-page-up",
    },
  },
  actions = {
    files = {
      ["default"]     = actions.file_edit_or_qf,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
    },
    buffers = {
      ["default"]     = actions.buf_edit,
      ["ctrl-s"]      = actions.buf_split,
      ["ctrl-v"]      = actions.buf_vsplit,
      ["ctrl-t"]      = actions.buf_tabedit,
    }
  },
})
