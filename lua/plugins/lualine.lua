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
<<<<<<< HEAD
      sections = {
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
=======

      sections = {
        lualine_b = {
          {'branch'},
          { 'diff' },
          {
            'diagnostics',
            sections = { 'error', 'warn' },
            diagnostics_color = {
              error = 'DiagnosticError',
              warn = 'DiagnosticInfo',
            },
            colored = false,
            update_in_insert = false, -- TODO FIXME maybe this should be turned off dunno
            always_visible = false,
          },
        },
        lualine_c = {
          {
            'filename',
            file_status = true,
            newfile_status = true,
            path = 0,
            symbols = {
              modified = '+',
              readonly = '-',
              unnamed = '',
              newfile = '[New]',
            },
          },
        },

        lualine_x = {
          -- {
          --   lazy_status.updates,
          --   cond = lazy_status.has_updates,
          -- },
          {
            'searchcount',
            maxcount = 9999,
            timeout = 500,
          },
          {
            function()
              local line = vim.fn.line('.')          -- Get current line number
              local total = vim.fn.line('$')         -- Get total lines
              
              if line == 1 or vim.bo.filetype == 'alpha' then
                return '   '  -- Spaces when at top
              end
              
              if line == total then
                return 'Bot'
              end
              
              local percent = math.floor((line / total) * 100)
              return string.format('%2d%%%%', percent)
            end
          },
          { "encoding", cond = function () return vim.bo.fileencoding ~= 'utf-8' and vim.bo.fileencoding ~= '' end },
          { "fileformat", cond = function () return vim.bo.fileformat ~= 'unix' end },
        },
        lualine_y = {
          { "filetype", colored = false, cond = function () return vim.bo.filetype ~= 'alpha' and vim.bo.filetype ~= 'toggleterm' end },
>>>>>>> 6888b81 (Tabline update and more)
        },
      },
    })
  end,
}
