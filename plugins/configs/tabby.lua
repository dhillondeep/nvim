local constants = deepvim.constants
local colors = require("base46").get_theme_tb("base_30")

-- color palettes set using base46 colors
local palette_bg = colors.statusline_bg
local palette_bg_sec = colors.grey
local palette_fg = colors.darker_black
local palette_head = colors.blue
local palette_accent = colors.red
local palette_accent_sec = colors.green

-- cwd returns current last name of working directory
local cwd = function()
  return constants.padding .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. constants.padding
end

-- buf_filters is a list of filters to not display certain buffers
local function buf_filters(win)
  local neotree_match = string.match(win.buf_name(), "neo--tree filesystem")
  local togglerterm_match = string.match(win.buf_name(), "toggleterm")
  return not (neotree_match or togglerterm_match)
end

-- theme is made of palettes and sets the look and feel of the tabline
local theme = {
  fill = { fg = palette_fg, bg = palette_bg, style = "bold" },
  head = { fg = palette_fg, bg = palette_head, style = "bold" },
  current_tab = { fg = palette_bg, bg = palette_accent_sec, style = "bold" },
  current_win = { fg = palette_bg, bg = palette_accent },
  inactive = { fg = palette_fg, bg = palette_bg_sec },
}

require("tabby.tabline").set(function(line)
  return {
    {
      { cwd(), hl = theme.head },
      line.sep(" ", theme.head, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.inactive
      return {
        line.sep("", hl, theme.fill),
        tab.is_current() and "" or "",
        tab.number(),
        line.sep(constants.padding, hl, theme.fill),
        hl = hl,
        margin = constants.padding,
      }
    end),
    line.sep("█ ", theme.head, theme.fill),
    line.wins_in_tab(line.api.get_current_tab(), buf_filters).foreach(function(win)
      local hl = win.is_current() and theme.current_win or theme.inactive
      return {
        line.sep("", hl, theme.fill),
        win.is_current() and "" or "",
        win.buf_name(),
        line.sep(constants.padding, hl, theme.fill),
        hl = hl,
        margin = constants.padding,
      }
    end),
    hl = theme.fill,
  }
end)
