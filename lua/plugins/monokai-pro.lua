return {
    "loctvl842/monokai-pro.nvim", 
    name="monokai-pro", 
    priority=1000,
    config = function()
      require('monokai-pro').setup({
        filter="ristretto",
        devicons = true,
        styles = {
          comment = { italic = true },
          keyword = { italic = true }, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        }, 
      })
      vim.cmd([[colorscheme monokai-pro]])
    end
}
