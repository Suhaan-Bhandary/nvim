-- Telescope
local telescope = require("telescope.builtin")

vim.keymap.set('n', '<leader>sf', telescope.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', telescope.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', telescope.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', telescope.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sb', telescope.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sS', telescope.git_status, { desc = '' })

-- LSP
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>o", "<cmd>OrganizeImports<CR>")

-- trouble
vim.keymap.set("n", "<leader>gt", "<cmd>TroubleToggle workspace_diagnostics<CR>")

-- Custom
vim.keymap.set("n", "<leader>w", "<c-w>")

-- Git
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>")

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

-- file tree
-- vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>Vex!<CR>", { noremap = true })
vim.keymap.set("n", "<C-n>", function()
    vim.cmd("vsplit | wincmd l")
    require("oil").open()
end)

-- save
vim.api.nvim_set_keymap("n", "<C-s>", "<cmd>w<CR>", { noremap = true })

-- Custom Paste without copy of highlight
vim.api.nvim_set_keymap("v", "<leader>p", "\"_dP", { noremap = true })

-- Copy relative paths
vim.api.nvim_set_keymap("n", "cp", "<cmd>let @+ = expand(\"%\")<CR>", { noremap = true })

-- Code Folding
vim.api.nvim_set_keymap("n", "-", "<cmd>foldclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "+", "<cmd>foldopen<CR>", { noremap = true })

-- undo tree
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { noremap = true })
