local on_file_open = { "BufRead", "BufWinEnter", "BufNewFile" }

return {
  -- Startup
  ["echasnovski/mini.starter"] = {
    requires = {
      { "echasnovski/mini.sessions" },
    },
    config = function()
      require("custom.plugins.configs.starter").setup()
    end
  },

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

  -- UI
  ["stevearc/dressing.nvim"] = {
    event = "UIEnter",
    config = function()
      require("custom.plugins.configs.others").dressing()
    end
  },

  ["rcarriga/nvim-notify"] = {
    event = "UIEnter",
    config = function()
      require("custom.plugins.configs.others").notify()
    end
  },

  ["s1n7ax/nvim-window-picker"] = {
    tag = "v1.*",
    module = "window-picker",
    config = function()
      require("custom.plugins.configs.others").window_picker()
    end,
  },

  -- Syntax highlighting
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  -- file managing, picker, etc
  ["nvim-neo-tree/neo-tree.nvim"] = {
    branch = "v2.x",
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "kyazdani42/nvim-web-devicons" },
      { "s1n7ax/nvim-window-picker" },
      { "MunifTanjim/nui.nvim", module = "nui" },
    },
    cmd = "Neotree",
    config = function()
      require("custom.plugins.configs.neotree")
    end,
    setup = function()
      vim.g.neo_tree_remove_legacy_commands = true
      require("core.utils").load_mappings "neotree"
    end,
  },

  -- file formatting, lsp, etc
  ["Darazaki/indent-o-matic"] = {
    event = on_file_open,
    config = function()
      require("custom.plugins.configs.others").indentomatic()
    end,
  },

  -- Terminal
  ["akinsho/toggleterm.nvim"] = {
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require("custom.plugins.configs.toggleterm")
    end,
  },

  -- LSP
  ["b0o/SchemaStore.nvim"] = { module = "schemastore" },
}
