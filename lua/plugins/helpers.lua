return {
    { 'mattn/emmet-vim',    lazy = false },
    { 'alvan/vim-closetag', lazy = false },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = 'kevinhwang91/promise-async',
        init = function()
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { 'lsp', 'indent' }
                end
            })
        end
    }
}
