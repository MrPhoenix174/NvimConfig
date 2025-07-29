
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Иконки
  },
  config = function()
    require("nvim-tree").setup({
      -- Твои настройки тут
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
      },
    })
  end
}
