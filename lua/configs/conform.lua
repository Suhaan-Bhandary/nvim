require("conform").setup({
    -- Map of filetype to formatters
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier" },
        html = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = {},
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = {}
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true
    }
})
