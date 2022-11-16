return {
  -- Disabled plugins

  ["goolord/alpha-nvim"] = false,
  ["kyazdani42/nvim-tree.lua"] = false,
  ["nvim-telescope/telescope.nvim"] = false,

  -- UI
  ["kwkarlwang/bufresize.nvim"] = {
    config = function()
      require("custom.plugins.configs.others").bufresize()
    end,
  },

  -- Startup and Projects
  ["echasnovski/mini.starter"] = {
    requires = {
      { "echasnovski/mini.sessions" },
    },
    config = function()
      require("custom.plugins.configs.starter").setup()
    end
  },

  -- Enhance a and i text object operators
  ["echasnovski/mini.ai"] = {
    config = function()
      require('mini.ai').setup()
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
    config = function()
      require("custom.plugins.configs.others").project()
    end
  },

  ["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.configs.others").treesitter(),

  -- Copy/Paste/Move

  ["christoomey/vim-system-copy"] = {
    requires = {
      {
        "ojroques/vim-oscyank",
        after = "vim-system-copy",
        setup = function()
          vim.g.oscyank_silent = true
          vim.g.oscyank_term = 'default'
        end
      },
    },
    keys = { "cp", "cP", "cv", "cV" },
    setup = function()
      vim.g.system_copy_enable_osc52 = 1
    end
  },

  -- Motion and Movements

  ["christoomey/vim-tmux-navigator"] = {
    setup = function()
      vim.g.tmux_navigator_disable_when_zoomed = 1
    end
  },

  ["ggandor/leap.nvim"] = {
    config = function()
      require('leap').add_default_mappings()
    end
  },

  ["ggandor/flit.nvim"] = {
    after = "leap.nvim",
    config = function()
      require("custom.plugins.configs.others").flit()
    end
  },

  ["ggandor/leap-spooky.nvim"] = {
    after = "leap.nvim",
    config = function()
      require("custom.plugins.configs.others").leap_spooky()
    end
  },

  ["ggandor/leap-ast.nvim"] = {
    setup = function()
      vim.keymap.set({ 'n', 'x', 'o' }, ';', function() require 'leap-ast'.leap() end, {})
    end
  },

  ["nvim-treesitter/nvim-treesitter-textobjects"] = {
    after = "nvim-treesitter",
    config = function()
      require('custom.plugins.configs.nvim-treesitter-textobjects')
    end
  },

  -- File Mapping, picker, etc

  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-web-devicons" },
      { "MunifTanjim/nui.nvim" },
      {
        "s1n7ax/nvim-window-picker",
        tag = "v1.*",
        config = function()
          require("custom.plugins.configs.others").window_picker()
        end
      }
    },
    cmd = { "NeoTreeShow", "NeoTreeRevealToggle", "NeoTreeFocus" },
    config = function()
      require("custom.plugins.configs.neotree")
    end,
    setup = function()
      require("core.utils").load_mappings "neotree"
    end,
  },

  ["kyazdani42/nvim-web-devicons"] = {
    after = "ui",
    module = "nvim-web-devicons",
    config = function()
      require("custom.plugins.configs.devicons")
    end,
  },

  ["stevearc/dressing.nvim"] = {},

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

  ["lukas-reineke/indent-blankline.nvim"] = require("custom.plugins.configs.others").indent_blankline(),

  ["williamboman/mason-lspconfig.nvim"] = {
    after = "mason.nvim",
    config = function()
      local lspservers = require("custom.plugins.configs.config").lspservers()
      require("custom.plugins.configs.mason-lspconfig").setup(lspservers)
    end
  },

  ["neovim/nvim-lspconfig"] = {
    after = { "mason-lspconfig.nvim" },
    config = function()
      require "plugins.configs.lspconfig"
      local lspservers = require("custom.plugins.configs.config").lspservers()
      require("custom.plugins.configs.lspconfig").setup(lspservers)
    end,
  },

  ["glepnir/lspsaga.nvim"] = {
    branch = "main",
    setup = function()
      require("core.utils").load_mappings "lspsaga"
    end,
    config = function()
      require("custom.plugins.configs.lspsaga").setup()
    end
  },

  ["hrsh7th/nvim-cmp"] = {
    override_options = {
      sources = {
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end
          },
        },
      },
    },
  },

  ["L3MON4D3/LuaSnip"] = {
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      require("plugins.configs.others").luasnip()

      -- custom mapping for luasnip
      local ls = require("luasnip")
      vim.cmd [[
        inoremap <silent> <C-L> <cmd>lua ls.jump(1)<Cr>
        inoremap <silent> <C-H> <cmd>lua ls.jump(-1)<Cr>
        snoremap <silent> <C-L> <cmd>lua ls.jump(1)<Cr>
        snoremap <silent> <C-H> <cmd>lua ls.jump(-1)<Cr>
      ]]
    end,
  },

  -- Text Editing

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
        highlight_grey = 'Comment'
      },
    }
  }
}
