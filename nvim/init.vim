if exists('g:vscode')
  source $HOME/.config/nvim/_vscode.vim
  finish
endif

if exists('g:started_by_firenvim')
  au BufEnter localhost*.txt set filetype=json
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'windwp/nvim-ts-autotag'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'

" CMP complition
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'onsails/lspkind.nvim'

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
"

Plug 'windwp/nvim-autopairs'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'mhartington/formatter.nvim'

" Commenting
Plug 'terrortylor/nvim-comment'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'folke/which-key.nvim'

Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" Session 
" Plug 'tpope/vim-obsession'

" UI
" Plug 'sainnhe/gruvbox-material'
" Plug 'navarasu/onedark.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

"
"" nvim in browser
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

call plug#end()

lua << EOF
require("tokyonight").setup({
  style = "night",
  on_colors = function(colors)
    colors.bg = "#1d1d1f"
    colors.bg_dark = "#131317"
    colors.bg_highlight = "#232738"
  end
})

require'nvim-web-devicons'.setup {
 default = true;
}

require('nvim_comment').setup {
  hook = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end
}
EOF

set background=dark
" let g:gruvbox_material_background = 'hard'
" colorscheme gruvbox-material

" let g:onedark_config = { 'style': 'warmer' }
" colorscheme onedark
colorscheme tokyonight-night

source $HOME/.config/nvim/src/sets.vim

source $HOME/.config/nvim/src/netrw.vim
source $HOME/.config/nvim/src/treesitter.vim

source $HOME/.config/nvim/src/lsp.vim
source $HOME/.config/nvim/src/formatting.vim

source $HOME/.config/nvim/src/telescope.vim

source $HOME/.config/nvim/src/keymappings.vim
source $HOME/.config/nvim/src/which_key.vim

source $HOME/.config/nvim/src/statusline.vim
source $HOME/.config/nvim/src/bufferline.vim

