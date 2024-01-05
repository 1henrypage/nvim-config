return {
    "loctvl842/monokai-pro.nvim", 
    name="monokai-pro", 
    lazy = false,
    priority=1000,
    opts = {
      transparent_background = false,
      devicons = true, 
      filter = "ristretto",
      styles = {
          comment = { italic = true },
          keyword = { italic = true}, -- any other keyword
          type = { italic = true }, -- (preferred) int, long, char, etc
          storageclass = { italic = true }, -- static, register, volatile, etc
          structure = { italic = true }, -- struct, union, enum, etc
          parameter = { italic = true }, -- parameter pass in function
          annotation = { italic = true },
          tag_attribute = { italic = true }, -- attribute of tag in reactjs
        }, 
    },
    config = function(_, opts)
      local monokai = require('monokai-pro')        
      monokai.setup(opts)
      monokai.load()
    end
}
