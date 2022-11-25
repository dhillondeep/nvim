local utils = deepvim.utils
local g = deepvim.g

local fn = {}

--- Credit: https://github.com/AstroNvim/AstroNvim
--- Function to toggle autopairs
function fn.toggle_autopairs()
	local ok, autopairs = pcall(require, "nvim-autopairs")
	if ok then
		if autopairs.state.disabled then
			autopairs.enable()
		else
			autopairs.disable()
		end
		deepvim.opts.autopairs_enabled = autopairs.state.disabled
		fn.ui_notify(string.format("autopairs %s", utils.bool2str(not autopairs.state.disabled)))
	else
		fn.ui_notify("autopairs not available")
	end
end

--- Credit: https://github.com/AstroNvim/AstroNvim
--- Toggle a user terminal if it exists, if not then create a new one and save it
function fn.toggle_term_cmd(opts)
	local terms = g.user_terminals

	-- if a command string is provided, create a basic table for Terminal:new() options
	if type(opts) == "string" then
		opts = { cmd = opts, hidden = true }
	end
	local num = vim.v.count > 0 and vim.v.count or 1
	-- if terminal doesn't exist yet, create it
	if not terms[opts.cmd] then
		terms[opts.cmd] = {}
	end
	if not terms[opts.cmd][num] then
		if not opts.count then
			opts.count = vim.tbl_count(terms) * 100 + num
		end
		terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
	end

	-- toggle the terminal
	g.user_terminals[opts.cmd][num]:toggle()
end

function fn.set_notify()
	-- set notify in case it is not set (only if it exists)
	local present, notify = pcall(require, "notify")
	if present then
		vim.notify = notify
	end
end

--- Serve a notification with a title of AstroNvim
-- @param msg the notification body
-- @param type the type of the notification (:help vim.log.levels)
-- @param opts table of nvim-notify options to use (:help notify-options)
function fn.notify(msg, type, opts)
	fn.set_notify()
	vim.schedule(function()
		vim.notify(msg, type, utils.default_tbl(opts, { title = "DeepNvim" }))
	end)
end

--- Sends string notification
function fn.ui_notify(str)
	if deepvim.opts.ui_notifications_enabled then
		fn.notify(str)
	end
end

deepvim.fn = fn
