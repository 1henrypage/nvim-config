local Util = require("1henrypage.util")
local Icons = require("1henrypage.core.icons")

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        dependencies = {
            {
                "nvim-telescope/telescope-live-grep-args.nvim" ,
                version = "^1.0.0",
            },

            {
                "debugloop/telescope-undo.nvim", 
            },
        },
        opts = function()
          return {
            defaults = {
              dynamic_preview_title = true,
              hl_result_eol = true,
              sorting_strategy = "ascending",
              file_ignore_patterns = {
                ".git/",
                "target/",
                "docs/",
                "vendor/*",
                "%.lock",
                "__pycache__/*",
                "%.sqlite3",
                "node_modules/*",
                -- "%.jpg",
                -- "%.jpeg",
                -- "%.png",
                "%.svg",
                "%.otf",
                "%.ttf",
                "%.webp",
                ".dart_tool/",
                ".github/",
                ".gradle/",
                ".idea/",
                ".settings/",
                ".vscode/",
                "__pycache__/",
                "build/",
                "gradle/",
                "node_modules/",
                "%.pdb",
                "%.dll",
                "%.class",
                "%.exe",
                "%.cache",
                "%.ico",
                "%.pdf",
                "%.dylib",
                "%.jar",
                "%.docx",
                "%.met",
                "smalljre_*/*",
                ".vale/",
                "%.burp",
                "%.mp4",
                "%.mkv",
                "%.rar",
                "%.zip",
                "%.7z",
                "%.tar",
                "%.bz2",
                "%.epub",
                "%.flac",
                "%.tar.gz",
              },
              results_title = "",
              layout_config = {
                horizontal = {
                  prompt_position = "top",
                  preview_width = 0.55,
                  results_width = 0.8,
                },
                vertical = {
                 mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
              },
            },
          }
        end,
        config = function(_, opts)
            local builtin = require("telescope.builtin") 

            -- Load dependencies
--             require('telescope').load_extension('neoclip')
--             vim.g.zoxide_use_select = true
            require("telescope").load_extension("undo")
--            require("telescope").load_extension("advanced_git_search")
            require("telescope").load_extension("live_grep_args")
--             require("telescope").load_extension("colors")

            -- Telescope associated keymap
            vim.keymap.set('n', '<leader>sn', builtin.find_files, {})
            vim.keymap.set("n", "<leader>sf", '<cmd>lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>')
            vim.keymap.set("n", "<leader>sb", builtin.buffers, {}) -- browse buffers
            vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, {}) -- function headers, keywords, etc
            vim.keymap.set("n", "<leader>so", builtin.oldfiles, {}) -- browse old files
            vim.keymap.set("n", "<leader>sw", builtin.grep_string, {})
            vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>")
            require("telescope").setup(opts)
        end,
    },

    {
        "luukvbaal/statuscol.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = false,
            ft_ignore = { "neo-tree" },
            segments = {
              {
                -- line number
                text = { " ", builtin.lnumfunc },
                condition = { true, builtin.not_empty },
                click = "v:lua.ScLa",
              },
              { text = { "%s" }, click = "v:lua.ScSa" }, -- Sign
              { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" }, -- Fold
            },
          })
          vim.api.nvim_create_autocmd({ "BufEnter" }, {
            callback = function()
              if vim.bo.filetype == "neo-tree" then
                vim.opt_local.statuscolumn = ""
              end
            end,
          })
        end,
      },


    

    
}
