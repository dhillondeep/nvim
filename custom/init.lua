-- disable system clipboard yank
vim.opt.clipboard = ""

-- set nowrap as default
vim.opt.wrap = false

-- set relative numbers by default
vim.opt.rnu = true

-- start from the same line when left
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
]])

-- highlight yanks
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]])

-- dont list terminal buffers
vim.api.nvim_create_autocmd("BufType", {
  pattern = "terminal",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
