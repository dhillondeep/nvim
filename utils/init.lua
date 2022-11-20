--- table of user created terminals
deepvim.user_terminals = {}

--- Initialize icons used throughout the user interface
--- Credit: Astrovim (https://github.com/AstroNvim/AstroNvim)
function deepvim.initialize_icons()
  deepvim.icons = require("custom.icons.nerd_font")
end

--- Get an icon if it is available and return it
--- Credit: Astrovim (https://github.com/AstroNvim/AstroNvim)
function deepvim.get_icon(kind)
  if not deepvim.icons then
    deepvim.initialize_icons()
  end
  return deepvim.icons[kind] or ""
end

-- Get string form of a lua table
function deepvim.dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k,v in pairs(o) do
      if type(k) ~= 'number' then k = '"'..k..'"' end
      s = s .. '['..k..'] = ' .. deepvim.dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

-- term_details can be either a string for just a command or
-- a complete table to provide full access to configuration when calling Terminal:new()

--- Toggle a user terminal if it exists, if not then create a new one and save it
-- @param term_details a terminal command string or a table of options for Terminal:new() (Check toggleterm.nvim documentation for table format)
--- Credit: Astrovim (https://github.com/AstroNvim/AstroNvim)
function deepvim.toggle_term_cmd(opts)
  local terms = deepvim.user_terminals
  -- if a command string is provided, create a basic table for Terminal:new() options
  if type(opts) == "string" then opts = { cmd = opts, hidden = true } end
  local num = vim.v.count > 0 and vim.v.count or 1
  -- if terminal doesn't exist yet, create it
  if not terms[opts.cmd] then terms[opts.cmd] = {} end
  if not terms[opts.cmd][num] then
    if not opts.count then opts.count = vim.tbl_count(terms) * 100 + num end
    terms[opts.cmd][num] = require("toggleterm.terminal").Terminal:new(opts)
  end
  -- toggle the terminal
  deepvim.user_terminals[opts.cmd][num]:toggle()
end
