require("tokyonight").setup({
    transparent = false, -- Enable this to disable setting the background color

    on_colors = function(colors)
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
    end,

    -- Telescope
    on_highlights = function(hl, colors)
        hl.TelescopeMatching = { fg = colors.flamingo }
        hl.TelescopeSelection = { fg = colors.text, bg = colors.surface0, bold = true }

        hl.TelescopePromptPrefix = { bg = colors.surface0 }
        hl.TelescopePromptNormal = { bg = colors.surface0 }
        hl.TelescopeResultsNormal = { bg = colors.mantle }
        hl.TelescopePreviewNormal = { bg = colors.mantle }

        hl.TelescopePromptBorder = { bg = colors.surface0, fg = "#7aa2f7" }
        hl.TelescopeResultsBorder = { bg = colors.mantle, fg = "#7aa2f7" }
        hl.TelescopePreviewBorder = { bg = colors.mantle, fg = "#7aa2f7" }

        hl.TelescopePromptTitle = { bg = colors.pink, fg = colors.mantle }
        hl.TelescopeResultsTitle = { fg = colors.mantle }
        hl.TelescopePreviewTitle = { bg = colors.mantle }
    end,
})
