-- global configuration
_G.deepvim = {}

-- load global configurations
require("custom.options")
require("custom.config")
require("custom.utils")

local M = {}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
