local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local present2, lga_actions = pcall(require, "telescope-live-grep-args.actions")
if not present2 then
  return
end

local actions = require("telescope.actions")

vim.g.theme_switcher_loaded = true

require("base46").load_highlight("telescope")

local options = {
  pickers = {
    find_files = {
      find_command = {"fd", "--hidden", "--follow", "--no-ignore", "-t", "file", "-E", ".min.js", "-E", ".swp", "-E", ".git", "-E", "node_modules", "-E", "vendor", "-E", "bazel-*"}
    },
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    },
    terminals = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer,
        },
      },
    },
  },
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--column",
      "--line-number",
      "--no-heading",
      "--color=never",
      "--hidden",
      "--follow",
      "--no-ignore",
      "--smart-case",
      "-g",
      "!*.{min.js,swp,o,zip}",
      "-g",
      "!{.git,node_modules,*/node_modules,vendor,*/vendor,bazel-*,*/bazel-*}/*",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = actions.close },
      i = {
        ["<tab>"] = actions.cycle_history_next,
        ["<S-tab>"] = actions.cycle_history_prev,
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,
        ["<C-s>"] = actions.select_horizontal,
        ["<C-h>"] = "which_key",
      },
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = lga_actions.quote_prompt(),
          ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
        },
      },
    },
  },

  extensions_list = { "themes", "terms", "fzf", "live-grep-args", "ui-select", "projects", "harpoon" },
}

-- check for any override
options = require("core.utils").load_override(options, "nvim-telescope/telescope.nvim")
telescope.setup(options)

-- load extensions
pcall(function()
  for _, ext in ipairs(options.extensions_list) do
    telescope.load_extension(ext)
  end
end)
