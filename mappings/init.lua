local M = {}

-- disabled mappings defined by Nvchad
M.disabled = require("custom.mappings.disabled")

-- General
M.general = {
  n = {
    ["<leader>w"] = { "<cmd>w<cr>", "Save file" },
    ["<leader>wa"] = { "<cmd>wa<cr>", "Save all files" },
    ["<leader>q"] = { "<cmd>q<cr>", "Close file" },
    ["<leader>qa"] = { "<cmd>q<cr>", "Close all files" },
    ["<C-s>"] = { "<cmd>w!<cr>", "Force write" },
    ["<C-q>"] = { "<cmd>q!<cr>", "Force quit" },
  },
}

M.packer = {
  n = {
    ["<leader>pc"] = { "<cmd>PackerCompile<cr>", "Packer Compile" },
    ["<leader>pi"] = { "<cmd>PackerInstall<cr>", "Packer Install" },
    ["<leader>ps"] = { "<cmd>PackerSync<cr>", "Packer Sync" },
    ["<leader>pS"] = { "<cmd>PackerStatus<cr>", "Packer Status" },
    ["<leader>pu"] = { "<cmd>PackerUpdate<cr>", "Packer Update" },
  },
}

-- NeoTree
M.neotree = {
  n = {
    ["<leader>n"] = { "<cmd>Neotree toggle<cr>", "Toggle explorer" },
    ["<leader>o"] = { "<cmd>Neotree focus<cr>", "Focus explorer" },
  },
}

-- Toggleterm
M.toggleterm = {
  t = {
    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "ToggleTerm move left" },
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "ToggleTerm move right" },
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "ToggleTerm move down" },
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "ToggleTerm move up" },
    ["<leader><esc>"] = { "<C-\\><C-n>", "Toggleterm change to normal mode" },
  },

  n = {
    ["<leader>tl"] = { "<cmd>lua deepvim.toggle_term_cmd('lazygit')<cr>", "ToggleTerm lazygit" },
    ["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm float" },
    ["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split" },
    ["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "ToggleTerm vertical split" },
  },
}

-- Gitstatus
M.gitstatus = {
  n = {
    ["[g"] = { "<cmd>lua require('gitsigns').prev_hunk()<cr>", "Prev git hunk" },
    ["]g"] = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Next git hunk" },
    ["<leader>gl"] = { "<cmd>lua require('gitsigns').blame_line()<cr>", "View git blame" },
    ["<leader>gp"] = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview git blame" },
    ["<leader>gr"] = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset git blame" },
    ["<leader>gd"] = { "<cmd>lua require('gitsigns').diffthis()<cr>", "View git diff" },
  },
}

-- FZF Lua
M.fzflua = {
  n = {
    ["<leader>fW"] = { "<cmd> FzfLua live_grep_native <CR>", "Live grep (find word)" },
    ["<leader>fl"] = { "<cmd> FzfLua blines <CR>", "Find lines in buffer" },
    ["<leader>fL"] = { "<cmd> FzfLua lines <CR>", "Find lines in all buffers" },
    ["<leader>fR"] = { "<cmd> FzfLua resume <CR>", "Resume last fzf-lua command" },
  },
}

-- Telescope
M.telescope = {
  n = {
    ["<leader>fw"] = {
      "<cmd> lua require('telescope').extensions.live_grep_args.live_grep_args() <CR>",
      "Live grep (find word)",
    },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fb"] = {
      "<cmd> lua require('telescope.builtin').buffers({sort_mru=true, ignore_current_buffer=true}) <CR>",
      "Find buffers",
    },
    ["<leader>fm"] = { "<cmd> Telescope marks<cr>", "Find marks" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles<cr>", "Find old files" },
    ["<leader>fp"] = { "<cmd> lua require('telescope').extensions.projects.projects() <CR>", "Find projects" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "Resume last telescope command" },

    ["<leader>gt"] = { "<cmd> Telescope git_status <cr>", "Git status" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <cr>", "Git branches" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <cr>", "Git commits" },

    ["<leader>sh"] = { "<cmd> Telescope help_tags <cr>", "Search help" },
    ["<leader>sm"] = { "<cmd> Telescope man_pages <cr>", "Search man" },
    ["<leader>sk"] = { "<cmd> Telescope keymaps <cr>", "Search keymaps" },
    ["<leader>sc"] = { "<cmd> Telescope commands <cr>", "Search commands" },

    ["<leader>lR"] = { "<cmd> Telescope lsp_references <cr>", "Search references" },
    ["<leader>lD"] = { "<cmd> Telescope diagnostics <cr>", "Search diagnostics" },
    ["<leader>lG"] = { "<cmd> Telescope lsp_workspace_symbols <cr>", "Search workspace symbols" },
  },
}

M.smart_splits = {
  n = {
    ["<S-h>"] = { "<cmd> lua require('smart-splits').resize_left() <cr>", "Resize window left" },
    ["<S-l>"] = { "<cmd> lua require('smart-splits').resize_right() <cr>", "Resize window right" },
    ["<S-k>"] = { "<cmd> lua require('smart-splits').resize_up() <cr>", "Resize window up" },
    ["<S-j>"] = { "<cmd> lua require('smart-splits').resize_down() <cr>", "Resize window down" },
  },
}

M.autopairs = {
  n = {
    ["<leader>ua"] = { "<cmd> lua deepvim.toggle_autopairs() <cr>", "Toggle autopairs" },
  },
}

M.lspsaga = {
  n = {
    ["gf"] = { "<cmd> Lspsaga lsp_finder<CR>", "lsp finder" },
    ["gr"] = { "<cmd> Lspsaga rename<CR>", "lsp rename" },
    ["[d"] = { "<cmd> Lspsaga diagnostic_jump_prev<CR>", "lsp diagnostic jump prev" },
    ["d]"] = { "<cmd> Lspsaga diagnostic_jump_nexct<CR>", "lsp diagnostic jump next" },
    ["<leader>la"] = { "<cmd> Lspsaga code_action<CR>", "lsp code action" },
    ["[E"] = {
      "<cmd> lua require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR})<CR>",
      "lsp diagnostic jump prev",
    },
    ["E]"] = {
      "<cmd> lua require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR})<CR>",
      "lsp diagnostic jump prev",
    },
    ["<leader>e"] = { "<cmd> LSoutlineToggle<CR>", "lsp toggle outline" },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["gD"] = {
      function()
        vim.lsp.buf.declaration()
      end,
      "lsp declaration",
    },

    ["<leader>gT"] = {
      function()
        vim.lsp.buf.type_definition()
      end,
      "lsp definition type",
    },

    ["gd"] = {
      function()
        vim.lsp.buf.definition()
      end,
      "lsp definition",
    },

    ["K"] = {
      function()
        vim.lsp.buf.hover()
      end,
      "lsp hover",
    },
    ["gI"] = {
      function()
        vim.lsp.buf.implementation()
      end,
      "lsp implementation",
    },
    ["<leader>ls"] = {
      function()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help",
    },

    ["<leader>ld"] = {
      function()
        vim.diagnostic.open_float()
      end,
      "floating diagnostic",
    },

    ["<leader>lf"] = {
      function()
        vim.lsp.buf.format({ async = true })
      end,
      "lsp formatting",
    },
  },
}

return M
