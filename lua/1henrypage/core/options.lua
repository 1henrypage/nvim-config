-- Some of the things in this config are vim defined defaults. They have been explicitly defined.

local options = {
  ambiwidth = "single",
  autoread = true, 
  autowriteall = true, 
  background = "dark", 
  backspace = "indent,start",
  backup = false,
  cdhome = true,
  clipboard = "unnamedplus",
  cmdheight = 0,
  confirm = true,
  conceallevel = 0,
  copyindent = true,
  cursorline = true,
  fileencoding = "utf-8",
  fileformat = "unix",
  gdefault = false, -- make this true if nvim doesn't have a good plugin for substituion, doubt it tho
  grepformat = "%f:%l:%c:%m",
  grepprg = "rg --vimgrep",
  -- guicursor = "a:blinkon0,Cursor/green", -- it's bugged
  helplang = "en,jp,de", 
  hlsearch = true,
  ignorecase = true,
  inccommand = "split",
  incsearch = true,
  linespace = 0, -- widen or shorten space between chars 
  makeprg = "make",
  mouse = "a",
  selection = "exclusive",
  showcmd = false,
  showtabline = 2,
  signcolumn = "yes:1",
  smartcase = true,
  smartindent = true,
  spelllang = "en_gb",
  splitbelow = true,
  splitright = true,
  timeoutlen = 500, -- make this shorter as I get faster, dictates how long it takes for vim to wait for a mapped sequence
  virtualedit = "onemore",
  -- tabs
  expandtab = true,
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  -- number lines
  number = true,
  relativenumber = true,
  numberwidth = 2, -- increase/decrease if column is not big enough
  wildmenu = true,
  wildmode = "longest:full,full",
  -- misc
  wrap = false, 
  title = true, 
  titlestring = "%<%F%=%l/%L - %y%m%r%w [%{&filetype}] - %y[%{&readonly?'RO':''}] - nvim",
  titlelen = 85, 
  -- session ops
  sessionoptions = { "buffers", "curdir", "tabpages", "winsize" },
}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

for k, v in pairs(options) do
  vim.opt[k] = v
end

return {}
