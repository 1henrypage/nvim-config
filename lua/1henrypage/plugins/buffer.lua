
local Profile = require("1henrypage.profile")

return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        config = function(_, opts)
            require("bufferline").setup({
                options = {
                    mode = "buffers",
                    themable = true,
                    numbers = "ordinal",
                    diagnostics = "nvim_lsp",
                    diagnostics_update_on_event = true,
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = Profile.name,
                            text_align = "center",
                            separator = false,
                        },
                    },
                    color_icons = true,
                    show_buffer_icons = true,
                    separator_style = "thin",
                    enforce_regular_tabs = true,
                    always_show_bufferline = true,
                    sort_by = function(buffer_a,buffer_b)
                        local modified_a = vim.fn.getftime(buffer_a.path)
                        local modified_b = vim.fn.getftime(buffer_b.path)
                        return modified_a > modified_b
                    end
                },
            })
        end,
    },
}
