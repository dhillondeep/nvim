local M = {}

-- add this table only when you want to disable default keys
M.disabled = {
  t = {
    ["<A-i>"] = "",         -- toggle floating term: replaced mapping (custom)
    ["<A-h>"] = "",         -- toggle horizontal term: replaced mapping (custom)
    ["<A-v>"] = "",         -- toggle vertical term: replaced mapping (custom)
  },

  n = {
    -- general
    ["<C-s>"] = "",         -- save file: replaced mapping (custom)
    ["<C-c>"] = "",         -- copy whole file: replaced mapping (vim-system-copy)
    ["<leader>n"] = "",     -- toggle line number: not needed
    ["<leader>rn"] = "",    -- toggle relative line number: not needed
    ["<leader>tt"] = "",    -- toggle theme: not needed
    ["<leader>b"] = "",     -- new buffer: not needed

    -- telescope
    ["<leader>ff"] = "",    -- find files: replaced mapping (custom)
    ["<leader>fa"] = "",    -- find all: replaced mapping (custom)
    ["<leader>fb"] = "",    -- find buffers: replaced mapping (custom)
    ["<leader>fw"] = "",    -- live grep: replaced mapping (custom)
    ["<leader>fo"] = "",    -- find oldfiles: replaced mapping (custom)
    ["<leader>pt"] = "",    -- pick hidden term: replaced mapping (custom)

    --tabufline
    ["Bslash"] = "",        -- pick buffer: replaced mapping (custom)

    -- lspconfig
    ["gD"] = "",            -- lsp declaration: replaced mapping (lspsaga)
    ["gd"] = "",            -- lsp definition: replaced mapping (lspsaga)
    ["gi"] = "",            -- lsp implementation: replaced mapping (lspsaga)
    ["gr"] = "",            -- lsp references: replaced mapping (lspsaga)
    ["<leader>ls"] = "",    -- lsp signature_help: replaced mapping (custom)
    ["<leader>D"] = "",     -- lsp definition type: not needed
    ["<leader>ra"] = "",    -- lsp rename: replaced mapping (custom)
    ["<leader>ca"] = "",    -- lsp code_action: replaced mapping (lspsaga)
    ["<leader>f"] = "",     -- floating diagnostic: replaced mapping (custom)
    ["d]"] = "",            -- goto_next: replaced mapping (custom)
    ["<leader>q"] = "",     -- diagnostic setloclist: not needed
    ["<leader>wa"] = "",    -- add workspace folder: not needed
    ["<leader>wr"] = "",    -- romove workspace folder: not needed
    ["<leader>wl"] = "",    -- list workspace folder: not needed

    -- nvterm
    ["<A-i>"] = "",         -- toggle floating term: replaced mapping (custom)
    ["<A-h>"] = "",         -- toggle horizontal term: replaced mapping (custom)
    ["<A-v>"] = "",         -- toggle vertical term: replaced mapping (custom)
    ["<leader>h"] = "",     -- new horizontal term: replaced mapping (custom)
    ["<leader>v"] = "",     -- new vertical term: replaced mapping (custom)

    -- nvimtree
    ["<C-n>"] = "",         -- toggle nvimtree
    ["<leader>e"] = "",     -- focus nvimtree

    -- gitsigns
    ["]c"] = "",            -- jump to next hunk: replaced mapping (custom)
    ["[c"] = "",            -- jump to previous hunk: replaced mapping (custom)
    ["<leader>rh"] = "",    -- reset hunk: not needed
    ["<leader>ph"] = "",    -- preview hunk: replaced mapping (custom)
    ["<leader>td"] = "",    -- toggle deleted: replaced mapping (custom)
 }
}

M.general = {
  n = {
    -- mappings related to saving and closing files
    ["<leader>w"] = { "<cmd> w <CR>", "save file" },
    ["<leader>aw"] = { "<cmd> w <CR>", "save all files" },
    ["<leader>aq"] = { "<cmd> q <CR>", "close all file" },
    ["<leader>q"] = { "<cmd> q <CR>", "close file" },

    -- mappings related to line movements
    ["<leader>k"] = { "<cmd> m-2 <CR>", "move current line up"},
    ["<leader>j"] = { "<cmd> m+ <CR>", "move current line down"},

    -- path related
    ["<leader>pwd"] = { "<cmd> pwd <CR>", "print current working directory"},

    -- sizing and zoom
    ["<C-f>"] = { "<cmd> lua MiniMisc.zoom() <CR>", "toggle zoom" },

    -- toggle wrap
    ["<leader>tw"] = { "<cmd> set wrap! <CR>", "toggle wrap" },
  },

  v = {
    -- mappings related to saving and closing files
    ["<leader>w"] = { "<cmd> w <CR>", "save file" },
    ["<leader>aw"] = { "<cmd> w <CR>", "save all files" },
    ["<leader>aq"] = { "<cmd> q <CR>", "close all file" },
    ["<leader>q"] = { "<cmd> q <CR>", "close file" },

    -- mappings related to line movements
    ["<leader>k"] = { "<cmd> m'<-2<CR>gv=gv", "move current line up"},
    ["<leader>j"] = { "<cmd> m'>+<CR>gv=gv", "move current line down"},
  },
}

