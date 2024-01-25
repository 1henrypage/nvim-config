--[[
-- Stolen from loctvl842/nvim
--
-- Generic information. Autocmds that are specific to things like lsp's are defined in their specific modules
--]]

local Util = require("1henrypage.util")

-- Turn off paste mode when leaving insert so that formatting issues are not prevelant.
vim.api.nvim_create_autocmd("InsertLeave", {
    command = "set nopaste",
    pattern = "*",
})

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
    group = Util.augroup("highlight_yanks"),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- resize splits to equal sizes if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = Util.augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
    group = Util.augroup("wrap_spell"),
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = false
    end,
})

-- Make sure when carriage return is pressed on a comment line, it doesn't bring the comment down unless it's a leader`j
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    group = Util.augroup("comment_newline"),
    pattern = { "*" },
    callback = function()
        vim.cmd([[set formatoptions-=cro]])
    end,
})

-- custom titlestring
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "" },
    callback = function()
        local get_project_dir = function()
            local cwd = vim.fn.getcwd()
            local project_dir = vim.split(cwd, "/")
            local project_name = project_dir[#project_dir]
            return project_name
        end

        vim.opt.titlestring = get_project_dir()
    end,
})

-- Move help to the right
vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "help" },
    callback = function()
        vim.cmd([[wincmd L]])
    end,
})

-- Hide stuff in terminal
vim.api.nvim_create_autocmd({ "TermOpen" }, {
    group = Util.augroup("terminal"),
    pattern = { "*" },
    callback = function()
        vim.opt_local["number"] = false
        vim.opt_local["signcolumn"] = "no"
        vim.opt_local["foldcolumn"] = "0"
    end,
})

-- clear cmd output
vim.api.nvim_create_autocmd({ "CursorHold" }, {
    group = Util.augroup("clear_term"),
    callback = function()
        vim.cmd([[echon '']])
    end,
})

-- start terminal in insert mode
vim.api.nvim_create_autocmd("TermOpen", {
    desc = "Auto enter insert mode when opening a terminal",
    group = Util.augroup("terminal"),
    pattern = "*",
    callback = function()
        vim.defer_fn(function()
            if vim.api.nvim_buf_get_option(0, "buftype") == "terminal" then
                vim.cmd([[startinsert]])
            end
        end, 100)
    end,
})
-- funny cursor business thing
vim.api.nvim_exec(
    [[
  augroup 1henrypage_InsertModeCursorLine
    autocmd!
    autocmd InsertEnter * highlight CursorLine guibg=#005f00  ctermbg=23
    autocmd InsertLeave * highlight CursorLine guibg=NONE ctermbg=NONE
  augroup END
]],
    false
)
