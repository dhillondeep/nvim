local others = {}

function others.bufresize()
  local opts = { noremap = true, silent = true }
  require("bufresize").setup({
    register = {
      keys = {
        { "n", "<C-w>l", "10<C-w><", opts },
        { "n", "<C-w>h", "10<C-w>>", opts },
        { "n", "<C-w>j", "5<C-w>+", opts },
        { "n", "<C-w>k", "5<C-w>-", opts },
      },
      trigger_events = { "BufWinEnter", "WinEnter" },
    },
    resize = {
      keys = {},
      trigger_events = { "VimResized" },
      increment = 5,
    },
  })
end

function others.project()
  require("project_nvim").setup({
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "!node_modules" }
  })
end

function others.treesitter()
  return {
    override_options = {
      ensure_installed = { "lua", "go", "cpp", "c", "bash", "json", "json5", "gomod", "gowork", "yaml" }
    }
  }
end

function others.flit()
  require('flit').setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    labeled_modes = "nvo",
    multiline = true,
    opts = {}
  }
end

function others.leap_spooky()
  require('leap-spooky').setup {
    affixes = {
      -- These will generate mappings for all native text objects, like:
      -- (ir|ar|iR|aR|im|am|iM|aM){obj}.
      -- Special line objects will also be added, by repeating the affixes.
      -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
      -- window.
      -- You can also use 'rest' & 'move' as mnemonics.
      remote   = { window = 'r', cross_window = 'R' },
      magnetic = { window = 'm', cross_window = 'M' },
    },
    yank_paste = false,
  }
end

function others.window_picker()
  require 'window-picker'.setup({
    autoselect_one = true,
    include_current = true,
    filter_rules = {
      bo = {
        filetype = { 'neo-tree', "neo-tree-popup", "notify" },
        buftype = { 'terminal', "quickfix" },
      },
    },
    other_win_hl_color = '#e35e4f',
  })
end

function others.indent_blankline()
  return {
    override_options = {
      show_current_context_start = false
    }
  }
end

return others
