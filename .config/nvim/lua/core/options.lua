local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.have_nerd_font = true

opt.completeopt = "menu,menuone,noinsert,fuzzy,popup"
opt.winborder = "single"
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 15
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.clipboard = "unnamedplus"
opt.laststatus = 3
opt.cursorline = true
opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.updatetime = 250
opt.breakindent = true
