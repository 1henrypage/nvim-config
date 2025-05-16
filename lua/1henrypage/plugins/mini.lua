local Icons = require("1henrypage.extras").icons

local comment_key = "<C-_>"


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
        toggle = "<leader>J",
    },
}

local mini_snip_config = -- No need to copy this inside `setup()`. Will be used automatically.
{
  -- Array of snippets and loaders (see |MiniSnippets.config| for details).
  -- Nothing is defined by default. Add manually to have snippets to match.
  snippets = {},

  -- TODO MODIFY CONFIG 

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Expand snippet at cursor position. Created globally in Insert mode.
    expand = '<C-j>',

    -- Interact with default `expand.insert` session.
    -- Created for the duration of active session(s)
    jump_next = '<C-l>',
    jump_prev = '<C-h>',
    stop = '<C-c>',
  },

  -- Functions describing snippet expansion. If `nil`, default values
  -- are `MiniSnippets.default_<field>()`.
  expand = {
    -- Resolve raw config snippets at context
    prepare = nil,
    -- Match resolved snippets at cursor position
    match = nil,
    -- Possibly choose among matched snippets
    select = nil,
    -- Insert selected snippet
    insert = nil,
  },
}

local ai_config = {
    -- Table with textobject id as fields, textobject specification as values.
    -- Also use this to disable builtin textobjects. See |MiniAi.config|.
    custom_textobjects = nil,

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Main textobject prefixes
      around = 'a',
      inside = 'i',

      -- Next/last textobjects
      around_next = 'an',
      inside_next = 'in',
      around_last = 'al',
      inside_last = 'il',

      -- Move cursor to corresponding edge of `a` textobject
      goto_left = 'g[',
      goto_right = 'g]',
    },

    -- Number of lines within which textobject is searched
    n_lines = 50,

    -- How to search for object (first inside current line, then inside
    -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
    -- 'cover_or_nearest', 'next', 'prev', 'nearest'.
    search_method = 'cover_or_next',

    -- Whether to disable showing non-error feedback
    -- This also affects (purely informational) helper messages shown after
    -- idle time if user input is required.
    silent = false,
  }

local notify_config = {
    -- Content management
    content = {
        -- Function which orders notification array from most to least important
        -- By default orders first by level and then by update timestamp
        sort = function(notif_arr)
            table.sort(notif_arr, function(a, b)
                return a.ts_update > b.ts_update
            end)
            return notif_arr
        end,
    },

    -- Notifications about LSP progress
    lsp_progress = {
        -- Whether to enable showing
        enable = true,

        -- Notification level
        level = "ERROR",

        -- Duration (in ms) of how long last message should be shown
        duration_last = 3000,
    },

    -- Window options
    window = {
        -- Floating window config
        config = {},

        -- Maximum window width as share (between 0 and 1) of available columns
        max_width_share = 0.382,

        -- Value of 'winblend' option
        winblend = 25,
    },
}

local indent_scope_config = {
  -- Draw options
  draw = {
    -- Delay (in ms) between event and start of drawing scope indicator
    delay = 100,

    -- Animation rule for scope's first drawing. A function which, given
    -- next and total step numbers, returns wait time (in ms). See
    -- |MiniIndentscope.gen_animation| for builtin options. To disable
    -- animation, use `require('mini.indentscope').gen_animation.none()`.
    -- animation = --<function: implements constant 20ms between steps>,

    -- Whether to auto draw scope: return `true` to draw, `false` otherwise.
    -- Default draws only fully computed scope (see `options.n_lines`).
    predicate = function(scope) return not scope.body.is_incomplete end,

    -- Symbol priority. Increase to display on top of more symbols.
    priority = 2,
  },

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Textobjects
    object_scope = 'ii',
    object_scope_with_border = 'ai',

    -- Motions (jump to respective border line; if not present - body line)
    goto_top = '[i',
    goto_bottom = ']i',
  },

  -- Options which control scope computation
  options = {
    -- Type of scope's border: which line(s) with smaller indent to
    -- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
    border = 'both',

    -- Whether to use cursor column when computing reference indent.
    -- Useful to see incremental scopes with horizontal cursor movements.
    indent_at_cursor = true,

    -- Maximum number of lines above or below within which scope is computed
    n_lines = 10000,

    -- Whether to first check input line to be a border of adjacent scope.
    -- Use it if you want to place cursor on function header to get scope of
    -- its body.
    try_as_border = false,
  },

  -- Which character to use for drawing scope indicator
  symbol = Icons.gitsigns.change,
}




return {
    {
        "echasnovski/mini.nvim",
        version = "*",
        config = function(_, opts)
            require("mini.ai").setup({ai_config})
            require("mini.comment").setup(comment_config)
            require("mini.pairs").setup({})
            require("mini.notify").setup(notify_config)
            require("mini.bracketed").setup({})
            require("mini.starter").setup({}) 
            require("mini.splitjoin").setup(split_join_config)
            require("mini.surround").setup({})
            -- require("mini.statusline").setup({}) # don't use this it's shit
            require("mini.bufremove").setup({})
            require("mini.cursorword").setup({})
            require("mini.indentscope").setup(indent_scope_config)
            require("mini.surround").setup({})


            -- keybinds 
            vim.keymap.set('n', '<leader>bd', function ()
                require('mini.bufremove').delete(0, false)
            end, {})
            -- 
        end,
    },
}

