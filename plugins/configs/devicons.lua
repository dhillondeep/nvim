-- nvchad_ui does not include colours but nvim-web-devicons needs colours
-- this add missing colours
local function add_colors(icons)
  icons["default_icon"].color = "#6d8086"
  icons["lua"].color = "#51a0cf"
  icons["css"].color = "#42a5f5"
  icons["zip"].color = "#f1c48b"
  icons["rpm"].color = "#ff415b"
  icons["out"].color = "#e19973"
  icons["c"].color = "#599eff"
  icons["robots.txt"].color = "#595a5f"
  icons["woff"].color = "#6d8086"
  icons["woff2"].color = "#6d8086"
  icons["ttf"].color = "#6d8086"
  icons["mp3"].color = "#6d8086"
  icons["mp4"].color = "#6d8086"
  icons["xz"].color = "#6d8086"
  icons["ttf"].color = "#6d8086"
  icons["Dockerfile"].color = "#384d54"
  icons["deb"].color = "#a80031"
  icons["html"].color = "#e44d26"
  icons["jpeg"].color = "#a074c4"
  icons["jpg"].color = "#a074c4"
  icons["js"].color = "#cbcb41"
  icons["kt"].color = "#F88A02"
  icons["lock"].color = "#bbbbbb"
  icons["ts"].color = "#519aba"
  icons["rb"].color = "#701516"
  icons["vue"].color = "#8dc149"
  icons["py"].color = "#ffbc03"
  icons["toml"].color = "#6d8086"
  icons["png"].color = "#a074c4"
end

local present, devicons = pcall(require, "nvim-web-devicons")

if present then
  require("base46").load_highlight("devicons")

  local nvchad_devicons = require("nvchad_ui.icons").devicons
  add_colors(nvchad_devicons)

  local options = { override = nvchad_devicons }
  options = require("core.utils").load_override(options, "kyazdani42/nvim-web-devicons")

  devicons.setup(options)
end
