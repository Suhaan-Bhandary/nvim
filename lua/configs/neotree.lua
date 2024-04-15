require('neo-tree').setup({
    reveal = true,
    source_selector = {
        winbar = false,
        statusline = false
    },
    default_component_configs = {
        name = {
            use_git_status_colors = false
        }
    }
})
