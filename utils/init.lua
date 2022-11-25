local constants = deepvim.constants
local fn, api = vim.fn, vim.api
local strwidth = api.nvim_strwidth

local utils = {}
local g = {
  user_terminals = {},
  on_file_open = { "BufRead", "BufWinEnter", "BufNewFile" },
}

--- Credit: https://github.com/AstroNvim/AstroNvim
--- Initialize icons used throughout the user interface
local function initialize_icons()
  g.icons = require("custom.icons.nerd_font")
end

--- Credit: https://github.com/AstroNvim/AstroNvim
--- Get an icon if it is available and return it
function utils.get_icon(kind)
  if not g.icons then
    initialize_icons()
  end
  return g.icons[kind] or ""
end

--- Get string form of a lua table
function utils.dump(o)
  if type(o) == "table" then
    local s = "{ "
    for k, v in pairs(o) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. utils.dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(o)
  end
end

---@generic T
---@param callback fun(item: T, index: number): T
---@param list T[]
---@return T[]
function utils.map(callback, list)
  local accum = {}
  for index, item in ipairs(list) do
    accum[index] = callback(item, index)
  end
  return accum
end

--- truncate a string based on number of display columns/cells it occupies
--- so that multibyte characters are not broken up mid character
---@param str string
---@param col_limit number
---@return string
local function truncate_by_cell(str, col_limit)
  if str and str:len() == api.nvim_strwidth(str) then
    return fn.strcharpart(str, 0, col_limit)
  end
  local short = fn.strcharpart(str, 0, col_limit)
  local width = api.nvim_strwidth(short)
  while width > 1 and width > col_limit do
    short = fn.strcharpart(short, 0, fn.strchars(short) - 1)
    width = api.nvim_strwidth(short)
  end
  return short
end

utils.path_sep = vim.startswith(vim.loop.os_uname().sysname, "Windows") and "\\" or "/"

--- Truncate a name being mindful of multibyte characters and append an ellipsis
--- @param name string
--- @param word_limit number
--- @return string
function utils.truncate_name(name, word_limit)
  if strwidth(name) <= word_limit then
    return name
  end
  -- truncate nicely by seeing if we can drop the extension first
  -- to make things fit if not then truncate abruptly
  local ext = fn.fnamemodify(name, ":e")
  if ext ~= "" then
    local truncated = name:gsub("%." .. ext, "", 1)
    if api.nvim_strwidth(truncated) < word_limit then
      return truncated .. constants.ELLIPSIS
    end
  end
  return truncate_by_cell(name, word_limit - 1) .. constants.ELLIPSIS
end

--- Truncate a directory based on call depth and max length
function utils.truncate_name_by_depth(dir, depth, max_size)
  if api.nvim_strwidth(dir) <= max_size then
    return dir
  end
  -- we truncate any section of the ancestor which is too long
  -- by dividing the allotted space for each section by the depth i.e.
  -- the amount of ancestors which will be prefixed
  local allowed_size = math.floor(max_size / depth) + 1 -- Add one to account for the path separator
  local truncated = utils.map(function(part)
    return utils.truncate_name(part, allowed_size)
  end, vim.split(dir, utils.path_sep))
  return table.concat(truncated, utils.path_sep)
end

--- Converts boolean to string
function utils.bool2str(bool)
  return bool and "on" or "off"
end

--- Merge extended options with a default table of options
function utils.default_tbl(opts, default)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

deepvim.g = g
deepvim.utils = utils
