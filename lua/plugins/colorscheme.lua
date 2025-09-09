return {
  {
    "lettertwo/laserwave.nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme laserwave]])
      vim.api.nvim_set_hl(0, 'EndOfBuffer', { fg = 'bg' }) 
    end,
  },
}
