return {

  {
    "sainnhe/gruvbox-material",
    config = function()
      vim.opt.background = 'dark'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
}
