return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    opts = {
      defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
      },
      pickers = {
        buffers = {
          previewer = false,
          theme = "dropdown",
          layout_config = {
            height = 0.8
          }
        }
      },
      extensions = {
        file_browser = {
          previewer = false,
          theme = "dropdown",
          layout_config = {
            height = 0.8
          }
        },
        ["ui-select"] = {
          require("telescope.themes").get_cursor {}
        }
      }
    },
    dependencies = {
      {
        "nvim-telescope/telescope-fzy-native.nvim",
        config = function()
          require("telescope").load_extension("fzy_native")
        end,
      },

      {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
          require("telescope").load_extension("ui-select")
        end,
      },

      {
        "nvim-telescope/telescope-file-browser.nvim",
        config = function()
          require("telescope").load_extension("file_browser")
        end,
      },
    },
  }
}
