vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint",
  { text = "", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
  close_if_last_window = true,
  source_selector = {
    winbar = true,
    statusline = false
  },
  default_component_configs = {
    modified = {
      symbol = "+",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "",
        modified  = "",
        deleted   = "",
        renamed   = "",
        -- Status type
        untracked = "",
        ignored   = "◌",
        unstaged  = "✗",
        staged    = "✓",
        conflict  = "",
      }
    },
  },
  filesystem = {
    hide_by_name = {
      "node_modules",
      "vendor",
    },
    hide_by_pattern = {
      "bazel-*"
    },
    never_show = {
      ".DS_Store",
      "thumbs.db"
    },
    follow_current_file = true,
  },
  window = {
    mappings = {
      ["w"] = "none",
      ["S"] = "none",
      ["s"] = "none",
      [">"] = "none",
      ["<"] = "none",
      ["<C-s>"] = "open_split",
      ["<C-v>"] = "open_vsplit",
      ["<C-t>"] = "open_tabnew",
      ["<C-o>"] = "open_with_window_picker",
      ["<Tab>"] = "next_source",
      ["<S-Tab>"] = "prev_source",
      ["N"] = {
        "add",
        config = {
          show_path = "none"
        }
      },
    }
  },
  follow_current_file = true,
  event_handlers = {
    {
      event = "file_opened",
      handler = function(_)
        require("neo-tree").close_all()
      end
    },
    {
      event = "neo_tree_window_before_open",
      handler = function()
        require("bufresize").register()
      end
    },
    {
      event = "neo_tree_window_after_open",
      handler = function()
        require("bufresize").resize()
      end
    },
    {
      event = "neo_tree_window_after_close",
      handler = function()
        require("bufresize").resize()
      end
    }
  }
})
