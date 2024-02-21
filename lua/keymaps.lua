-- Telescope
local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sb', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sS', telescope.git_status, { desc = '' })
vim.keymap.set('n', '<leader>sm', ":Telescope harpoon marks<CR>", { desc = 'Harpoon [M]arks' })

-- LSP
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Custom
vim.keymap.set("n", "<leader>w", "<c-w>")

vim.keymap.set("n", "<leader>j", "<cmd>lnext<cr>");
vim.keymap.set("n", "<leader>k", "<cmd>lprev");
vim.keymap.set("n", "gw", "yiwwwviwpbbbviwp", { noremap = false });

-- buffers
vim.api.nvim_set_keymap("n", "tk", "<cmd>bnext<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "tj", "<cmd>bprev<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "th", "<cmd>bfirst<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "tl", "<cmd>blast<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "td", "<cmd>bdelete<CR>", { noremap = false })

-- files
vim.api.nvim_set_keymap("n", "QQ", ":q!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "WW", ":w!<enter>", { noremap = false })
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })
vim.api.nvim_set_keymap("n", "TT", ":TransparentToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "st", ":TodoTelescope<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "ss", ":noh<CR>", { noremap = true })

-- splits
vim.api.nvim_set_keymap("n", "<C-W>,", ":vertical resize -10<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-W>.", ":vertical resize +10<CR>", { noremap = true })


-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- nvim tree
vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { noremap = true })

vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<CR>", { noremap = true })

-- Custom Paste without copy of highlight
vim.api.nvim_set_keymap("v", "<leader>p", "\"_dP", { noremap = true })

-- Copy relative paths
vim.api.nvim_set_keymap("n", "cp", "<cmd>let @+ = expand(\"%\")<CR>", { noremap = true })

-- Code Folding
vim.api.nvim_set_keymap("n", "-", "<cmd>foldclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "+", "<cmd>foldopen<CR>", { noremap = true })
