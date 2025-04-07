return {
  "kylechui/nvim-surround",
  -- event = { "BufReadPre", "BufNewFile" },
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function ()
    require("nvim-surround").setup({ })

    vim.keymap.set('n', 's', '<Plug>(nvim-surround-normal)', { noremap = true, silent = true})
    vim.keymap.set('v', 's', '<Plug>(nvim-surround-visual)', { noremap = true, silent = true})
  end,
}
