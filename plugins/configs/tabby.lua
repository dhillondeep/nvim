local lazy = require("custom.lazy")
local constants = lazy.require("custom.constants")
local colors = require("base46").get_theme_tb("base_30")

local function apply_neotree_filter(winid, filename)
  local filetype = vim.fn.getwinvar(winid, "&filetype")
  if filetype == "neo-tree" then
    return "NeoTree"
  end
  return filename
end

local palette_bg = colors.statusline_bg
local palette_bg_sec = colors.grey
local palette_fg = colors.darker_black
local palette_head = colors.blue
local palette_accent = colors.red
local palette_accent_sec = colors.green

local right_sep = ""

local filename = require("tabby.filename")
local cwd = function()
  return constants.padding .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. constants.padding
end
local tabname = function(tabid)
  return vim.api.nvim_tabpage_get_number(tabid)
end

local theme = {
  fill = 'TabLineFill',
  -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
  head = 'TabLine',
  current_tab = 'TabLineSel',
  tab = 'TabLine',
  win = 'TabLine',
  tail = 'TabLine',
}
require('tabby.tabline').set(function(line)
  return {
    {
      { cwd(), hl = {fg = palette_fg, bg = palette_head, style = "bold"}},
      -- line.sep('', theme.head, theme.fill),
      line.sep(right_sep .. constants.padding, { fg = palette_head, bg = palette_bg }, theme.fill),
    },
    line.tabs().foreach(function(tab)
      local hl = tab.is_current() and theme.current_tab or theme.tab
      return {
        line.sep('', hl, theme.fill),
        tab.is_current() and '' or '',
        tab.number(),
        tab.name(),
        tab.close_btn(''),
        line.sep('', hl, theme.fill),
        hl = hl,
        margin = ' ',
      }
    end),
    line.spacer(),
    line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
      return {
        line.sep('', theme.win, theme.fill),
        win.is_current() and '' or '',
        win.buf_name(),
        line.sep('', theme.win, theme.fill),
        hl = theme.win,
        margin = ' ',
      }
    end),
    {
      line.sep('', theme.tail, theme.fill),
      { '  ', hl = theme.tail },
    },
    hl = theme.fill,
  }
end)

-- local palette_bg = colors.statusline_bg
-- local palette_bg_sec = colors.grey
-- local palette_fg = colors.darker_black
-- local palette_head = colors.blue
-- local palette_accent = colors.red
-- local palette_accent_sec = colors.green
--
-- local right_sep = ""
--
-- local filename = require("tabby.filename")
-- local cwd = function()
--   return constants.padding .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. constants.padding
-- end
-- local tabname = function(tabid)
--   return vim.api.nvim_tabpage_get_number(tabid)
-- end
-- local line = {
--   hl = { fg = palette_fg, bg = palette_bg },
--   layout = "active_wins_at_end",
--   head = {
--     { cwd, hl = { fg = palette_fg, bg = palette_head, style = "bold" } },
--     { right_sep .. constants.padding, hl = { fg = palette_head, bg = palette_bg } },
--   },
--   active_tab = {
--     label = function(tabid)
--       return {
--         "  " .. tabname(tabid) .. constants.padding,
--         hl = { fg = palette_bg, bg = palette_accent_sec, style = "bold" },
--       }
--     end,
--     right_sep = { constants.padding, hl = { fg = palette_bg, bg = palette_bg } },
--   },
--   inactive_tab = {
--     label = function(tabid)
--       return {
--         "  " .. tabname(tabid) .. constants.padding,
--         hl = { fg = palette_fg, bg = palette_bg_sec, style = "bold" },
--       }
--     end,
--     right_sep = { constants.padding, hl = { fg = palette_bg, bg = palette_bg } },
--   },
--   top_win = {
--     label = function(winid)
--       local fname = filename.unique(winid)
--       fname = apply_neotree_filter(winid, fname)
--       return {
--         "  " .. fname .. constants.padding,
--         hl = { fg = palette_bg, bg = palette_accent, style = "bold" },
--       }
--     end,
--     right_sep = { constants.padding, hl = { fg = palette_bg, bg = palette_bg } },
--   },
--   win = {
--     label = function(winid)
--       local fname = filename.unique(winid)
--       fname = apply_neotree_filter(winid, fname)
--       return {
--         "  " .. fname .. constants.padding,
--         hl = { fg = palette_fg, bg = palette_bg_sec },
--       }
--     end,
--     right_sep = { constants.padding, hl = { fg = palette_bg, bg = palette_bg } },
--   },
--   tail = {
--     { "  ", hl = { fg = palette_bg, bg = palette_accent } },
--   },
-- }
--
-- require("tabby").setup({ tabline = line })
