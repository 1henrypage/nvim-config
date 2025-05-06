local Profile = require("1henrypage.profile")
local Icons = require("1henrypage.extras").icons

return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        config = function(_, opts)
            require("bufferline").setup({
                options = {
                    -- Buffer Icons config
                    modified_icon = Icons.git.modified,
                    close_icon = Icons.diagnostics.error,
                    left_trunc_marker = Icons.borders.thin.left,
                    right_trunc_marker = Icons.borders.thin.right,

                    mode = "buffers",
                    themable = true,
                    numbers = "buffer_id",
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
                    sort_by = function(buffer_a, buffer_b)
                        local modified_a = vim.fn.getftime(buffer_a.path)
                        local modified_b = vim.fn.getftime(buffer_b.path)
                        return modified_a > modified_b
                    end,
                    hover = {
                        enabled = true,
                        delay = 100,
                        reveal = { "close" },
                    },
                    groups = {
                        options = {
                            toggle_hidden_on_enter = true,
                        },
                        items = {
                            require('bufferline.groups').builtin.pinned:with({icon = Icons.bufferline.pinned .. " "})
                            -- {
                            --     name = "Tests",
                            --     highlight = { underline = true, sp = "blue" }, -- Optional
                            --     priority = 2,
                            --     icon = " ",
                            --     matcher = function(buf) -- Mandatory
                            --         return buf.filename and (buf.filename:match("%Test") or buf.filename:match("%Tests"))
                            --     end,
                            -- },
                            -- {
                            --     name = "Docs",
                            --     highlight = { undercurl = true, sp = "green" },
                            --     matcher = function(buf)
                            --         return buf.filename and (buf.filename:match("%.md") or buf.filename:match("%.txt"))
                            --     end,
                            -- },
                        },
                    },
                },
            })

            vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", {})

            for i = 1, 9 do
                vim.keymap.set("n", "<leader>" .. i, function()
                    require("bufferline").go_to(i)
                end, {})
            end

            vim.keymap.set("n", "<leader>0", function ()
                require("bufferline").go_to(-1)
            end, {})
        end,
    },
}
