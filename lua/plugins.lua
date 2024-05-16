local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        { "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
            lazypath })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- Go
    {
        "ray-x/go.nvim",
        dependencies = { -- optional packages
            "ray-x/guihua.lua",
            "neovim/nvim-lspconfig",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        event = { "CmdlineEnter" },
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {}
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    }, {
    "folke/noice.nvim",
    config = function()
        require("noice").setup({})
    end,
    dependencies = { "MunifTanjim/nui.nvim" } -- Used for the UI
},

    -- LSP
    { "williamboman/mason.nvim" }, { "neovim/nvim-lspconfig" }, { "williamboman/mason-lspconfig.nvim" }, { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" }, { "hrsh7th/cmp-path" }, { "hrsh7th/nvim-cmp", dependencies = { "saadparwaiz1/cmp_luasnip" } }, { "L3MON4D3/LuaSnip" }, { "saadparwaiz1/cmp_luasnip" },
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },

    -- Lists LSP diagnostics
    {
        "folke/trouble.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    -- Git
    { "lewis6991/gitsigns.nvim" }, {
    "tpope/vim-fugitive",
    lazy = false
},

    -- Tools
    { "nvim-treesitter/nvim-treesitter" }, {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }
},
    { "stevearc/conform.nvim" }, {
    "numToStr/Comment.nvim",
    lazy = false
},

    -- File Explorer
    -- { "nvim-tree/nvim-tree.lua" },
    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {},
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },

    -- Helpers
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- HTML
    'mattn/emmet-vim',
    {
        'alvan/vim-closetag',
        lazy = false,
    },

    -- Undo Tree
    {
        "mbbill/undotree",
        lazy = false,
    },

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- better vim.ui
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                require("lazy").load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },

    -- Custom Plugin
    {
        "Suhaan-Bhandary/notes.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" }
    },

    {
        "sindrets/diffview.nvim",
        lazy = false,
    },
}

local opts = {
    defaults = {
        lazy = true
    }
}

require("lazy").setup(plugins, opts)


require("configs.lualine")
require("configs.treesitter")
require("configs.telescope")
require("configs.mason")
require("configs.gitsigns")
require("configs.comment")
require("configs.conform")
require("configs.oil")
require("configs.tokyonight")
require("configs.completion")
require("configs.trouble")
require("configs.harpoon")
require("configs.neotree")
