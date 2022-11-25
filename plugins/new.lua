return {
	-- Startup, Sessions, and Projects
	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("custom.plugins.configs.others").project()
		end,
	},

	["echasnovski/mini.starter"] = {
		requires = {
			{ "echasnovski/mini.sessions" },
		},
		config = function()
			require("custom.plugins.configs.starter").setup()
		end,
	},

	-- Copy/Paste/Move
	["christoomey/vim-system-copy"] = {
		requires = {
			{
				"ojroques/vim-oscyank",
				after = "vim-system-copy",
				setup = function()
					vim.g.oscyank_silent = true
					vim.g.oscyank_term = "default"
				end,
			},
		},
		keys = { "cp", "cP", "cv", "cV" },
		setup = function()
			vim.g.system_copy_enable_osc52 = 1
		end,
	},

	["christoomey/vim-tmux-navigator"] = {
		setup = function()
			vim.g.tmux_navigator_disable_when_zoomed = 1
		end,
	},

	-- UI/Look and feel
	["nanozuki/tabby.nvim"] = {
		config = function()
			require("custom.plugins.configs.tabby")
		end,
	},

	["stevearc/dressing.nvim"] = {
		event = "UIEnter",
		config = function()
			require("custom.plugins.configs.others").dressing()
		end,
	},

	["rcarriga/nvim-notify"] = {
		event = "UIEnter",
		config = function()
			require("custom.plugins.configs.others").notify()
		end,
	},

	["s1n7ax/nvim-window-picker"] = {
		tag = "v1.*",
		module = "window-picker",
		config = function()
			require("custom.plugins.configs.others").window_picker()
		end,
	},

	["nmac427/guess-indent.nvim"] = {
		event = deepvim.on_file_open,
		config = function()
			require("custom.plugins.configs.others").guess_indent()
		end,
	},

	["mrjones2014/smart-splits.nvim"] = {
		module = "smart-splits",
		setup = function()
			require("core.utils").load_mappings("smart_splits")
		end,
		config = function()
			require("custom.plugins.configs.others").smart_splits()
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
			require("core.utils").load_mappings("neotree")
		end,
	},

	-- file formatting, lsp
	["jayp0521/mason-null-ls.nvim"] = {
		after = { "mason.nvim", "nvim-lspconfig" },
		cmd = { "NullLsInstall", "NullLsUninstall" },
		config = function()
			require("custom.plugins.configs.others").mason_null_ls()
		end,
	},

	["glepnir/lspsaga.nvim"] = {
		branch = "main",
		setup = function()
			require("core.utils").load_mappings("lspsaga")
		end,
		config = function()
			require("custom.plugins.configs.lspsaga")
		end,
	},

	-- Search
	["ibhagwan/fzf-lua"] = {
		requires = {
			{
				"junegunn/fzf",
				run = "./install --all",
			},
		},
		after = { "nvim-web-devicons" },
		config = function()
			require("custom.plugins.configs.fzflua")
		end,
		setup = function()
			require("core.utils").load_mappings("fzflua")
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
}
