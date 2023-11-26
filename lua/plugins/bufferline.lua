require("bufferline").setup({
    options = {
        max_name_length = 30,
        max_prefix_length = 30,
        tab_size = 21,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_close_icons = false,
        show_close_icon = false,
        enforce_regular_tabs = true,
        always_show_bufferline = false,
        separator_style = {"", ""}, 
    },
})
