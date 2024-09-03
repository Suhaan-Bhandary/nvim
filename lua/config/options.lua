-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.diffopt = vim.opt.diffopt + "vertical"

-- Removes cmd when not in use
vim.opt.cmdheight = 0

-- Terminal Colors
vim.opt.termguicolors = true

-- Set highlight on search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Line wrapping
vim.opt.wrap = false

-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Decrease update time
vim.opt.updatetime = 50
vim.wo.signcolumn = 'yes'

-- vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

-- Concealer for Neorg
vim.opt.conceallevel = 2

-- spell checks
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- fillchars
vim.opt.fillchars = "diff: ,fold: "

-- ufo options
vim.o.foldcolumn = '1' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
