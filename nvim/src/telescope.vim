lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules" }, 
    -- preview = false,

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

  extensions = {
    file_browser = {
      -- theme = "dropdown",
    },

    ["ui-select"] = {
      require("telescope.themes").get_cursor {}
      -- require("telescope.themes").get_dropdown {
      -- even more opts
      -- }
    }
  }
}

-- This will load fzy_native and have it override the default file sorter
require('telescope').load_extension('fzy_native')

require("telescope").load_extension("ui-select")

require("telescope").load_extension "file_browser"
EOF
" Find files using Telescope command-line sugar.
" nnoremap <leader>pf <cmd>Telescope find_files<cr>
" nnoremap <leader>pg <cmd>Telescope live_grep<cr>
" nnoremap <leader>pb <cmd>Telescope buffers<cr>
" nnoremap <leader>ph <cmd>Telescope help_tags<cr>
" 
" Using Lua functions
" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
