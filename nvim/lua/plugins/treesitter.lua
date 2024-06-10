return {
  "nvim-treesitter/nvim-treesitter",
  version = false, -- last release is way too old and doesn't work on Windows
  build = ":TSUpdate",
  -- event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { 'nvim-treesitter/playground' },
    { 'nvim-treesitter/nvim-treesitter-refactor' },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = {
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
    },
  },
  opts = {
    autotag = { enable = true, },
    playground = { enable = true, },
    highlight = { enable = true },
    indent = { enable = true, disable = {} },
    context_commentstring = { enable = true, enable_autocmd = false },
    refactor = {
      highlight_definitions = {
        enable = false,
        clear_on_cursor_move = true,
      },
      highlight_current_scope = { enable = false },
    },
    ensure_installed = {
      "bash",
      "html",
      "javascript",
      "json",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "tsx",
      "typescript",
      "vimdoc",
      "vim",
      "yaml",
      "go",
      "svelte",
      "css",
      "scss",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = false,
        node_incremental = "<Tab>",
        -- scope_incremental = "<nop>",
        node_decremental = "<S-Tab>",
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
          ["as"] = { query = "@scope", desc = "Select language scope" },
          -- ["a/"] = { query = "@comment.outer", desc = "Select outer comment" },
          ["a/"] = { query = "@comment.outer", desc = "Select outer comment" },
          ["if"] = { query = "@function.inner", desc = "Select inner function" },
          ["af"] = { query = "@function.outer", desc = "Select outer function" },
          ["io"] = { query = "@block.inner", desc = "Select inner block" },
          ["ao"] = { query = "@block.outer", desc = "Select outer block" },
        },
        selection_modes = {
          -- ['@comment.outer'] = 'V', -- linewise
          ['@function.outer'] = 'V', -- linewise
          -- ['@class.outer'] = '<c-v>', -- blockwise
        },
        include_surrounding_whitespace = false,
      },
      move = {
        enable = true,
        set_jumps = false, -- whether to set jumps in the jumplist
        goto_next_start = {
          -- ["]a"] = "@assignment.outer",
          ["]m"] = "@function.outer",
          ["]]"] = { query = "@class.outer", desc = "Next class start" },
          -- You can use regex matching and/or pass a list in a "query" key to group multiple queires.
          -- ["]l"] = "@loop.*",
          -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          -- ["<Tab>"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
          -- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
        },
      },
    },
  },
  config = function(_, opts)
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevelstart = 99

    -- vim.keymap.set('n', '<Tab>', function()
    --   print('tab')
    --   local ts_utils = require("nvim-treesitter.ts_utils")
    --   local the_node = ts_utils.get_node_at_cursor()
    --   local next = ts_utils.get_next_node(the_node, false, false)
    --   ts_utils.goto_node(next)
    -- end, { silent = true })

    require("nvim-treesitter.configs").setup(opts)
  end,
}
