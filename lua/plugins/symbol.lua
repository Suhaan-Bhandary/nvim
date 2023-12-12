require("symbols-outline").setup()

-- keymaps
vim.api.nvim_set_keymap("n", "<C-q>", "<cmd>SymbolsOutline<CR>", {noremap=true})
