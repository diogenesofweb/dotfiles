return {
  {
    'akinsho/bufferline.nvim',
    version = false,
    opts = {
      options = {
        tab_size = 10,
        show_buffer_icons = false, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
      }
    },
    config = function(_, opts)
      vim.keymap.set(
        "n", "<A-i>", "<cmd>BufferLineCyclePrev<cr>",
        { silent = true, desc = "Prev buffer" }
      )
      vim.keymap.set(
        "n", "<A-o>", "<cmd>BufferLineCycleNext<cr>",
        { silent = true, desc = "Next buffer" }
      )

      vim.keymap.set(
        "n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<cr>",
        { silent = true, desc = "Buffer 1" }
      )
      vim.keymap.set(
        "n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<cr>",
        { silent = true, desc = "Buffer 2" }
      )
      vim.keymap.set(
        "n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<cr>",
        { silent = true, desc = "Buffer 3" }
      )
      vim.keymap.set(
        "n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<cr>",
        { silent = true, desc = "Buffer 4" }
      )
      vim.keymap.set(
        "n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<cr>",
        { silent = true, desc = "Buffer 5" }
      )
      vim.keymap.set(
        "n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<cr>",
        { silent = true, desc = "Buffer 6" }
      )

      require("bufferline").setup(opts)
    end,
  },

  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      require('mini.statusline').setup()
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      -- char = "│",
      filetype_exclude = { "help", "lazy" },
      show_trailing_blankline_indent = false,
      show_current_context = true,
    },
  },

}
