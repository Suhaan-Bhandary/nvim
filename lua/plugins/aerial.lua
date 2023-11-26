require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_set_keymap("n", "{", "<cmd>AerialPrev<CR>", {noremap=true})
    vim.api.nvim_set_keymap("n", "}", "<cmd>AerialNext<CR>", {noremap=true})
  end,
})

-- You probably also want to set a keymap to toggle aerial
vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>AerialToggle<CR>", {noremap=true})
