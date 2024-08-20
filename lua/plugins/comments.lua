return {
    {
        "folke/todo-comments.nvim",
        lazy = false,
        opts = {},
    },
    {
        "numToStr/Comment.nvim",
        lazy = false,
        opts = {
            padding = true,
            sticky = true,
            ignore = nil,
            toggler = {
                line = "<leader>/",
                block = "<leader>cb",
            },
            opleader = {
                line = "<leader>/",
                block = "<leader>cb",
            },
            extra = {
                ---Add comment on the line above
                above = "<leader>cO",
                ---Add comment on the line below
                below = "<leader>co",
                ---Add comment at the end of line
                eol = "<leader>cA",
            },
            ---Enable keybindings
            ---NOTE: If given `false` then the plugin won't create any mappings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
            ---Function to call before (un)comment
            pre_hook = nil,
            ---Function to call after (un)comment
            post_hook = nil,
        },
    }
}
