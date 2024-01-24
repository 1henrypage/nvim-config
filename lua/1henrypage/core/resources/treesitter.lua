local treesitterLanguages = {
  "agda",
  "bash",
  "c",
  "c_sharp",
  "cmake",
  "cpp",
  "css",
  "dockerfile",
  "haskell",
  "html",
  "java",
  "javascript",
  "jq",
  "json",
  "kotlin",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "query",
  "regex",
  "scala",
  "scss",
  "sql",
  "typescript",
  "vim",
  "yaml",
}


return {
  {
    "nvim-treesitter/nvim-treesitter",
    build =":TSUpdate",
    opts = {
      ensure_installed = treesitterLanguages,
      highlight = {enable = true},
      indent = {enable = true, disable = {"yaml", "python", "html"}},
      context_commentstring = {enable = true},
      rainbow = {
        enable = true,
        query = "rainbow-parens",
        disable = {"jsx", "html"},
      },

    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    init = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          tsx = "rainbow-parens",
          javascript = "rainbow-delimiters-react"
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },

  




  
}
