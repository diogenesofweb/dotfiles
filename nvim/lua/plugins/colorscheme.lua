return {
  -- {
  --   "sainnhe/gruvbox-material",
  --   config = function()
  --     vim.opt.background = 'dark'
  --     vim.g.gruvbox_material_background = 'hard'
  --     vim.g.gruvbox_material_better_performance = 1
  --     vim.cmd([[colorscheme gruvbox-material]])
  --   end,
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd[[colorscheme tokyonight]]
      vim.cmd[[colorscheme tokyonight-night]]
      -- vim.cmd[[colorscheme tokyonight-moon]]
    end,
  }

  -- { 
  --   "catppuccin/nvim", 
  --   name = "catppuccin",  
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd[[colorscheme catppuccin-mocha]]
  --   end,
  -- }
}
