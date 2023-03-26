require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
		},
	},
})

--[[ require("mason-lspconfig").setup {
    ensure_installed = {"tsserver"}
} ]]
require("mason-lspconfig").setup_handlers({
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
		require("lspconfig")[server_name].setup({})
	end,
	-- Next, you can provide targeted overrides for specific servers.
	-- For example, a handler override for the `rust_analyzer`:
	--[[ ["rust_analyzer"] = function ()
            require("rust-tools").setup {}
        end ]]
})

local lsp_config = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.cssls.setup({
	capabilities = capabilities,
})

lsp_config.denols.setup({
	on_attach = on_attach,
	root_dir = lsp_config.util.root_pattern("deno.json", "deno.jsonc"),
})

lsp_config.tsserver.setup({
	on_attach = on_attach,
	root_dir = lsp_config.util.root_pattern("package.json"),
	single_file_support = false,
})

require("lspkind").init({})
-- require("lspsaga").init_lsp_saga()
