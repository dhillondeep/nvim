require("lspsaga").init_lsp_saga({
  code_action_keys = {
    quit = '<esc>',
    exec = '<CR>',
  },
  finder_action_keys = {
    open = '<CR>',
    vsplit = '<C-v>',
    split = '<C-s>',
    tabe = '<C-t>',
    quit = '<esc>',
  },
  definition_action_keys = {
    edit = '<CR>',
    vsplit = '<C-v>',
    split = '<C-s>',
    tabe = '<C-t>',
    quit = '<esc>',
  },
  rename_action_quit = '<esc>',
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = false,
    cache_code_action = true,
    sign = false,
    update_time = 150,
    sign_priority = 20,
    virtual_text = false,
  },
})
