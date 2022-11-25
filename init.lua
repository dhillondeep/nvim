--- Set vim options with a nested table like API with the format vim.<first_key>.<second_key>.<value>
for scope, table in pairs(deepvim.vim_opts) do
  for setting, value in pairs(table) do
    vim[scope][setting] = value
  end
end

--- Dim inactive window
if deepvim.opts.dim_inactive_windows then
  local colors = require("base46").get_theme_tb("base_30")
  vim.api.nvim_set_hl(0, "InactiveWindow", {
    bg = colors.statusline_bg,
  })

  vim.api.nvim_create_autocmd("WinEnter", {
    pattern = "*",
    callback = function()
      vim.cmd([[
      setlocal winhighlight=Normal:Normal,NormalNC:InactiveWindow
    ]] )
    end,
    desc = "Dim inactive window",
  })
end

--- Disable comment-continuation
vim.cmd([[
  autocmd FileType * set formatoptions-=cro
]])

--- Start from the same line when left
vim.cmd([[
  if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  endif
  " when editing a file, always jump to the last known cursor position.
	" don't do it when the position is invalid or when inside an event handler
	autocmd BufReadPost *
		\ if &ft !~# 'commit' && ! &diff &&
		\      line("'\"") >= 1 && line("'\"") <= line("$")
		\|   execute 'normal! g`"zvzz'
		\| endif
]])

--- Highlight yanks
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]])

--- Automatically set read-only for files being edited elsewhere
vim.cmd([[
  " automatically set read-only for files being edited elsewhere
	autocmd SwapExists * nested let v:swapchoice = 'o'
]])
