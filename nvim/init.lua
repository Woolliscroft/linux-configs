vim.g.mapleader = ","

require("plugins")
require("mylsp")
require("nvimcmp")

vim.opt.clipboard = "unnamedplus"
vim.cmd([[ so ~/.config/nvim/legacy.vim ]])

