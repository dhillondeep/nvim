return {
  -- Enable which-key and update trigger keys
  ["folke/which-key.nvim"] = {
    disable = false,
    keys = { "<leader>" },
  },

  -- Update treesitter configuration
  ["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.configs.treesitter"),

  -- Update completion engine
  ["hrsh7th/nvim-cmp"] = require("custom.plugins.configs.cmp"),

  -- Update lspconfig
  ["neovim/nvim-lspconfig"] = {
    opt = true,
    setup = function()
      require("core.lazy_load").on_file_open "nvim-lspconfig"
    end,
    after = { "SchemaStore.nvim" },
    config = function()
      require("custom.plugins.configs.lspconfig")
    end,
  },

  -- Update Mason
  ["williamboman/mason.nvim"] = {
    cmd = require("core.lazy_load").mason_cmds,
    config = function()
      require "plugins.configs.mason"
      require("custom.plugins.configs.mason")
    end,
  },
}
