local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')

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
local picker = require("snacks.picker")

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local buf = ev.buf
        vim.bo[buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        local opts = { buffer = buf }

        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)

        -- Snacks picker wrappers
        vim.keymap.set("n", "gi", function() picker.lsp_implementations() end, { buffer = buf, silent = true })
        vim.keymap.set("n", "gr", function() picker.lsp_references() end, { buffer = buf, silent = true })
        vim.keymap.set("n", "<leader>ds", function() picker.lsp_symbols() end,
            { buffer = buf, desc = "[D]ocument [S]ymbols" })
        vim.keymap.set("n", "<leader>ws", function() picker.lsp_workspace_symbols() end,
            { buffer = buf, desc = "[W]orkspace [S]ymbols" })
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
require 'lsp.lua_ls'
