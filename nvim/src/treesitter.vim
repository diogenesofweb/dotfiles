lua <<EOF
require'nvim-treesitter.configs'.setup {
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
    "vim",
    "go",
    "lua"
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

EOF

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
