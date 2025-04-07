return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function ()
    require('gitsigns').setup {
      signs = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable = true,
      signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true
      },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 60000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    }

    local wk = require("which-key")
    wk.add({
      { "<Leader>g", group = "Git" },
      { "<Leader>gs", ":Gitsigns stage_hunk<CR>:Lazy reload gitsigns.nvim<CR>", desc = "Stage hunk" },
      { "<Leader>gS", ":Gitsigns stage_buffer<CR>:Lazy reload gitsigns.nvim<CR>", desc = "Stage file" },
      { "<Leader>gr", ":Gitsigns reset_hunk<CR>:Lazy reload gitsigns.nvim<CR>", desc = "Reset hunk" },
      { "<Leader>gR", ":Gitsigns reset_buffer<CR>:Lazy reload gitsigns.nvim<CR>", desc = "Reset buffer" },
      { "<Leader>gu", ":Gitsigns undo_stage_hunk<CR>:Lazy reload gitsigns.nvim<CR>", desc = "Unstage hunk" },
      { "<Leader>gU", ":Gitsigns undo_stage_buffer<CR>:Lazy reload gitsigns.nvim<CR>", desc = "Unstage buffer" },
      { "<Leader>g]", ":Gitsigns next_hunk<CR>", desc = "Jump to next hunk" },
      { "<Leader>g[", ":Gitsigns prev_hunk<CR>", desc = "Jump to prev hunk" },
      { "<Leader>gd", ":Gitsigns toggle_linehl<CR>:Gitsigns toggle_word_diff<CR>:Gitsigns toggle_deleted<CR>", desc = "Highlight changes" },
      { "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>", desc = "Blame (inlined)" },
      { "<Leader>gB", ":Gitsigns blame_line<CR>", desc = "Blame line" },
      { "<Leader>gw", ":Gitsigns show<CR>", desc = "Show revision" },
    })

    -- local wk = require("which-key")
    -- wk.register({
    --   ["<Leader>gs"] = { ":Gitsigns stage_hunk<CR>", "Stage hunk" },
    --   ["<Leader>gS"] = { ":Gitsigns stage_buffer<CR>", "Stage file" },
    --   ["<Leader>gr"] = { ":Gitsigns reset_hunk<CR>", "Reset hunk" },
    --   ["<Leader>gR"] = { ":Gitsigns reset_buffer<CR>", "Reset buffer" },
    --   ["<Leader>gu"] = { ":Gitsigns undo_stage_hunk<CR>", "Unstage hunk" },
    --   ["<Leader>gU"] = { ":Gitsigns undo_stage_buffer<CR>", "Unstage buffer" },
    --   ["<Leader>g]"] = { ":Gitsigns next_hunk<CR>", "Jump to next hunk" },
    --   ["<Leader>g["] = { ":Gitsigns prev_hunk<CR>", "Jump to prev hunk" },
    --   ["<Leader>gd"] = { ":Gitsigns toggle_linehl<CR>:Gitsigns toggle_word_diff<CR>:Gitsigns toggle_deleted<CR>", "Highlight changes" },
    --   ["<Leader>gb"] = { ":Gitsigns toggle_current_line_blame<CR>", "Blame (inlined)" },
    --   ["<Leader>gB"] = { ":Gitsigns blame_line<CR>", "Blame line" },
    --   ["<Leader>gw"] = { ":Gitsigns show<CR>", "Show revision" },
    -- })

  end,
}
