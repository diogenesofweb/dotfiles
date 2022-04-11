if exists('g:vscode')
  source $HOME/.config/nvim/_vscode.vim
  finish
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'
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

" Snippets
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
" Plug 'rafamadriz/friendly-snippets'

Plug 'windwp/nvim-autopairs'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'mhartington/formatter.nvim'

" Commenting
Plug 'terrortylor/nvim-comment'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'folke/which-key.nvim'

Plug 'akinsho/bufferline.nvim'

" Session 
" Plug 'tpope/vim-obsession'

" UI
" Plug 'tomasiser/vim-code-dark'
" Plug 'projekt0n/github-nvim-theme'
" Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/gruvbox-material'

call plug#end()

set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material

lua << EOF
require'nvim-web-devicons'.setup {
 default = true;
}

require('nvim_comment').setup {
  hook = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end
}
EOF

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

