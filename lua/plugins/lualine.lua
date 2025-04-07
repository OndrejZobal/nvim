return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count

    local colors = {
      blue = "#41B5C5",
      black = "#271e30",
      white = "#dfdfdf",
      green = "#30Bda0",
      yellow = "#edc060",
      red = "#ef3e3e",
      bg = "#231c2c",
      fg = "#dd50aa",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.fg, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg, gui = "bold" },
        c = { bg = colors.bg, fg = colors.fg, gui = "italic" },
      },
      insert = {
        a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.blue, gui = "bold" },
        c = { bg = colors.bg, fg = colors.blue, gui = "italic" },
      },
      visual = {
        a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.yellow, gui = "bold" },
        c = { bg = colors.bg, fg = colors.yellow, gui = "italic" },
      },
      command = {
        a = { bg = colors.bg, fg = colors.fg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.fg, gui = "bold" },
        c = { bg = colors.bg, fg = colors.fg, gui = "italic" },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.red, gui = "bold" },
        c = { bg = colors.bg, fg = colors.red, gui = "italic" },
      },
      terminal = {
        a = { bg = colors.green, fg = colors.bg, gui = "bold" },
        b = { bg = colors.bg, fg = colors.green, gui = "bold" },
        c = { bg = colors.bg, fg = colors.green, gui = "italic" },
      },
      inactive = {
        a = { bg = colors.fg, fg = colors.bg, gui = "bold" },
        b = { bg = colors.fg, fg = colors.bg, gui = "bold" },
        c = { bg = colors.fg, fg = colors.bg, gui = "italic" },
      },
    }

    -- configure lualine with modified theme
    lualine.setup({
      options = {
        theme = my_lualine_theme,
        section_separators = { left='\u{e0b4}', right='\u{e0b6}' },
        component_separators = { left='', right='' },
      },
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
      },
    })
  end,
}
