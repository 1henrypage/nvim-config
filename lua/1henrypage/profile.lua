
---@class Profile
---@field name string
---@field author? string
---@field version? string
---@field license? string
local M = {
    name = "1henrypage",
    author = "Henry Page",
    version = "0.1.0",
}

M = setmetatable({}, { __index = M })

---@param opts? Profile
function M.setup(opts)
  vim.tbl_deep_extend("force", M, opts or {}) -- Modify `M` in place
end

return M

