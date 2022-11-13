vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError",
  {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn",
  {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo",
  {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint",
  {text = "", texthl = "DiagnosticSignHint"})

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
    commands = {
			-- Override delete to use trash instead of rm
			delete = function(state)
        local inputs = require "neo-tree.ui.inputs"
        local path = state.tree:get_node().path
        local msg = "Are you sure you want to delete " .. path
        inputs.confirm(msg, function(confirmed)
          if not confirmed then return end

          vim.fn.system { "trash", vim.fn.fnameescape(path) }
          require("neo-tree.sources.manager").refresh(state.name)
        end)
      end
		},
  },
  window = {
    mappings = {
      ["w"] = "none",
      ["S"] = "none",
      ["s"] = "none",
      ["<C-s>"] = "open_split",
      ["<C-v>"] = "open_vsplit",
      ["<C-t>"] = "open_tabnew",
      ["<C-o>"] = "open_with_window_picker",
      ["N"] = {
        "add",
        config = {
          show_path = "none"
        }
      },
    }
  },
  follow_current_file = true,
})
