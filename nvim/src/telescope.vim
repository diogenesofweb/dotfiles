lua << EOF
require('telescope').setup{
  defaults = {
    file_ignore_patterns = { "node_modules" }
  }
}

-- This will load fzy_native and have it override the default file sorter
require('telescope').load_extension('fzy_native')
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
