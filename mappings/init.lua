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
  }
}


-- NeoTree
M.neotree = {
  n = {
    ["<leader>n"] = { "<cmd>Neotree toggle<cr>", "Toggle Explorer" },
    ["<leader>o"] = { "<cmd>Neotree focus<cr>", "Focus Explorer" },
  }
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
    ["<leader>tl"] = { "<cmd>lua deepvim.toggle_term_cmd('lazygit')<cr>", "ToggleTerm lazygit"},
    ["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm float"},
    ["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split"},
    ["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "ToggleTerm vertical split"},
  }
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
  }
}

return M
