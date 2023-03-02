lua <<EOF
require'nvim-treesitter.configs'.setup {
  playground = { enable = true, },

  context_commentstring = {
    enable = true
  },
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },

  autotag = { enable = true, },

  refactor = {
    highlight_definitions = {
      enable = true,
      -- Set to false if you have an `updatetime` of ~100.
      clear_on_cursor_move = true,
    },
    highlight_current_scope = { enable = false },
  },

  ensure_installed = {
    "typescript",
    "javascript",
    "json",
    "yaml",
    "svelte",
    "html",
    "css",
    "scss",
    "vim",
    "go",
    "lua"
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = false, -- set to `false` to disable one of the mappings
      node_incremental = "<Tab>",
      -- scope_incremental = false,
      node_decremental = "<S-Tab>",
    },
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",

        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },

        ["ac"] = { query = "@comment.outer",  desc = "Select outer comment" },

        ["ik"] = { query = "@block.inner",  desc = "Select inner block" },
        ["ak"] = { query = "@block.outer",  desc = "Select outer block" },
      },

      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        -- ['@comment.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },

      include_surrounding_whitespace = false,
    },

    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]a"] = "@assignment.outer",
        ["]m"] = "@function.outer",
        ["]]"] = { query = "@class.outer", desc = "Next class start" },
        -- You can use regex matching and/or pass a list in a "query" key to group multiple queires.
        ["]o"] = "@loop.*",
        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      -- goto_next_end = {
      --   ["]M"] = "@function.outer",
      --   ["]["] = "@class.outer",
      -- },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      -- goto_previous_end = {
      --   ["[M"] = "@function.outer",
      --   ["[]"] = "@class.outer",
      -- },
    },
  },
}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'label',

            -- 'if',
            -- 'switch',
            -- 'case',
        },
    },
}

-- local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim.keymap.set({ "n", "x", "o" }, ";", function()
--   ts_repeat_move.repeat_last_move_next()
--   vim.api.nvim_input('zz')
--   -- vim.api.nvim_feedkeys('zz', 'n', false)
-- end)
-- vim.keymap.set({ "n", "x", "o" }, ",", function()
--   ts_repeat_move.repeat_last_move_previous()
--   vim.api.nvim_input('zz')
--   -- vim.api.nvim_feedkeys('zz', 'n', false)
-- end)

EOF

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
