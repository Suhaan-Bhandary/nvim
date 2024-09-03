local lazy = require("lazy")

return {
    {
        "stevearc/dressing.nvim",
        lazy = true,
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.select = function(...)
                lazy.load({ plugins = { "dressing.nvim" } })
                return vim.ui.select(...)
            end
            ---@diagnostic disable-next-line: duplicate-set-field
            vim.ui.input = function(...)
                lazy.load({ plugins = { "dressing.nvim" } })
                return vim.ui.input(...)
            end
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", "folke/noice.nvim" }, -- Ensure noice is loaded before lualine
        opts = function()
            local noice = require("noice")
            return {
                options = {
                    icons_enabled = true,
                    globalstatus = true,
                    component_separators = '|',
                    section_separators = '',
                    disabled_filetypes = { 'packer', 'NvimTree' }
                },
                sections = {
                    lualine_x = { {
                        noice.api.statusline.mode.get,
                        cond = noice.api.statusline.mode.has,
                        color = {
                            fg = "#ff9e64"
                        }
                    } },
                    lualine_a = { {
                        -- 'buffers',
                    } }
                }
            }
        end
    },
    {
        "utilyre/barbecue.nvim",
        name = "barbecue",
        version = "*",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons", -- optional dependency
        },
        opts = {
            context = {
                use_treesitter = true,
            },
        },
    },
    {
        "rcarriga/nvim-notify",
        opts = {
            render = "minimal",
            stages = "static",
            timeout = 2000,
        },
        lazy = false,
        init = function()
            local notify = require("notify")
            vim.notify = notify

            print = function(...)
                local print_safe_args = {}
                local _ = { ... }
                for i = 1, #_ do
                    table.insert(print_safe_args, tostring(_[i]))
                end
                notify(table.concat(print_safe_args, ' '), "info")
            end
        end
    },
}
