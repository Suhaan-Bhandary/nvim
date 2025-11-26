require("tokyonight").setup {
    style = "night", -- other options: "storm", "moon", "day"
    light_style = "day",

    transparent = false,  -- true will disable setting the background color
    terminal_colors = true, -- configure terminal colors

    styles = {
        comments  = { italic = true },
        keywords  = { italic = true },
        functions = {},
        variables = {},
        sidebars  = "dark", -- style for sidebar-like windows: qf, help, etc.
        floats    = "dark", -- style for floating windows
    },

    sidebars = { "qf", "help", "packer", "vista_kind" }, -- add more if you use more sidebar-like windows
    day_brightness = 0.3,                              -- adjust the brightness for day style (if you use it)

    hide_inactive_statusline = false,
    dim_inactive = false, -- dim inactive windows (good for focus)
    lualine_bold = false,

    on_colors = function(colors)
        colors.fg_gutter = "#5e81ac" -- custom line-number gutter colour
    end,

    on_highlights = function(hl, colors)
        -- Example: tweak folded text for better visibility
        hl.Folded = { fg = colors.comment, bg = colors.surface0 }
        -- Example: change CursorLineNr
        hl.CursorLineNr = { fg = colors.orange }
    end,
}

-- Color scheme
vim.cmd([[colorscheme tokyonight-night]])
vim.cmd("highlight Folded guifg=NONE guibg=#1c1c1c gui=NONE")
