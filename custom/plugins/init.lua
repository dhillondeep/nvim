return {

  -- Disabled plugins
  ["goolord/alpha-nvim"] = false,

  -- Shared dependencies
  ["kkharji/sqlite.lua"] = {},

  -- UI
  ["anuvyklack/windows.nvim"] = {
    requires = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim" },
    },
    setup = function ()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false

      require("core.utils").load_mappings "windows"
    end,
    config = function ()
      require("windows").setup()
    end
  },

  -- Startup and Projects
  --
  -- Enhance a and i text object operators
  ["echasnovski/mini.ai"] = {
    config = function()
      require('mini.ai').setup()
    end
  },

  -- Surrounds word/words with a character
  -- sa: Surround with some char (normal) saiw", sa$'
  -- sd: Delete surround char (normal) sd", sd'
  -- sr: Replace surround char (normal) sr"', sr{[
  ["echasnovski/mini.surround"] = {
    config = function()
      require('mini.surround').setup()
    end
  },

  -- Highlights trailing whitespace
  ["echasnovski/mini.trailspace"] = {
    setup = function()
      require("core.utils").load_mappings "trailspace"
    end,
    config = function()
      require('mini.trailspace').setup()
    end
  },

  -- Miscellaneous mini function
  ["echasnovski/mini.misc"] = {
    config = function()
      require('mini.misc').setup()
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

  ["ggandor/leap.nvim"] = {
     config = function()
      require('leap').add_default_mappings()
    end
  },

  ["ggandor/flit.nvim"] = {
    after = "leap.nvim",
    config = function()
      require('flit').setup {
        keys = { f = 'f', F = 'F', t = 't', T = 'T' },
        labeled_modes = "nvo",
        multiline = false,
        opts = {}
      }
    end
  },

  ["ggandor/leap-spooky.nvim"] = {
    after = "leap.nvim",
    config = function ()
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
  },

  ["ggandor/leap-ast.nvim"]  = {
    setup = function ()
      vim.keymap.set({'n', 'x', 'o'}, ';', function() require'leap-ast'.leap() end, {})
    end
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
    config = function ()
      require('custom.plugins.configs.nvim-treesitter-textobjects')
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

  ["olimorris/persisted.nvim"] = {
    setup = function()
      vim.o.sessionoptions = "buffers,curdir,folds,winpos,winsize"
    end,

    config = function()
      require("persisted").setup({
        save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- Resolves to ~/.local/share/nvim/sessions/
        follow_cwd = false,
        branch_separator = "_",
        autoload = true,

        after_source = function()
          -- Reload the LSP servers
          vim.lsp.stop_client(vim.lsp.get_active_clients())
        end
      })
    end
  },

  ["kyazdani42/nvim-web-devicons"] = {
    after = "ui",
    module = "nvim-web-devicons",
    config = function()
      require("custom.plugins.configs.devicons")
    end,
  },

  ["stevearc/dressing.nvim"] = {},

  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    requires = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
      { "nvim-telescope/telescope-live-grep-args.nvim" },
      { "nvim-telescope/telescope-frecency.nvim", after = "sqlite.lua" },
    },
    after = { "telescope-fzf-native.nvim", "telescope-live-grep-args.nvim", "telescope-frecency.nvim" },
    config = function()
      require "custom.plugins.configs.telescope"
    end,
    setup = function()
      require("core.utils").load_mappings "telescope"
    end,
  },

  ["ibhagwan/fzf-lua"] = {
    requires = {
      {
        "junegunn/fzf",
        run = "./install --all"
      },
    },
    after = { "fzf", "nvim-web-devicons" },
    config = function()
      require("custom.plugins.configs.fzf-lua")
    end,
    setup = function()
      require("core.utils").load_mappings "fzflua"
    end,
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
            open = '<CR>',
            vsplit = '<C-v>',
            split = '<C-h>',
            tabe = '<C-t>',
            quit = '<esc>',
        },
        definition_action_keys = {
            edit = '<CR>',
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
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()

      -- custom mapping for luasnip
      ls = require("luasnip")
      vim.cmd [[
        inoremap <silent> <C-L> <cmd>lua ls.jump(1)<Cr>
        inoremap <silent> <C-H> <cmd>lua ls.jump(-1)<Cr>
        snoremap <silent> <C-L> <cmd>lua ls.jump(1)<Cr>
        snoremap <silent> <C-H> <cmd>lua ls.jump(-1)<Cr>
      ]]
    end,
  },

  -- Text Editing --
  ------------------

  ["windwp/nvim-autopairs"] = {
    override_options = {
      enable_check_bracket_line = true,
      fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
      },
    }
  }
}
