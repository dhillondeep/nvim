return {
	--- Startup, Sessions, and Projects ---

	-- project management with automatic cwd
	["ahmedkhalf/project.nvim"] = {
		config = function()
			require("custom.plugins.configs.others").project()
		end,
	},

	-- starting screen with sessions support
	["echasnovski/mini.starter"] = {
		requires = {
			{ "echasnovski/mini.sessions" },
		},
		config = function()
			require("custom.plugins.configs.starter").setup()
		end,
	},

	--- Copy/Paste/Move ---

	-- Explicitly copy and paste into system clipboard
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
		keys = { "cp", "cP" }, -- only load for these keys: copy supported
		setup = function()
			vim.g.system_copy_silent = 1
			vim.g.system_copy_enable_osc52 = 1
		end,
	},

	-- Tmux pane navigation from vim
	["christoomey/vim-tmux-navigator"] = {
		setup = function()
			vim.g.tmux_navigator_disable_when_zoomed = 1
		end,
	},

	-- Jump around screen with few keywords
	["ggandor/leap.nvim"] = {
		config = function()
			require("leap").add_default_mappings()
		end,
	},

	-- Enhanced f/t motion
	["ggandor/flit.nvim"] = {
		after = "leap.nvim",
		config = function()
			require("custom.plugins.configs.others").flit()
		end,
	},

	["nvim-treesitter/nvim-treesitter-textobjects"] = {
		after = "nvim-treesitter",
		config = function()
			require("custom.plugins.configs.nvimtreesittertextobjects")
		end,
	},

	["ThePrimeagen/harpoon"] = {},

	--- UI/Look and feel ---

	-- Tabline/Bufferline
	["nanozuki/tabby.nvim"] = {
		config = function()
			require("custom.plugins.configs.tabby")
		end,
	},

	-- A fancy notification system
	["rcarriga/nvim-notify"] = {
		event = "UIEnter",
		config = function()
			require("custom.plugins.configs.others").notify()
		end,
	},

	-- A fancy ui interfaces
	["stevearc/dressing.nvim"] = {
		event = "UIEnter",
		config = function()
			require("custom.plugins.configs.others").dressing()
		end,
	},

	-- Prompts the user to pick a window and returns the window id
	["s1n7ax/nvim-window-picker"] = {
		tag = "v1.*",
		module = "window-picker",
		config = function()
			require("custom.plugins.configs.others").window_picker()
		end,
	},

	-- Automatic indentation guess based on current file structure
	["nmac427/guess-indent.nvim"] = {
		event = deepvim.g.on_file_open,
		config = function()
			require("custom.plugins.configs.others").guess_indent()
		end,
	},

	-- Smart split resizing
	["mrjones2014/smart-splits.nvim"] = {
		module = "smart-splits",
		after = "bufresize.nvim",
		setup = function()
			require("core.utils").load_mappings("smart_splits")
		end,
		config = function()
			require("custom.plugins.configs.others").smart_splits()
		end,
	},

	["kwkarlwang/bufresize.nvim"] = {
		config = function()
			require("custom.plugins.configs.others").bufresize()
		end,
	},

	--- TreeSitter Syntax highlighting ---

	["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },
	["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },
	["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

	--- File mgmnt ---

	-- File manager
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

	--- LSP, search, and formatting ---

	-- Mason support for automatic installion for null-ls sources
	["jayp0521/mason-null-ls.nvim"] = {
		after = { "mason.nvim", "nvim-lspconfig" },
		cmd = { "NullLsInstall", "NullLsUninstall" },
		config = function()
			require("custom.plugins.configs.others").mason_null_ls()
		end,
	},

	-- Highly performant UI for LSP
	["glepnir/lspsaga.nvim"] = {
		branch = "main",
		setup = function()
			require("core.utils").load_mappings("lspsaga")
		end,
		config = function()
			require("custom.plugins.configs.lspsaga")
		end,
	},

	-- FZF lua to fuzzy search
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

	--- Terminal ---

	-- Manage multiple terminal windows
	["akinsho/toggleterm.nvim"] = {
		cmd = "ToggleTerm",
		module = { "toggleterm", "toggleterm.terminal" },
		config = function()
			require("custom.plugins.configs.toggleterm")
		end,
	},
}
