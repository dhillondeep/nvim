local lazy = require("custom.lazy")
local constants = lazy.require("custom.constants")

local fn, api = vim.fn, vim.api
local strwidth = api.nvim_strwidth

--- table of user created terminals
deepvim.user_terminals = {}

deepvim.path_sep = vim.startswith(vim.loop.os_uname().sysname, "Windows") and "\\" or "/"

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

---@generic T
---@param callback fun(item: T, index: number): T
---@param list T[]
---@return T[]
function deepvim.map(callback, list)
  local accum = {}
  for index, item in ipairs(list) do
    accum[index] = callback(item, index)
  end
  return accum
end

-- truncate a string based on number of display columns/cells it occupies
-- so that multibyte characters are not broken up mid character
---@param str string
---@param col_limit number
---@return string
local function truncate_by_cell(str, col_limit)
  if str and str:len() == api.nvim_strwidth(str) then return fn.strcharpart(str, 0, col_limit) end
  local short = fn.strcharpart(str, 0, col_limit)
  local width = api.nvim_strwidth(short)
  while width > 1 and width > col_limit do
    short = fn.strcharpart(short, 0, fn.strchars(short) - 1)
    width = api.nvim_strwidth(short)
  end
  return short
end

--- Truncate a name being mindful of multibyte characters and append an ellipsis
---@param name string
---@param word_limit number
---@return string
function deepvim.truncate_name(name, word_limit)
  if strwidth(name) <= word_limit then return name end
  -- truncate nicely by seeing if we can drop the extension first
  -- to make things fit if not then truncate abruptly
  local ext = fn.fnamemodify(name, ":e")
  if ext ~= "" then
    local truncated = name:gsub("%." .. ext, "", 1)
    if api.nvim_strwidth(truncated) < word_limit then return truncated .. constants.ELLIPSIS end
  end
  return truncate_by_cell(name, word_limit - 1) .. constants.ELLIPSIS
end

--- @param dir string
--- @param depth number
--- @param max_size number
function deepvim.truncate_name_by_depth(dir, depth, max_size)
  if api.nvim_strwidth(dir) <= max_size then return dir end
  -- we truncate any section of the ancestor which is too long
  -- by dividing the allotted space for each section by the depth i.e.
  -- the amount of ancestors which will be prefixed
  local allowed_size = math.floor(max_size / depth) + 1 -- Add one to account for the path separator
  local truncated = deepvim.map(
    function(part) return deepvim.truncate_name(part, allowed_size) end,
    vim.split(dir, deepvim.path_sep)
  )
  return table.concat(truncated, deepvim.path_sep)
end
