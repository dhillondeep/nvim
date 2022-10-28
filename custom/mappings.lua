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

    -- Telescope
    ["<leader>fw"] = "",    -- live grep: replaced mapping (custom)

    --tabufline
    ["Bslash"] = "",        -- pick buffer: replaced mapping (custom)

    -- lspconfig
    ["gD"] = "",            -- lsp declaration: replaced mapping (lspsaga)
    ["gd"] = "",            -- lsp definition: replaced mapping (lspsaga)
    ["gi"] = "",            -- lsp implementation: replaced mapping (lspsaga)
    ["<leader>ls"] = "",    -- lsp signature_help: replaced mapping (custom)
    ["<leader>D"] = "",     -- lsp definition type: not needed
    ["<leader>ra"] = "",    -- lsp rename: replaced mapping (custom)
    ["<leader>ca"] = "",    -- lsp code_action: replaced mapping (lspsaga)
    ["<leader>gr"] = "",    -- lsp references: replaced mapping (lspsaga)
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
  }
}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>fp"] = { "<cmd> Telescope live_grep grep_open_files=true <CR>", "find find in open files" },
    ["<leader>fl"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "fuzzy find in buffer" },
    ["<leader>fz"] = { "<cmd> Telescope grep_string <CR>", "live fuzzy find" },
    ["<leader>fr"] = { "<cmd> Telescope resume <CR>", "resume last picker" },
  }
}

M.tabufline = {
  n = {
    ["<leader>bp"] = { "<cmd> TbufPick <CR>", "Pick buffer" },
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
      "goto_next",
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
    ["<leader>tth"] = {
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
  },

  n = {
    ["<leader>ttf"] = {
      function()
        require("nvterm.terminal").toggle "float"
      end,
      "toggle floating term",
    },
    ["<leader>tth"] = {
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


-- M.windows = {
--   n = {
--     ["<C-w>z"] = { "<cmd> WindowsMaximize <CR>", "maximize window"},
--     ["<C-w>_"] = { "<cmd> WindowsMaximizeVertically <CR>", "maximize window vertically"},
--     ["<C-w>|"] = { "<cmd> WindowsMaximizeHorizontally <CR>", "maximize window horizontally"},
--     ["<C-w>="] = { "<cmd> WindowsEqualize <CR>", "equalize windows"},
--   }
-- }

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
