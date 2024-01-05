--[[
-- Stolen from loctvl842/nvim 
--]]
local M = {}

M.augroup = function(name)
  return vim.api.nvim_create_augroup("1henrypage_" .. name, { clear = true })
end



---@param name "autocmds" | "options" | "keymaps"
M.load = function(name)
  local Util = require("lazy.core.util")
  -- always load lazyvim, then user file
  local mod = "1henrypage.core." .. name
  Util.try(function()
    require(mod)
  end, {
    msg = "Failed loading " .. mod,
    on_error = function(msg)
      local modpath = require("lazy.core.cache").find(mod)
      if modpath then
        Util.error(msg)
      end
    end,
  })
end



return M
