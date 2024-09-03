-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ht", mark.add_file)
vim.keymap.set("n", "<leader>hp", ui.toggle_quick_menu)

for i = 1, 5, 1 do
    vim.keymap.set("n", "<leader>" .. i, function() ui.nav_file(i) end)
end

-- Format save
vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
        }
    end
    require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

vim.keymap.set("n", "<leader>o", "<cmd>OrganizeImports<CR>")

-- movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Moving lines
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")

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

-- trouble
vim.keymap.set("n", "<leader>gt", "<cmd>TroubleToggle workspace_diagnostics<CR>")

-- Can be used with hjkl to change panes
vim.keymap.set("n", "<leader>w", "<c-w>")

-- Git
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>")

vim.keymap.set("n", "<leader>j", "<cmd>cnext<cr>zt");
vim.keymap.set("n", "<leader>k", "<cmd>cpre<cr>zt");

-- buffers
vim.api.nvim_set_keymap("n", "tk", "<cmd>bnext<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "tj", "<cmd>bprev<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "th", "<cmd>bfirst<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "tl", "<cmd>blast<CR>", { noremap = false })
vim.api.nvim_set_keymap("n", "td", "<cmd>bdelete<CR>", { noremap = false })

-- files
vim.api.nvim_set_keymap("n", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("n", "B", "^", { noremap = false })
vim.api.nvim_set_keymap("v", "E", "$", { noremap = false })
vim.api.nvim_set_keymap("v", "B", "^", { noremap = false })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- file tree
-- vim.api.nvim_set_keymap("n", "<C-n>", "<cmd>Vex!<CR>", { noremap = true })
vim.keymap.set("n", "<C-n>", function()
    vim.cmd("vsplit | wincmd l")
    require("oil").open()
end)

vim.api.nvim_set_keymap("n", "<leader>0", "<cmd>Oil<CR>", { noremap = true })

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

-- Notes for each project
vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>lua require(\"notes\").ToggleNotes()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>sn", "<cmd>lua require(\"notes\").ViewAllNotes()<CR>", { noremap = true })

-- ufo
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
