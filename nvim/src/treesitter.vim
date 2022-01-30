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
    "lua"
  },
}
EOF

set foldlevel=20
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
