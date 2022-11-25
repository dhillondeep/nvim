local utils = deepvim.utils

return {
	--- UI/Look and feel ---

	["NvChad/ui"] = {
		override_options = {
			tabufline = {
				enabled = false,
			},
		},
	},

	["kyazdani42/nvim-web-devicons"] = {
		config = function()
			require("custom.plugins.configs.devicons")
		end,
	},

	["folke/which-key.nvim"] = {
		disable = false,
		keys = { "<leader>" },
	},

	--- LSP, search, and formatting ---

	["nvim-treesitter/nvim-treesitter"] = {
		override_options = require("custom.plugins.configs.others").treesitter(),
	},

	["hrsh7th/nvim-cmp"] = {
		config = function()
			require("custom.plugins.configs.cmp")
		end,
	},

	["neovim/nvim-lspconfig"] = {
		requires = {
			{ "jose-elias-alvarez/null-ls.nvim", event = deepvim.g.on_file_open },
			{ "b0o/SchemaStore.nvim", module = "schemastore" },
		},
		config = function()
			require("custom.plugins.configs.lspconfig")
		end,
	},

	["williamboman/mason.nvim"] = {
		override_options = require("custom.plugins.configs.mason"),
	},

	["nvim-telescope/telescope.nvim"] = {
		event = "UIEnter",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("custom.plugins.configs.telescope")
		end,
	},

	["windwp/nvim-autopairs"] = {
		config = function()
			if not deepvim.opts.autopairs_enabled then
				return
			end
			require("plugins.configs.others").autopairs()
		end,
		override_options = require("custom.plugins.configs.others").autopairs(),
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		config = function()
			require("custom.plugins.configs.others").indent_blankline()
		end,
	},

	["numToStr/Comment.nvim"] = {
		config = function()
			require("custom.plugins.configs.others").comment()
		end,
	},

	["L3MON4D3/LuaSnip"] = {
		setup = function()
			-- custom mapping for luasnip
			vim.cmd([[
        inoremap <silent> <C-L> <cmd>lua require("luasnip").jump(1)<Cr>
        inoremap <silent> <C-H> <cmd>lua require("luasnip").jump(-1)<Cr>
        snoremap <silent> <C-L> <cmd>lua require("luasnip").jump(1)<Cr>
        snoremap <silent> <C-H> <cmd>lua require("luasnip").jump(-1)<Cr>
      ]])
		end,
	},
}
