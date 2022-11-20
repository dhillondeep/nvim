local servers = require("custom.plugins.configs.lspservers")

local server_names = {}
for server_name, _ in pairs(servers) do
  table.insert(server_names, server_name)
end

return {
  override_options = {
    ensure_installed = server_names,
  },
}
