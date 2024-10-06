-- Set up nvim-cmp.
local cmp = require("cmp")

local lsp_symbols = {
    Namespace = "󰌗",
    Text = "󰉿",
    Method = "󰆧",
    Function = "󰆧",
    Constructor = "",
    Field = "󰜢",
    Variable = "󰀫",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "󰑭",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈚",
    Reference = "󰈇",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "󰙅",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰊄",
    Table = "",
    Object = "󰅩",
    Tag = "",
    Array = "[]",
    Boolean = "",
    Number = "",
    Null = "󰟢",
    String = "󰉿",
    Calendar = "",
    Watch = "󰥔",
    Package = "",
    Copilot = "",
    Codeium = "",
    TabNine = "",
}

local MIN_LABEL_WIDTH = 30

local format_function = function(_, vim_item)
    vim_item.kind = string.format("%s  %s", lsp_symbols[vim_item.kind], vim_item.kind)

    local label = vim_item.abbr
    if string.len(label) < MIN_LABEL_WIDTH then
        local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
        vim_item.abbr = label .. padding
    end

    return vim_item
end

-- setting a global variable for cmp
vim.g.cmpEnabled = false
cmp.setup({
    enabled = function()
        return vim.g.cmpEnabled
    end,
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        }),

        -- Navigate between snippet placeholder
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif require('luasnip').expand_or_locally_jumpable() then
                require('luasnip').expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif require('luasnip').jumpable(-1) then
                require('luasnip').jump(-1)
            else
                fallback()
            end
        end,
    }),
    formatting = {
        format = format_function,
    },
    sources = cmp.config.sources(
        {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
        },
        {
            { name = "buffer", keyword_length = 3 },
        }
    ),
})
