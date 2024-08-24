return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        reveal = true,
        source_selector = {
            winbar = false,
            statusline = false
        },
        default_component_configs = {
            name = {
                use_git_status_colors = false
            }
        },
        filesystem = {
            follow_current_file = {
                enabled = true,
                leave_dirs_open = true,
            },
            hijack_netrw_behavior = "disabled",
        },
    },
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    }
}
