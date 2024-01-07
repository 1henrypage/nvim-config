return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",

  config = function()
    vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal left<CR>', {})
  end
}

