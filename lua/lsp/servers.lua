return {
    ts_ls = {},
    eslint = {},
    emmet_ls={},
	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			diagnostics = {
				globals = {
					"vim",
				},
			},
		},
	},
	jsonls = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
			},
		},
	},
}
