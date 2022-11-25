-- global configuration
_G.deepvim = {}

-- load global configurations
require("custom.constants")
require("custom.options")
require("custom.config")
require("custom.utils")
require("custom.utils.functions")

local M = {}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
