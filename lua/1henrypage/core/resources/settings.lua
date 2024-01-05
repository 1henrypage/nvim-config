--[[
-- Stolen from loctvl842/nvim 
--]]

local util = require("1henrypage.util")

-- autocmds and keymaps can be lazily loaded.
vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
        util.load("autocmds")
        util.load("keymaps")
    end,
})

util.load("options")

return {}
