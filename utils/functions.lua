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

local function create_term_opts(opts)
	if type(opts) == "string" then
		opts = { cmd = opts }
	elseif opts == nil then
		opts = {}
	end
	opts.hidden = true

	return opts
end

function fn.close_all_terms()
	local terms = g.user_terminals

	for k, _ in pairs(terms) do
		for n, _ in pairs(terms[k]) do
			local term = terms[k][n]
			term:shutdown()
		end
	end

	g.user_terminals = {}
end

function fn.close_term(opts)
	local terms = g.user_terminals

	local num = vim.v.count > 0 and vim.v.count or 1
	opts = create_term_opts(opts)

	local key = deepvim.utils.dump(opts)
	if terms[key] ~= nil and terms[key][num] ~= nil then
		local term = terms[key][num]
		term:shutdown()
		table.remove(terms[key], num)
	end
end

function fn.toggle_term(opts)
	local terms = g.user_terminals

	local num = vim.v.count > 0 and vim.v.count or 1
	opts = create_term_opts(opts)

	local key = deepvim.utils.dump(opts)
	if not terms[key] then
		terms[key] = {}
	end
	if not terms[key][num] then
		if opts.count == nil or opts.count <= 0 then
			opts.count = vim.tbl_count(terms) * 100 + num
		end
		terms[key][num] = require("toggleterm.terminal").Terminal:new(opts)
	end
	terms[key][num]:toggle()
end

--- Serve a notification with a title of AstroNvim
-- @param msg the notification body
-- @param type the type of the notification (:help vim.log.levels)
-- @param opts table of nvim-notify options to use (:help notify-options)
function fn.notify(msg, type, opts)
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
