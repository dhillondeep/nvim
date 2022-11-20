local disabled_plugins = require("custom.plugins.disabled")
local overriden = require("custom.plugins.overriden")
local new = require("custom.plugins.new")

-- convert list of plugins to disabled plugins and return
local disabled = {}
for _, plugin in ipairs(disabled_plugins) do
  disabled[plugin] = false
end

-- merge all plugins and return them
local merge_tb = vim.tbl_deep_extend
local plugins = {}
plugins = merge_tb("force", plugins, disabled)
plugins = merge_tb("force", plugins, overriden)
plugins = merge_tb("force", plugins, new)

return plugins
