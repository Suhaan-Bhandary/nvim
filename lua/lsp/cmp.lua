-- Set up nvim-cmp.
local cmp = require("cmp")

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
        format = function(entry, vim_item)
            local highlights_info = require("colorful-menu").cmp_highlights(entry)

            -- if highlight_info==nil, which means missing ts parser, let's fallback to use default `vim_item.abbr`.
            -- What this plugin offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
            if highlights_info ~= nil then
                vim_item.abbr_hl_group = highlights_info.highlights
                vim_item.abbr = highlights_info.text
            end

            return vim_item
        end,
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
