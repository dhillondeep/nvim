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

    ["<Tab>"] = { "<cmd>tabnext<cr>", "Go to next Tab" },
    ["<S-Tab>"] = { "<cmd>tabprev<cr>", "Go to previous Tab" },
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
    ["<leader>tl"] = {
      function()
        deepvim.fn.toggle_term("lazygit")
      end,
      "ToggleTerm lazygit",
    },
    ["<leader>tv"] = {
      function()
        deepvim.fn.toggle_term({direction="vertical"})
      end,
      "ToggleTerm vertical",
    },
    ["<leader>tcv"] = {
      function()
        deepvim.fn.close_term({direction="vertical"})
      end,
      "ToggleTerm close vertical",
    },
    ["<leader>th"] = {
      function()
        deepvim.fn.toggle_term({direction="horizontal"})
      end,
      "ToggleTerm horizontal",
    },
    ["<leader>tch"] = {
      function()
        deepvim.fn.close_term({direction="horizontal"})
      end,
      "ToggleTerm close horizontal",
    },
    ["<leader>tf"] = {
      function()
        deepvim.fn.toggle_term({direction="float"})
      end,
      "ToggleTerm float",
    },
    ["<leader>tcf"] = {
      function()
        deepvim.fn.close_term({direction="float"})
      end,
      "ToggleTerm close float",
    },
    ["<leader>tca"] = {
      function()
        deepvim.fn.close_all_terms()
      end,
      "ToggleTerm close all",
    },
  },
}

-- Gitstatus
M.gitstatus = {
  n = {
    ["[g"] = {
      function()
        require("gitsigns").prev_hunk()
      end,
      "Prev git hunk",
    },
    ["]g"] = {
      function()
        require("gitsigns").next_hunk()
      end,
      "Next git hunk",
    },
    ["<leader>gl"] = {
      function()
        require("gitsigns").blame_line()
      end,
      "View git blame",
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview git blame",
    },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "Reset git blame",
    },
    ["<leader>gd"] = {
      function()
        require("gitsigns").diffthis()
      end,
      "View git diff",
    },
  },
}

-- FZF Lua
M.fzflua = {
  n = {
    ["<leader>fz"] = { "<cmd> FzfLua live_grep_native <CR>", "Live grep (find word)" },
    ["<leader>fl"] = { "<cmd> FzfLua blines <CR>", "Find lines in buffer" },
    ["<leader>fL"] = { "<cmd> FzfLua lines <CR>", "Find lines in all buffers" },
    ["<leader>fR"] = { "<cmd> FzfLua resume <CR>", "Resume last fzf-lua command" },
  },
}

-- Telescope
M.telescope = {
  n = {
    ["<leader>fw"] = {
      function()
        require("telescope").extensions.live_grep_args.live_grep_args()
      end,
      "Live grep (find word)",
    },
    ["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>fb"] = {
      function()
        require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true })
      end,
      "Find buffers",
    },
    ["<leader>fm"] = { "<cmd> Telescope marks<cr>", "Find marks" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles<cr>", "Find old files" },
    ["<leader>fp"] = {
      function()
        require("telescope").extensions.projects.projects()
      end,
      "find projects",
    },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "Resume last telescope command" },

    ["<leader>gt"] = { "<cmd> Telescope git_status <cr>", "Git status" },
    ["<leader>gb"] = { "<cmd> Telescope git_branches <cr>", "Git branches" },
    ["<leader>gc"] = { "<cmd> Telescope git_commits <cr>", "Git commits" },

    ["<leader>sh"] = { "<cmd> Telescope harpoon marks <CR>", "Search harpoon marks" },
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
    ["~"] = {
      function()
        require("smart-splits").start_resize_mode()
      end,
      "Start Resize mode",
    },
  },
}

M.autopairs = {
  n = {
    ["<leader>ua"] = {
      function()
        deepvim.fn.toggle_autopairs()
      end,
      "Toggle autopairs",
    },
  },
}

M.lspsaga = {
  n = {
    ["gf"] = { "<cmd> Lspsaga lsp_finder<CR>", "lsp finder" },
    ["gp"] = { "<cmd> Lspsaga peek_definition<CR>", "lsp peek definition" },
    ["K"] = { "<cmd> Lspsaga hover_doc<CR>", "lsp hover doc" },
    ["<leader>la"] = { "<cmd> Lspsaga code_action<CR>", "lsp code action" },
    ["[d"] = { "<cmd> Lspsaga diagnostic_jump_prev<CR>", "lsp diagnostic jump prev" },
    ["]d"] = { "<cmd> Lspsaga diagnostic_jump_next<CR>", "lsp diagnostic jump next" },
    ["[E"] = {
      function()
        require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      "lsp diagnostic jump prev",
    },
    ["]E"] = {
      function()
        require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      "lsp diagnostic jump prev",
    },
  },
}

M.lspconfig = {
  plugin = true,

  n = {
    ["gr"] = {
      function()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename",
    },

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
      "<cmd>Format<cr>",
      "lsp formatting",
    },
  },
}

M.harpoon = {
  ["n"] = {
    ["<leader>mf"] = {
      function()
        require("harpoon.mark").add_file()
      end,
    },
  },
}

return M
