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
    ["<leader>fw"] = { "<cmd> FzfLua live_grep_native <CR>", "Live grep (find word)" },
    ["<leader>ff"] = { "<cmd> FzfLua files <CR>", "Find files" },
    ["<leader>fb"] = { "<cmd> FzfLua buffers <CR>", "Find buffers" },
    ["<leader>fr"] = { "<cmd> FzfLua resume <CR>", "Resume last command" },
    ["<leader>fl"] = { "<cmd> FzfLua blines <CR>", "Find lines in buffer" },
    ["<leader>fL"] = { "<cmd> FzfLua lines <CR>", "Find lines in all buffers" },

    ["<leader>lG"] = { "<cmd> FzfLua lsp_workspace_symbols <cr>", "Search workspace symbols" },
  },
}

M.telescope = {
  n = {
    ["<leader>fm"] = { "<cmd> Telescope marks<cr>", "Find marks" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles<cr>", "Find old files" },

    ["<leader>gt"] = { "<cmd> Telescope git_status <cr>", "Git status" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <cr>", "Git branches" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <cr>", "Git commits" },

    ["<leader>sh"] = { "<cmd> Telescope help_tags <cr>", "Search help" },
    ["<leader>sm"] = { "<cmd> Telescope man_pages <cr>", "Search man" },
    ["<leader>sk"] = { "<cmd> Telescope keymaps <cr>", "Search keymaps" },
    ["<leader>sc"] = { "<cmd> Telescope commands <cr>", "Search commands" },

    ["<leader>lR"] = { "<cmd> Telescope lsp_references <cr>", "Search references" },
    ["<leader>lD"] = { "<cmd> Telescope diagnostics <cr>", "Search diagnostics" },
  },
}

return M
