require("conform").setup({
    -- Map of filetype to formatters
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        markdown = { "mdformat" },
        python = { "black" },
        sql = { "sqlfmt" },
        go = { "gofmt", "goimports" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = {},
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = {}
    },
    format_on_save = {
        lsp_fallback = true,
        timeout_ms = 5000,
    }
})
