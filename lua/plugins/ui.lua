local lazy = require("lazy")
local Job = require('plenary.job')

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
                                        disabled_filetypes = { 'packer', 'NvimTree', 'Telescope', 'terminal' }
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
                        "neovim/nvim-lspconfig", -- LSP integration
                        "SmiteshP/nvim-navic",
                        "nvim-tree/nvim-web-devicons",
                },
                opts = {
                        context = {
                                use_treesitter = true,
                        },
                        show_dirname = true,
                        show_basename = true,
                        show_navic = true,
                        custom_section = function()
                                -- Git Section
                                local branch = ''
                                local staged_count = ''
                                local changed_count = ''
                                local git_info = vim.b.gitsigns_status_dict

                                -- Get the current Git branch
                                if git_info and git_info.head then
                                        branch = git_info.head
                                end

                                -- Get the number of modified (unstaged) files in the whole repository
                                Job:new({
                                        command = 'git',
                                        args = { 'diff', '--name-only' },
                                        cwd = vim.fn.getcwd(),
                                        on_exit = function(j, return_val)
                                                if return_val == 0 then
                                                        local result = j:result()
                                                        changed_count = #result > 0 and #result .. "!" or ""
                                                end
                                        end,
                                }):sync()

                                -- Get the number of staged files
                                Job:new({
                                        command = 'git',
                                        args = { 'diff', '--cached', '--name-only' },
                                        cwd = vim.fn.getcwd(),
                                        on_exit = function(j, return_val)
                                                if return_val == 0 then
                                                        local result = j:result()
                                                        staged_count = #result > 0 and #result .. "+ " or ""
                                                end
                                        end,
                                }):sync()

                                -- Get LSP diagnostics (errors, warnings, and hints)
                                local diagnostics = vim.diagnostic.get(0)
                                local error_count, warn_count, hint_count = 0, 0, 0

                                for _, diagnostic in ipairs(diagnostics) do
                                        if diagnostic.severity == vim.diagnostic.severity.ERROR then
                                                error_count = error_count + 1
                                        elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                                                warn_count = warn_count + 1
                                        elseif diagnostic.severity == vim.diagnostic.severity.HINT then
                                                hint_count = hint_count + 1
                                        end
                                end

                                -- Line Number
                                local line = vim.api.nvim_win_get_cursor(0)[1]

                                -- Combine branch, modification, staged status, changed status, and LSP diagnostics
                                local status_display = ""

                                status_display = "  " .. line .. " | "

                                if branch ~= '' then
                                        status_display = status_display .. " " .. branch .. " "
                                end

                                if staged_count ~= '' then
                                        status_display = status_display .. " | " .. staged_count
                                end

                                if changed_count ~= '' then
                                        status_display = status_display .. changed_count
                                end

                                -- Format LSP diagnostics output
                                if error_count ~= 0 or warn_count ~= 0 or hint_count ~= 0 then
                                        status_display = status_display .. " |"
                                        if error_count ~= 0 then
                                                status_display = status_display .. " E:" .. error_count
                                        end

                                        if warn_count ~= 0 then
                                                status_display = status_display .. " W:" .. warn_count
                                        end

                                        if hint_count ~= 0 then
                                                status_display = status_display .. " H:" .. hint_count
                                        end
                                end


                                return status_display
                        end,
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
