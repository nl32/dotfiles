-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.isfname:append("@-@")

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.syntax = true

vim.wo.colorcolumn = "80"
vim.opt.wrap = false

vim.g.mapleader = ","

vim.opt.updatetime = 50

-- backup stuffs

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Diagnostics

vim.diagnostic.config({})

-- patterns
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" }
})
