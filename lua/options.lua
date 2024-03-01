vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

vim.opt.diffopt = vim.opt.diffopt + "vertical"

-- removing the termguicolorsoption
vim.o.termguicolors = false

-- Set highlight on search
vim.o.hlsearch = true

-- Line wrapping
vim.o.wrap = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Disable mouse mode
-- vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.cmd.colorscheme "tokyonight-night"

-- vim.cmd()
vim.opt.clipboard = 'unnamedplus'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Concealer for Neorg
vim.o.conceallevel = 2

-- spell checks
vim.opt.spelllang = 'en_us'
vim.opt.spell = true

-- netrw
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