M.neotree = {
  n = {
    ["<C-n>"] = { "<cmd> NeoTreeRevealToggle <CR>", "toggle neotree" },
    ["<C-m>"] = { "<cmd> NeoTreeFocus <CR>", "focus neotree" },
    ["<C-s>"] = { "<cmd> NeoTreeShow <CR>", "show neotree" },
  }
}

M.trailspace = {
  n = {
    ["<leader>ts"] = { "<cmd> lua MiniTrailspace.trim() <CR>", "trim all whitespace"},
  },
}

M.telescope = {
  n = {
    ["<leader>fo"] = { "<cmd> Telescope frecency <CR>", "files history" },
    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },
  }
}

M.fzflua = {
  n = {
    ["<leader>fw"] = { "<cmd> FzfLua live_grep_native <CR>", "live grep (find word)" },
    ["<leader>ff"] = { "<cmd> FzfLua files <CR>", "find files" },
    ["<leader>fb"] = { "<cmd> FzfLua buffers <CR>", "find buffers" },
    ["<leader>fr"] = { "<cmd> FzfLua resume <CR>", "resume last command" },
    ["<leader>/"] = { "<cmd> FzfLua lines <CR>", "find lines in all buffers" },
    ["/"] = { "<cmd> FzfLua blines <CR>", "find lines in buffer" },
  }
}

M.lspconfig = {
  n = {
    ["<leader>sl"] = {
      function ()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help"
    },
    ["<leader>rn"] = {
      function ()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename"
    },
    ["<leader>ds"] = {
      function ()
        vim.diagnostic.open_float()
      end,
      "lsp floating diagnostic"
    },
    ["[d"] = {
      function()
        vim.diagnostic.goto_prev()
      end,
      "goto prev",
    },
    ["]d"] = {
      function()
        vim.diagnostic.goto_next()
      end,
      "goto next",
    },
  }
}

M.nvterm = {
  t = {
    ["<leader>ttf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>tts"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<leader>ttv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },

    ["<C-h>"] = { "<C-\\><C-n><C-w>h", "move left"},
    ["<C-l>"] = { "<C-\\><C-n><C-w>l", "move right"},
    ["<C-j>"] = { "<C-\\><C-n><C-w>j", "move down"},
    ["<C-k>"] = { "<C-\\><C-n><C-w>k", "move up"},
    ["<leader><esc>"] = { "<C-\\><C-n>", "change to normal mode"},

    ["<C-f>"] = { "<C-\\><C-n>:lua MiniMisc.zoom() <CR> i", "toggle zoom"},
  },

  n = {
    ["<leader>ttf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>tts"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
      end,
      "toggle horizontal term",
    },
    ["<leader>ttv"] = {
      function()
        require("nvterm.terminal").toggle "vertical"
      end,
      "toggle vertical term",
    },
    ["<leader>tnh"] = {
      function()
        require("nvterm.terminal").new "horizontal"
      end,
      "new horizontal term",
    },
    ["<leader>tnv"] = {
      function()
        require("nvterm.terminal").new "vertical"
      end,
      "new vertical term",
    },
  }
}

M.gitsigns = {
  n = {
    ["]gh"] = {
      function()
        if vim.wo.diff then
          return "]gh"
        end
        vim.schedule(function()
          require("gitsigns").next_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to next hunk",
      opts = { expr = true },
    },
    ["[gh"] = {
      function()
        if vim.wo.diff then
          return "[gh"
        end
        vim.schedule(function()
          require("gitsigns").prev_hunk()
        end)
        return "<Ignore>"
      end,
      "Jump to prev hunk",
      opts = { expr = true },
    },
    ["<leader>gph"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "Preview hunk",
    },
    ["<leader>gtd"] = {
      function()
        require("gitsigns").toggle_deleted()
      end,
      "Toggle deleted",
    },
  }
}

M.lspconfig = {
  n = {
    ["<leader>sl"] = {
      function ()
        vim.lsp.buf.signature_help()
      end,
      "lsp signature_help"
    },
    ["<leader>rn"] = {
      function ()
        require("nvchad_ui.renamer").open()
      end,
      "lsp rename"
    },
    ["<leader>ds"] = {
      function ()
        vim.diagnostic.open_float()
      end,
      "lsp floating diagnostic"
    }
  }
}

M.lspsaga = {
  n = {
    ["gf"] = { "<cmd> Lspsaga lsp_finder<CR>", "lsp finder"},
    ["gd"] = { "<cmd> Lspsaga peek_definition<CR>", "lsp peek definition"},
    ["<leader>ca"] = { "<cmd> Lspsaga code_action<CR>", "lsp code action"},
    ["<leader>o"] = { "<cmd> LSoutlineToggle<CR>", "lsp toggle outline"},
  }
}

return M
