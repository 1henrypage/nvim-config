local Icons = require("1henrypage.core.icons")

return {
    -- mason
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = Icons.git.added,
                    package_pending = Icons.git.untracked,
                    package_uninstalled = Icons.git.deleted,
                },
            },
        },
        config = function(_, opts)
            require("mason").setup(opts)
        end
    },


    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "hls","jdtls","tsserver","lua_ls", "pyright" 
            },
            automatic_installation = false,
            handlers = nil, -- change this later
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")


        end
    },
}
