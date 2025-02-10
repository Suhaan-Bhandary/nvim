return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    init = function()
        require 'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "lua",
                "go",
                "vimdoc",
                "vim",
                "c",
                "cpp",
                "javascript",
                "typescript",
                "css",
                "json",
                "sql",
                "html",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = function(lang, buf)
                    local max_filesize = 10 * 1024 * 1024 -- 10MB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
        }
    end
}
