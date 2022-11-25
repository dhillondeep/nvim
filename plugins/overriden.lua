return {
	-- UI/Look and feel
	["NvChad/ui"] = {
		override_options = {
			tabufline = {
				enabled = false,
			},
		},
	},

	["kyazdani42/nvim-web-devicons"] = {
		after = "ui",
		module = "nvim-web-devicons",
		config = function()
			require("custom.plugins.configs.devicons")
		end,
	},

	-- Commands
	["folke/which-key.nvim"] = {
		disable = false,
		keys = { "<leader>" },
	},

	-- LSP, code editing
	["nvim-treesitter/nvim-treesitter"] = require("custom.plugins.configs.treesitter"),

	["hrsh7th/nvim-cmp"] = {
		after = "friendly-snippets",
		config = function()
			require("custom.plugins.configs.cmp")
		end,
	},

	["neovim/nvim-lspconfig"] = {
		opt = true,
		requires = {
			{ "jose-elias-alvarez/null-ls.nvim", event = deepvim.on_file_open },
			{ "b0o/SchemaStore.nvim", module = "schemastore" },
		},
		setup = function()
			require("core.lazy_load").on_file_open("nvim-lspconfig")
		end,
		config = function()
			require("custom.plugins.configs.lspconfig")
		end,
	},

	["williamboman/mason.nvim"] = {
		cmd = require("core.lazy_load").mason_cmds,
		config = function()
			require("plugins.configs.mason")
			require("custom.plugins.configs.mason")
		end,
	},

	["nvim-telescope/telescope.nvim"] = {
		event = "VimEnter",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			{ "nvim-telescope/telescope-fzf-native.nvim" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("custom.plugins.configs.telescope")
		end,
		setup = function()
			require("core.utils").load_mappings("telescope")
		end,
	},

	["windwp/nvim-autopairs"] = {
		after = "nvim-cmp",
		setup = function()
			require("core.utils").load_mappings("autopairs")
		end,
		config = function()
			if not deepvim.opts.autopairs_enabled then
				return
			end
			require("plugins.configs.others").autopairs()
		end,
		override_options = require("custom.plugins.configs.others").autopairs,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		opt = true,
		setup = function()
			require("core.lazy_load").on_file_open("indent-blankline.nvim")
			require("core.utils").load_mappings("blankline")
		end,
		config = function()
			require("custom.plugins.configs.others").indent_blankline()
		end,
	},

	["numToStr/Comment.nvim"] = {
		module = "Comment",
		keys = { "gc", "gb" },
		config = function()
			require("custom.plugins.configs.others").comment()
		end,
		setup = function()
			require("core.utils").load_mappings("comment")
		end,
	},

	["L3MON4D3/LuaSnip"] = {
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").luasnip()

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
