return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'} 
  }, -- Changed 'requires' to 'dependencies' and 'run' to 'build'
  config = function ()
    local builtin = require('telescope.builtin')
    vim.api.nvim_create_user_command('TelescopeFindFiles', function()
      builtin.find_files({ cwd = vim.fn.getcwd() })
    end, {})

    -- Create the telescope configuration
    local telescope = require('telescope')
    -- Configure telescope with your settings
    telescope.setup({
      -- Added telescope.setup() to apply configurations
      pickers = { -- This pickers table is now properly applied
        find_files = {
          path_display = { "truncate" },
          cwd = vim.fn.getcwd(),
          hidden = true,
          sorter = require("telescope.sorters").get_fuzzy_file {
            -- Higher value means shorter paths get higher priority
            shorter_path_bias = 1.0
          }
        }
      },
      defaults = require("telescope.themes").get_ivy({ -- Moved theme config here
        layout_config = { height = 0.35 },
        mappings = { i = {["<C-j>"] = "move_selection_next", ["<C-k>"] = "move_selection_previous", ["<C-p>"] = "preview_scrolling_up", ["<C-n>"] = "preview_scrolling_down"}}
      })
    })
    
    local wk = require("which-key")
    wk.add({
  { "<Leader>f", group = "Files" },
  { "<Leader>bb", ":Telescope buffers<CR>", desc = "Telescope buffers" },
  { "<C-b>", ":Telescope buffers<CR>", desc = "Telescope buffers" },
  { "<Leader>fb", ":lua require('telescope').extensions.file_browser.file_browser({ path = '%:p:h' }) <CR>", desc = "Browse files" },
  { "<Leader>ff", ":TelescopeFindFiles<CR>", desc = "Find files" },
  { "<C-f>", ":TelescopeFindFiles<CR>", desc = "Find files" },
  { "<Leader>fl", ":Telescope current_buffer_fuzzy_find<CR>", desc = "Search current file's lines" },
  { "<Leader>fh", ":Telescope oldfiles<CR>", desc = "History of all opened files" },
  { "<Leader>fm", ":Telescope marks<CR>", desc = "Find marks" },
  { "<Leader>fr", ":Telescope registers<CR>", desc = "Find register content" },
  { "<Leader>fp", ":Telescope file_browser <CR>", desc = "Browse project files" },
  { "<Leader>fs", ":Telescope live_grep<CR>", desc = "Search all files by content" },
  { "<C-s>", ":Telescope live_grep<CR>", desc = "Search all files by content" },
  { "<Leader>sc", ":Telescope colorscheme<CR>", desc = "Temporarily set color scheme" },
  { "<Leader>sf", ":Telescope filetypes<CR>", desc = "Set filetype" },
  { "<Leader>sS", ":Telescope spell_suggest<CR>", desc = "Select spelling" },
  { "<Leader>gb", ":Telescope git_branches<CR>", desc = "Checkout branche" },
  { "<Leader>gc", ":Telescope git_commits<CR>", desc = "Checkout commit" },
  { "<Leader>gf", ":Telescope git_bcommits<CR>", desc = "Checkout file changes" },
  { "<Leader>.", ":Telescope resume<CR>", desc = "Reopen last search" },
})
  end,
}
