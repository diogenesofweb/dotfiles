return {
  {
    'akinsho/bufferline.nvim',
    event = "VeryLazy",
    opts = {
      options = {
        tab_size = 10,
        show_buffer_icons = false, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
      }
    },
    config = function(_, opts)
      vim.keymap.set(
        "n", "<A-h>", "<cmd>BufferLineCyclePrev<cr>",
        { silent = true, desc = "Prev buffer" }
      )
      vim.keymap.set(
        "n", "<A-l>", "<cmd>BufferLineCycleNext<cr>",
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
    "echasnovski/mini.files",
    opts = {
      windows = {
        preview = true,
      },
      options = {
        use_as_default_explorer = false,
      },
    },

    config = function(_, opts)
      require("mini.files").setup(opts)

      local show_dotfiles = true
      local filter_show = function(fs_entry) return true end
      local filter_hide = function(fs_entry) return not vim.startswith(fs_entry.name, ".") end

      local toggle_dotfiles = function()
        show_dotfiles = not show_dotfiles
        local new_filter = show_dotfiles and filter_show or filter_hide
        require("mini.files").refresh({ content = { filter = new_filter } })
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id
          -- Tweak left-hand side of mapping to your liking
          vim.keymap.set("n", "g.", toggle_dotfiles, { buffer = buf_id })
        end,
      })
    end,
  },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

}
