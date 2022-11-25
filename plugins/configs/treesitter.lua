local opts = deepvim.opts.treesitter

return {
    override_options = {
      ensure_installed = opts.languages,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      rainbow = {
        enable = true,
        disable = opts.rainbow_disable,
        extended_mode = false,
        max_file_lines = nil,
      },
      autotag = { enable = true },
      incremental_selection = { enable = true },
      indent = { enable = false },
    }
  }
