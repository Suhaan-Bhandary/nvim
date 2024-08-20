return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettier" },
            json = { "prettier" },
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
        }
    }
}
