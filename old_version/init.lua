package.path = package.path .. ";" .. vim.fn.stdpath("config") .. "/?.lua"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Load vim options
require("vim-options")

-- Load Lazy package manager and specified plugins
require("lazy").setup("plugins")

vim.cmd([[colorscheme PaperColorSlim]])
