-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", {noremap=false})
-- twilight
vim.api.nvim_set_keymap("n", "tw", ":Twilight<enter>", {noremap=false})
-- buffers
vim.api.nvim_set_keymap("n", "tk", "<cmd>bnext<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "tj", "<cmd>bprev<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "th", "<cmd>bfirst<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "tl", "<cmd>blast<CR>", {noremap=false})
vim.api.nvim_set_keymap("n", "td", "<cmd>bdelete<CR>", {noremap=false})
-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", {noremap=false})
vim.api.nvim_set_keymap("n", "E", "$", {noremap=false})
vim.api.nvim_set_keymap("n", "B", "^", {noremap=false})
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", {noremap=true})
-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", {noremap=true})
vim.keymap.set('n', '<space><space>', "<cmd>set nohlsearch<CR>")


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- nvim tree
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", {noremap=true})


vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<CR>", {noremap=true})

vim.api.nvim_set_keymap("v", "<leader>p", "\"_dP", {noremap=true})

-- Copy relative paths
vim.api.nvim_set_keymap("n", "cp", "<cmd>let @+ = expand(\"%\")<CR>", {noremap=true})

-- Code Folding
vim.api.nvim_set_keymap("n", "-", "<cmd>foldclose<CR>", {noremap=true})
vim.api.nvim_set_keymap("n", "+", "<cmd>foldopen<CR>", {noremap=true})
