local present, lspconfig = pcall(require, "lspconfig")
if not present then
	return
end

local present, nullls = pcall(require, "null-ls")
if not present then
	return
end

local present, cmp = pcall(require, "cmp_nvim_lsp")
if not present then
	return
end

require("base46").load_highlight("lsp")
require("nvchad_ui.lsp")

local utils = require("core.utils")

-- on_attach function
local function on_attach(client, bufnr)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true

	utils.load_mappings("lspconfig", { buffer = bufnr })

	-- Format command
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
		vim.lsp.buf.format({
			format_on_save = false,
		})
	end, { desc = "Format file with LSP" })

	if client.server_capabilities.signatureHelpProvider then
		require("nvchad_ui.signature").setup(client)
	end
end

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

-- setup null-ls
nullls.setup({
	on_attach = on_attach,
	sources = deepvim.nullls_sources(nullls),
})

for server, config in pairs(deepvim.lspservers()) do
	-- setup lsp servers
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	if next(config) ~= nil then
		opts.settings = config
	end
	lspconfig[server].setup(opts)
end
