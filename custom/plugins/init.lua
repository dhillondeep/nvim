return {
  -- General
  ["kkharji/sqlite.lua"] = {},

  -- UI
  -- ["anuvyklack/windows.nvim"] = {
  --   cmd = { "WindowsMaximize", "WindowsMaximizeVertically", "WindowsMaximizeHorizontally", "WindowsEqualize" },
  --   requires = {
  --     { "anuvyklack/middleclass" },
  --     { "anuvyklack/animation.nvim" },
  --   },
  --   setup = function ()
  --     vim.o.winwidth = 10
  --     vim.o.winminwidth = 10
  --     vim.o.equalalways = false
  --
  --     require("core.utils").load_mappings "windows"
  --   end,
  --   config = function ()
  --     require("windows").setup()
  --   end
  -- },

  -- Startup and Projects

  ["mhinz/vim-startify"] = {
    setup = function ()
      -- custom options
      vim.g.startify_files_number = 18
      vim.g.startify_session_persistence = 1

      -- add support for web dev icons
      function _G.webDevIcons(path)
        local filename = vim.fn.fnamemodify(path, ':t')
        local extension = vim.fn.fnamemodify(path, ':e')
        return require'nvim-web-devicons'.get_icon(filename, extension, { default = true })
      end

      vim.cmd([[
        function! StartifyEntryFormat() abort
          return 'v:lua.webDevIcons(absolute_path) . " " . entry_path'
        endfunction
      ]])

      -- update startify lists displayed
      vim.g.startify_lists = {
        { type = 'sessions', header = { "Saved Sessions" } },
        { type = 'dir', header = { "Recently edited files in "..vim.fn.getcwd()..":" } }
      }
    end
  },

  ["ahmedkhalf/project.nvim"] = {
    config = function ()
      require("project_nvim").setup({
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "!node_modules" },
      })
    end
  },

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
      ensure_installed = { "lua", "go", "cpp", "c", "bash", "json", "json5", "gomod", "gowork", "yaml" }
    }
  },

  -- Copy/Paste/Move

  ["christoomey/vim-system-copy"] = {
    requires = {
      {
        "ojroques/vim-oscyank",
        after = "vim-system-copy",
        setup = function ()
          vim.g.oscyank_silent = true
          vim.g.oscyank_term = 'default'
        end
      },
    },
    keys = { "cp", "cP", "cv", "cV" },
    setup = function ()
      vim.g.system_copy_enable_osc52 = 1
    end
  },

  -- Motion and Movements

  ["christoomey/vim-tmux-navigator"] = {},

  ["justinmk/vim-sneak"] = {
    keys = {"S","s"},
    setup = function ()
      vim.g["sneak#label"] = 1
      vim.g["sneak#use_ic_scs"] = 1
      vim.g["sneak#s_next"] = 1
      vim.g["sneak#prompt"] = '🔎 '
    end
  },

  ["unblevable/quick-scope"] = {
    keys = {"F","f", "t", "T"},
    setup = function ()
      vim.g["qs_highlight_on_keys"] = {'f', 'F', 't', 'T'}
      vim.g["qs_max_chars"] = 150

      vim.cmd([[
        highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
        highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline
      ]])
    end
  },

  -- File Mapping, picker, etc
  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
      view = {
        adaptive_size = false,
        mappings = {
          list = {
            { key = "<CR>", action = "edit_no_picker" },
            { key = "<BS>", action = "dir_up" },
            { key = "<ESC>", action = "close" },
            { key = "N", action = "create" },
            { key = "c", action = "copy" },
            { key = "x", action = "cut" },
            { key = "p", action = "paste" },
            { key = "r", action = "rename" },
            { key = "y", action = "copy_absolute_path" },
            { key = ".", action = "toggle_dotfiles" },
            { key = "<C-.>", action = "toggle_git_ignored" },
            { key = "<C-k>", action = "toggle_file_info" },
            { key = "?", action = "preview" },
          },
        },
      },
      ignore_ft_on_setup = { "startify" },
      filters = {
        dotfiles = true,
        custom = { "node_modules", ".cache", "bazel-" },
      },
      actions = {
        open_file = {
          resize_window = false,
          window_picker = {
            exclude = {
              filetype = { "startify" },
              buftype = { "terminal" },
            }
          }
        }
      },
      renderer = {
        special_files = {
          ["go.mod"] = 1,
          ["Cargo.toml"] = 1,
          ["README.md"] = 1,
          ["Makefile"] = 1,
          ["BUILD"] = 1,
          ["MAKEFILE"] = 1,
          ["composer.json"] = 1,
          ["package.json"] = 1,
        },
        highlight_git = true,
        highlight_opened_files = "icon",
      }
    }
  },

  ["nvim-telescope/telescope.nvim"] = {
    requires = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      {
        "nvim-telescope/telescope-smart-history.nvim",
        after = { "sqlite.lua" }
      }
    },
    after = { "telescope-fzf-native.nvim", "telescope-smart-history.nvim" },
    override_options = {
      defaults = {
        cache_picker = {
          num_pickers = -1,
        },
        history = {
          path = '~/.local/share/nvim/databases/telescope_history.sqlite3',
          limit = 100,
        },
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
        },
        preview = {
          treesitter = {
            enable = {
              'css', 'dockerfile', 'html', 'http', 'javascript', 'json', 'lua', 'php',
              'python', 'regex', 'ruby', 'rust', 'scss', 'typescript', 'vue', 'yaml',
              'markdown', 'bash', 'c', 'cmake', 'comment', 'cpp', 'dart', 'go', 'gomod',
              'jsdoc', 'json5', 'jsonc', 'llvm', 'make', 'ninja', 'prisma',
              'proto', 'swift', 'toml', 'tsx',
            }
          }
        },
        file_ignore_patterns = { "node_modules", "bazel", ".cache" },
        extensions_list = { "fzf", "smart_history" },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
        },
      }
    }
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = {
      show_current_context_start = false,
    }
  },


  ["williamboman/mason.nvim"] = {
    override_options = {
      ensure_installed = { "gopls", "vim-language-server", "json-lsp", "yaml-language-server" }
    }
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    setup = function ()
      require("core.utils").load_mappings "lspsaga"
    end,
    config = function ()
      local saga = require("lspsaga")

      saga.init_lsp_saga({
        border_style = 'single',
        code_action_keys = {
            quit = '<esc>',
            exec = '<CR>',
        },
        finder_action_keys = {
            open = '<C-i>',
            vsplit = '<C-v>',
            split = '<C-h>',
            tabe = '<C-t>',
            quit = '<esc>',
        },
        definition_action_keys = {
            edit = '<C-i>',
            vsplit = '<C-v>',
            split = '<C-h>',
            tabe = '<C-t>',
            quit = '<esc>',
        },
        rename_action_quit = '<esc>',
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
    end
  }
}
