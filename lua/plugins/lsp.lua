return {
    {
        "williamboman/mason.nvim",
        init = function()
            require('mason').setup()
        end
    },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "neovim/nvim-lspconfig" },
    { "saadparwaiz1/cmp_luasnip" },
    {
        "williamboman/mason-lspconfig.nvim",
        init = function()
            require('mason-lspconfig').setup()
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "saadparwaiz1/cmp_luasnip" }
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        init = function()
            require("luasnip/loaders/from_vscode").lazy_load()
        end,
    },

    -- Lists LSP diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            position = "right",
            width = 40,
        },
    },
}
