-- Diagnostic errors defined
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

require("neo-tree").setup({
    close_if_last_window = true,
    enable_diagnostics = true,
    source_selector = {
        winbar = true,
        content_layout = "center",
        tab_labels = {
            filesystem = deepvim.get_icon("FolderClosed") .. " File",
            buffers = deepvim.get_icon("DefaultFile") .. " Bufs",
            git_status = deepvim.get_icon("Git") .. " Git",
            diagnostics = deepvim.get_icon("Diagnostic") .. " Diagnostic",
        },
    },
    default_component_configs = {
        indent = { padding = 0 },
        icon = {
            folder_closed = deepvim.get_icon("FolderClosed"),
            folder_open = deepvim.get_icon("FolderOpen"),
            folder_empty = deepvim.get_icon("FolderEmpty"),
            default = deepvim.get_icon("DefaultFile"),
        },
        git_status = {
            symbols = {
                added = deepvim.get_icon("GitAdd"),
                deleted = deepvim.get_icon("GitDelete"),
                modified = deepvim.get_icon("GitChange"),
                renamed = deepvim.get_icon("GitRenamed"),
                untracked = deepvim.get_icon("GitUntracked"),
                ignored = deepvim.get_icon("GitIgnored"),
                unstaged = deepvim.get_icon("GitUnstaged"),
                staged = deepvim.get_icon("GitStaged"),
                conflict = deepvim.get_icon("GitConflict"),
            },
        },
    },
    filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_current",
        use_libuv_file_watcher = true,
        window = { mappings = { h = "toggle_hidden" } },
    },
    window = {
        width = "40",
        mappings = {
            -- remove mappings
            ["w"] = "none",
            ["S"] = "none",
            ["s"] = "none",
            [">"] = "none",
            ["<"] = "none",

            -- add new mappings
            ["<C-s>"] = "open_split",
            ["<C-v>"] = "open_vsplit",
            ["<C-t>"] = "open_tabnew",
            ["o"] = "open_with_window_picker",
            ["<Tab>"] = "next_source",
            ["<S-Tab>"] = "prev_source",
            ["N"] = {
                "add",
                config = {
                    show_path = "none",
                },
            },
            ["P"] = function(state)
                local node = state.tree:get_node()
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end,
        },
    },
    follow_current_file = true,
    event_handlers = {
        {
            event = "file_opened",
            handler = function(_)
                require("neo-tree").close_all()
                vim.cmd("wincmd =")
            end,
        },
        {
            event = "neo_tree_buffer_enter",
            handler = function(_)
                vim.opt_local.signcolumn = "auto"
            end,
        },
        {
            event = "neo_tree_window_before_open",
            handler = function()
                -- require("bufresize").register()
            end,
        },
        {
            event = "neo_tree_window_after_open",
            handler = function()
                vim.cmd("wincmd =")
            end,
        },
        {
            event = "neo_tree_window_after_close",
            handler = function()
                -- require("bufresize").resize()
            end,
        },
    },
})
