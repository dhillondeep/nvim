local servers = deepvim.lspservers()
local server_names = {}
for name, _ in pairs(servers) do
  table.insert(server_names, name)
end

return {
  override_options = {
    ensure_installed = server_names,
  },
}
