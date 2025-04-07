 return  {
  'akinsho/toggleterm.nvim',
  version = "*",
  config = function ()
    require("toggleterm").setup{
      auto_scroll = false,
      border = 'curved',
     }
    local wk = require("which-key")
    wk.add({
      { "<Leader>t", group = "Terminal" },
      { "<Leader>tt", ":ToggleTerm<CR>", desc = "Toggle terminal dropdown" },
      { "<Leader>tt", ":ToggleTerm<CR>", desc = "Toggle terminal dropdown" },
      { "<Leader>t1", ":ToggleTerm 1<CR>", desc = "Toggle terminal 1" },
      { "<Leader>t2", ":ToggleTerm 2<CR>", desc = "Toggle terminal 2" },
      { "<Leader>t3", ":ToggleTerm 3<CR>", desc = "Toggle terminal 3" },
      { "<Leader>t4", ":ToggleTerm 4<CR>", desc = "Toggle terminal 4" },
      { "<Leader>t5", ":ToggleTerm 5<CR>", desc = "Toggle terminal 5" },
      { "<Leader>t6", ":ToggleTerm 6<CR>", desc = "Toggle terminal 6" },
      { "<Leader>t7", ":ToggleTerm 7<CR>", desc = "Toggle terminal 7" },
      { "<Leader>t8", ":ToggleTerm 8<CR>", desc = "Toggle terminal 8" },
      { "<Leader>t9", ":ToggleTerm 9<CR>", desc = "Toggle terminal 9" },
      { "<Leader><Tab>t", ":tab te<CR>", desc = "Open a terminal tab" },
    })
  end,
}
