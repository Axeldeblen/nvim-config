return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- LSP hover configuration
    lsp = {
      hover = {
        enabled = true,
        silent = false,
        view = nil,
        opts = {},
      },
    },
    -- Presets configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      lsp_doc_border = true,        -- add a border to hover docs and signature help
    },
    -- Views configuration
    views = {
      hover = {
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        position = { row = 2, col = 2 },
        win_options = {
          winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
        },
      },
    },
    -- Notify configuration to prevent the error
    notify = {
      enabled = true,
      view = "notify",
    },
    -- Routes to handle potential issues
    routes = {
      {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      },
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      config = function()
        require("notify").setup({
          background_colour = "#000000",
          fps = 30,
          level = 2,
          minimum_width = 50,
          render = "default",
          stages = "fade_in_slide_out",
          timeout = 3000,
          top_down = true,
        })
      end,
    },
  },
}
