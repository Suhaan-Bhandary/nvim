local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require 'mason-lspconfig'
local telescope_builtin = require 'telescope.builtin'

mason_lspconfig.setup {
    ensure_installed = {
        "clangd",
        "cssls",
        "cssmodules_ls",
        "emmet_ls",
        "eslint",
        "gopls",
        "jsonls",
        "lua_ls",
        "sqlls",
        "ts_ls",
    },
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)


        local nmap = function(keys, func, desc)
            if desc then
                desc = 'LSP: ' .. desc
            end

            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        end

        vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations, { noremap = true, silent = true })
        vim.keymap.set('n', 'gr', telescope_builtin.lsp_references, { noremap = true, silent = true })

        nmap('<leader>ds', telescope_builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
        nmap('<leader>ws', telescope_builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    end,
})

local border = {
    { "🭽", "FloatBorder" },
    { "▔", "FloatBorder" },
    { "🭾", "FloatBorder" },
    { "▕", "FloatBorder" },
    { "🭿", "FloatBorder" },
    { "▁", "FloatBorder" },
    { "🭼", "FloatBorder" },
    { "▏", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or border
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

require 'lsp.cmp'
require 'lsp.emmet_setup'
require 'lsp.json_setup'
require 'lsp.ts_server'
