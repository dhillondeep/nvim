-- General
vim.opt.mouse = "nv" -- enable mouse in normal and visual mode
vim.opt.virtualedit = "block" -- position cursor anywhere in visual block
vim.opt.viewoptions:append { "slash", "unix" } -- what to save for view
vim.opt.formatoptions:append { "1" } -- don't break lines after a one-letter word
-- disable comment-continuation
vim.cmd([[
  autocmd FileType * set formatoptions-=cro
]])

-- Timings
vim.opt.timeoutlen = 500 -- time out on mappings
vim.opt.ttimeoutlen = 10 -- time out on key codes
vim.opt.updatetime = 200 -- idle time to write swap and trigger CursorHold
vim.opt.redrawtime = 1500 -- time in milliseconds for stopping display redraw

-- Behavior
vim.opt.wrap = false -- disable wrap by default
vim.opt.linebreak = true -- break long lines at 'breakat'
vim.opt.breakindent = true -- visually indented wrapped lines
vim.opt.splitbelow = true -- splits opens bottom
vim.opt.splitright = true -- splits opens right
vim.opt.switchbuf = { "useopen", "vsplit" }
vim.opt.completeopt = { "menu", "menuone", "preview", "noselect", "noinsert" }
vim.opt.clipboard = "" -- disable system clipboard for yank

-- Editor UI
vim.opt.lazyredraw = true -- don't redraw while executing macros (good performance config)
vim.opt.rnu = true -- set relative numbers by default
vim.opt.scrolloff = 2 -- keep at least 2 lines above/below
vim.opt.sidescrolloff = 5 -- keep at least 5 lines left/right
vim.opt.winminwidth = 10 -- minimum width for inactive windows
vim.opt.winminheight = 1 -- minimum height for inactive window
vim.opt.pumheight = 15 -- pop-up menu's line height
vim.opt.helpheight = 12 -- minimum help window height
vim.opt.previewheight = 12 -- completion preview height

-- start from the same line when left
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

-- automatically set read-only for files being edited elsewhere
vim.cmd([[
  " automatically set read-only for files being edited elsewhere
	autocmd SwapExists * nested let v:swapchoice = 'o'
]])

-- highlight yanks
vim.cmd([[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup END
]])

-- set cursorline
vim.cmd([[
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
  augroup END

  augroup ilikecursorline
      autocmd VimEnter * :highlight CursorLine guibg=#2C323C
   augroup END
]])
