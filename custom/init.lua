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

-- close NvimTree if it is the last buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*" },
	nested = true,
	callback = function()
		if vim.fn.winnr "$" == 1 and vim.fn.bufname() == "NvimTree_" .. vim.fn.tabpagenr() then
			vim.api.nvim_command ":silent qa!"
		end
	end,
})

-- dont list terminal buffers
vim.api.nvim_create_autocmd("BufType", {
  pattern = "terminal",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})
