" Better nav for omnicomplete inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
nnoremap <silent> Q <nop>

" Use alt + hjkl to resize windows
nnoremap <C-j>    :resize -2<CR>
nnoremap <C-k>    :resize +2<CR>
nnoremap <C-h>    :vertical resize -2<CR>
nnoremap <C-l>    :vertical resize +2<CR>

" Better window navigation
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
nnoremap <C-A-s> :wa<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
" inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Move selected lines up/down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv

" leader
let mapleader = " "
" let g:mapleader = "\<Space>"

" (UN)comment
nnoremap <space>/ :CommentToggle<CR>
vnoremap <space>/ :CommentToggle<CR>
" vnoremap <space>/ '<,'>:CommentToggle<CR>

" Undo
" nnoremap <C-z> u

" Add Empty Line
nmap <CR> o<Esc>
nmap <A-Enter> o<Esc>k

" Delete line without coping
nnoremap <BS> "_dd

" rename
nnoremap <F2> <cmd>lua vim.lsp.buf.rename()<CR>

:tnoremap <Esc> <C-\><C-n>


