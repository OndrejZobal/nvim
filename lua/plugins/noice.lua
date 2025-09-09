return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        view = "cmdline",
        format = {
          search_down = {
            view = "cmdline",
          },
          search_up = {
            view = "cmdline",
          },
        },
      },
    })
    require("notify").setup({
      stages = "static",
      timeout = 3000,
      render = "compact",
      top_down = false,
    })
    vim.cmd("highlight NotifyINFOIcon guifg=#dd50aa")
    vim.cmd("highlight NotifyINFOTitle guifg=#dd50aa")
    vim.cmd("highlight NotifyINFOBorder guifg=#633151")
  end
}
