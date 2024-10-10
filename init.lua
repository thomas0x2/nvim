vim.g.mapleader = " "
vim.keymap.set("n", "<C-q>", vim.cmd.Ex)
vim.wo.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

require("config.lazy")

vim.cmd([[colorscheme PaperColorSlim]])
