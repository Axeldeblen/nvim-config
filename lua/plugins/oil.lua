return {
  'stevearc/oil.nvim',
  opts = {
    default_file_explorer = true,
    show_hidden = true,
  },

  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = {
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  }
}
