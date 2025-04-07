vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath('config') .. "/lazy/"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

vim.api.nvim_create_autocmd({"TermOpen"}, {
  pattern = "*",
  callback = function()
    -- Clear Neovim's terminal control strings that might interfere
    vim.env.TERM = "xterm-256color" -- Reset to standard terminal type
    
    -- This will tell Neovim to not send its special cursor escape sequences
    vim.b.terminal_no_styling = true
    
    -- Disable Neovim's cursor control completely in this buffer
    vim.opt_local.guicursor = ""
  end
})


vim.cmd.colorscheme("laserwave")

local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 4 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightly color scheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- Enable undo memory
vim.opt.undofile = true -- Enable persistent undo
vim.opt.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir" -- Set undo directory
vim.opt.undolevels = 1000 -- Set number of undo leels
vim.opt.undoreload = 10000

-- Spelling
-- FIXME There is a bug where the prompt to download dictionaries never appears
-- FIXME a way to get around this is to run `nvim -u none` and turn on spelling manually
-- FIXME then the prompts will appear as they should
vim.o.spell = true
vim.g.spellfile_URL = "https://ftp.nluug.nl/vim/runtime/spell/"
vim.o.spelllang = "en,cs"

-- require("indentLine");

-- Require which-key
local wk = require("which-key")

-- Define the key mappings

-- Silent escape key-map for clearing the search.
vim.api.nvim_set_keymap('n', '<Esc>', ':nohlsearch<CR>', { noremap = true, silent = true })

vim.cmd("highlight TreesitterContextLineNumber guibg=#433350")
vim.cmd("highlight TreesitterContextSeparator guifg=#433350" )
vim.cmd("highlight TreesitterContext guibg=#433350") --#201b26")
vim.cmd("highlight TreesitterContextBottom guibg=#433350 gui=underline guisp=#dd50aa")

vim.cmd(":highlight! StatusLine  guibg=#dd50aa ")
vim.cmd(":highlight! StatusLineNC  guibg=#dd50aa ")
-- Function to align text based on a regex pattern in visual block mode
function AlignTextWithRegex()
  -- Get the selected lines and columns in visual block mode
  local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")
  local start_col = vim.fn.col("'<")
  local end_col = vim.fn.col("'>")
  local selected_lines = vim.fn.getline(start_line, end_line)

  -- Prompt for the regex pattern to align by
  local pattern = vim.fn.input("Enter regex pattern to align by: ")

  -- Find the maximum position of the pattern across the selected lines
  local max_pos = 0
  local aligned_lines = {}

  -- Find the maximum position of the regex match in the selected block of text
  for _, line in ipairs(selected_lines) do
    local match_pos = string.find(line, pattern)
    if match_pos then
      max_pos = math.max(max_pos, match_pos)
    end
  end

  -- Align each line based on the regex pattern
  for _, line in ipairs(selected_lines) do
    local match_pos = string.find(line, pattern)
    if match_pos then
      -- Calculate the number of spaces to pad
      local padding = max_pos - match_pos
      -- Add spaces after the matched part
      local aligned_line = string.sub(line, 1, match_pos - 1) .. string.rep(" ", padding) .. string.sub(line, match_pos)
      table.insert(aligned_lines, aligned_line)
    else
      -- No match found; add the line as is
      table.insert(aligned_lines, line)
    end
  end

  -- Replace the selected lines with the aligned ones
  vim.fn.setline(start_line, aligned_lines)
end

vim.cmd(":tnoremap <Esc> <C-\\><C-n>")
vim.cmd(":tnoremap <C-h> <C-\\><C-n><C-w>h")
vim.cmd(":tnoremap <C-l> <C-\\><C-n><C-w>l")
vim.cmd(":tnoremap <C-j> <C-\\><C-n><C-w>j")
vim.cmd(":tnoremap <C-k> <C-\\><C-n><C-w>k")
vim.cmd(":tnoremap <A-m> :horizontal resize +2<CR>")
vim.cmd(":tnoremap <A-n> :horizontal resize -2<CR>")
vim.cmd(":tnoremap <A-n> :horizontal resize -2<CR>")

vim.api.nvim_create_autocmd("WinEnter", {
  pattern = "term://*",
  command = "startinsert",
})

