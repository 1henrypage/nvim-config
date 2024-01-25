local Icons = require("1henrypage.core.icons")
local Util = require("1henrypage.util")

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
                "lua_ls"
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
        branch = "master",
        event = { "BufReadPost", "BufNewFile", "BufWritePre" },
        dependencies = {
            "williamboman/mason.nvim",
            "williadependenciesmboman/mason-lspconfig.nvim",
        },
        config = function()
            local lspconfig = require("lspconfig")

            local capabilities = require('cmp_nvim_lsp').default_capabilities()           --lsps

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            vim.api.nvim_create_autocmd('LspAttach', {
                group = Util.augroup("LspConfig"),
                callback = function(ev)
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf, noremap = true, silent = true }
                    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<leader>gP', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>gwa', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>gwr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>gwl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set('n', '<leader>gtd', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>gf', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end,
            })
        end
    },

    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                },
            })
        end
    },

}
