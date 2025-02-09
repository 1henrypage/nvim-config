local comment_key = '<C-_>'


local comment_config = {
    mappings = {
        comment = comment_key,
        comment_line = comment_key,
        comment_visual = comment_key,
        textobject = comment_key,
    },
}

local split_join_config = {
    mappings = {
        toggle = '<leader>J'
    }
}


return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function(_, opts)
            require("mini.comment").setup(comment_config)
            require("mini.pairs").setup({})
            require("mini.notify").setup({})
            require("mini.bracketed").setup({})
            require("mini.starter").setup({})
            require("mini.splitjoin").setup(split_join_config)
        end
    },
}
