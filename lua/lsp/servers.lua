return {
    clangd = {},
    cssls = {},
    cssmodules_ls = {},
    emmet_ls = {},
    eslint = {},
    gopls = {},
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
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
    sqlls = {},
    ts_ls = {},
}
