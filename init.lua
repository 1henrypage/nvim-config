vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- bootstrap lazy 
if not vim.loop.fs_stat(lazypath) then
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



local plugins = {
   -- Color scheme 
    {"nvim-treesitter/nvim-treesitter", build =":TSUpdate"},   
    {"loctvl842/monokai-pro.nvim", name="monokai-pro", priority=1000},
    {'nvim-telescope/telescope.nvim', tag = '0.1.5',dependencies = { 'nvim-lua/plenary.nvim' }}
}
local opts = {}

require("lazy").setup(plugins, opts)

-- refactor this part later lol
local builtin = require("telescope.builtin") 
vim.keymap.set('n', '<leader>sn', builtin.find_files, {})
vim.keymap.set('n', '<leader>sf', builtin.live_grep, {})

-- monokai setup
require("monokai-pro").setup()

vim.cmd.colorscheme "monokai-pro"


