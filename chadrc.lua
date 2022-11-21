-- loads custom config (deepvim)
require("custom.config")

local M = {}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
