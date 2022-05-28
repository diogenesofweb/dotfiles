set termguicolors

nnoremap <silent><A-b> :BufferLineCycleNext<CR>
" nnoremap <silent>[b :BufferLineCycleNext<CR>
" nnoremap <silent>b] :BufferLineCyclePrev<CR>

nnoremap <silent><A-1> <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><A-2> <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><A-3> <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><A-4> <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><A-5> <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><A-6> <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><A-7> <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><A-8> <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><A-9> <Cmd>BufferLineGoToBuffer 9<CR>

lua << EOF
require("bufferline").setup {
  options = {
    -- diagnostics = "nvim_lsp", 
    tab_size = 10,
    -- numbers = "buffer_id",
    show_buffer_icons = false, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    -- separator_style = "thin" 
  }
}
EOF
