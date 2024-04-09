return {
  "folke/trouble.nvim",
  opts = {
    icons = false
  },
  config = function()
    vim.keymap.set("n", "T", function() require("trouble").toggle() end)
  end
}
