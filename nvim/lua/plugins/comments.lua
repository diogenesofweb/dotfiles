return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    opts = {
      -- enable_autocmd = false,
    },
  },
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {
      mappings = {
        -- Toggle comment (like `gcip` - comment inner paragraph) for both
        -- Normal and Visual modes
        -- comment = 'gc',
        comment = '<leader>/',
        -- Toggle comment on current line
        -- comment_line = 'gcc',
        comment_line = '<leader>/',

        -- Toggle comment on visual selection
        comment_visual = '<leader>/',
        -- Define 'comment' textobject (like `dgc` - delete whole comment block)
        textobject = 'gc',
      },
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
        end,
      },
    },
    config = function(_, opts)
      require("mini.comment").setup(opts)
    end,
  },
}