-- Self-documented keybindings
wk.add({
	{ "<Leader>b", group = "Buffers" },
	{ "<Leader><Leader>", "zzzszH", desc = "center" },
	{ "<Leader>bN", ":enew<CR>", desc = "Create a new buffer" },
	{ "<Leader>bb", ":Telescope buffers<CR>", desc = "Telescope buffers" },
	{ "<Leader>bl", ":bnext<CR>", desc = "Go to last buffer" },
	{ "<Leader>bh", ":bprevious<CR>", desc = "Go to last buffer" },
	{ "<Leader>bd", ":bp|bd #<CR>", desc = "Delete current buffer" },

	{ "<Leader>s", group = "Set Style" },
	-- { "<Leader>sS", "z=", desc = "See next spelling error" },
	{ "<Leader>ss", "z=1<CR><CR>", desc = "Fix next spelling error" },
	{ "<Leader>sw", ":set wrap!<CR>", desc = "Toggle line wrap" },
	{ "<Leader>sd", ":tcd %:p:h<CR>:pwd<CR>", desc = "Set file dir as tab CWD" },
	{ "<Leader>sD", ":cd %:p:h<CR>:pwd<CR>", desc = "Set file dir as global CWD" },
	{ "<Leader>su", ":tcd .<CR>:pwd<CR>", desc = "Unset tab CWD" },

	{ "gN", ":lua SelectNumberAndJumpToLine()<CR>", desc = "Jump to line number" },

	{ "<Leader><Tab>", group = "Tabs" },
	{ "<Leader><Tab>n", ":tabnew<CR>", desc = "Open a new tab" },
	{ "<Leader><Tab>d", ":tabclose<CR>", desc = "Close the current tab" },
	{ "<Leader>a", ":lua AlignTextWithRegex()<CR>", desc = "Regex align", mode = "v" },

	{ "<Leader>wv", ":vs<CR>", desc = "Split to left and right" },
	{ "<A-h>", ":tabp<CR>", desc = "Previous tab" },
	{ "<A-l>", ":tabn<CR>", desc = "Next tab" },
	{ "<A-j>", "gj", desc = "Go one line down (including wrapped lines)" },
	{ "<A-k>", "gk", desc = "Go one line up (including wrapped lines)" },
	{ "<C-n>", ":vertical resize -4<CR>", desc = "Unincrease vertical size" },
	{ "<C-m>", ":vertical resize +4<CR>", desc = "Increase vertical size" },
	{ "<A-n>", ":horizontal resize -2<CR>", desc = "Unincrease horizontal size" },
	{ "<A-m>", ":horizontal resize +2<CR>", desc = "Increase horizontal size" },
	{ "<Leader>ws", ":split<CR>", desc = "Split to up and down" },
	{ "<Leader>wc", ":close<CR>", desc = "Split to up and down" },
}, { prefix = "<Leader>" }) -- Use the leader key as the prefix

-- Automatically enter normal mode when switching to terminal buffer
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "term://*",
  command = "stopinsert"
})

-- Optional: Make terminal start in normal mode instead of insert mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "stopinsert"
})

-- Optional: Prevent automatic scrolling to prompt when entering terminal
vim.api.nvim_create_autocmd({"TermOpen", "TermEnter"}, {
  pattern = "*",
  callback = function()
    vim.opt_local.scrolloff = 0
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.opt_local.spell = false
  end,
})


function SelectNumberAndJumpToLine()
  if not vim.fn.getline('.'):sub(vim.fn.col('.'), vim.fn.col('.')):match('%d') then vim.fn.search('\\d', 'W') end 
  vim.fn.search('\\d', 'bcW', vim.fn.line('.'))

  
  -- Start visual mode
  vim.cmd('normal! v')
  -- Extend selection to end of number
  vim.fn.search('\\d\\@!', 'W', vim.fn.line('.'))
  vim.cmd('normal! h')
  -- Step 2: Yank the number
  vim.cmd('normal! y')
  -- Step 3: Get the yanked number
  local line_number = tonumber(vim.fn.getreg('"'))
  -- Step 4: Get the previous window number
  local prev_win = vim.fn.winnr('#')
  -- Step 5: Switch to the previous window explicitly
  vim.cmd(prev_win .. 'wincmd w')
  -- Step 6: Jump to the line number
  if line_number then
    vim.cmd('normal! ' .. line_number .. 'G')
    -- Step 7: Center the view on the current line
    vim.cmd('normal! zz')
  end
end

-- Map the function to a key, for example <Leader>g
vim.api.nvim_set_keymap('n', 'ú', '2<C-e>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '§', '2<C-y>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'ů', ';', {noremap = true, silent = true})

vim.keymap.set('n', '+', '1', { noremap = true })
vim.keymap.set('n', 'ě', '2', { noremap = true })
vim.keymap.set('n', 'š', '3', { noremap = true })
vim.keymap.set('n', 'č', '4', { noremap = true })
vim.keymap.set('n', 'ř', '5', { noremap = true })
vim.keymap.set('n', 'ž', '6', { noremap = true })
vim.keymap.set('n', 'ý', '7', { noremap = true })
vim.keymap.set('n', 'á', '8', { noremap = true })
vim.keymap.set('n', 'í', '9', { noremap = true })
vim.keymap.set('n', 'é', '0', { noremap = true })
vim.keymap.set('n', '1', '+', { noremap = true })
vim.keymap.set('n', '2', '@', { noremap = true })
vim.keymap.set('n', '3', '#', { noremap = true })
vim.keymap.set('n', '4', '$', { noremap = true })
vim.keymap.set('n', '5', '%', { noremap = true })
vim.keymap.set('n', '6', '^', { noremap = true })
vim.keymap.set('n', '7', '&', { noremap = true })
vim.keymap.set('n', '8', '*', { noremap = true })

vim.keymap.set('x', '+', '1', { noremap = true })
vim.keymap.set('x', 'ě', '2', { noremap = true })
vim.keymap.set('x', 'š', '3', { noremap = true })
vim.keymap.set('x', 'č', '4', { noremap = true })
vim.keymap.set('x', 'ř', '5', { noremap = true })
vim.keymap.set('x', 'ž', '6', { noremap = true })
vim.keymap.set('x', 'ý', '7', { noremap = true })
vim.keymap.set('x', 'á', '8', { noremap = true })
vim.keymap.set('x', 'í', '9', { noremap = true })
vim.keymap.set('x', 'é', '0', { noremap = true })
vim.keymap.set('x', '1', '+', { noremap = true })
vim.keymap.set('x', '2', '@', { noremap = true })
vim.keymap.set('x', '3', '#', { noremap = true })
vim.keymap.set('x', '4', '$', { noremap = true })
vim.keymap.set('x', '5', '%', { noremap = true })
vim.keymap.set('x', '6', '^', { noremap = true })
vim.keymap.set('x', '7', '&', { noremap = true })
vim.keymap.set('x', '8', '*', { noremap = true })
