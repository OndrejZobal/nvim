return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

        -- Remove '~' characters for Alpha buffer
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "alpha",
            callback = function()
                vim.opt_local.fillchars = { eob = " " }
            end,
        })

		-- Set header
		dashboard.section.header.val = {

[[  =================     ===============     ===============   ========  ======== ]],
[[  \\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . // ]],
[[  ||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\/ . . .|| ]],
[[  || . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . || ]],
[[  ||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .|| ]],
[[  || . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\ . . . . || ]],
[[  ||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\_ . .|. .|| ]],
[[  || . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\ `-_/| . || ]],
[[  ||_-' ||  .|/    || ||    \|.  || `-_|| ||_-' ||  .|/    || ||   | \  / |-_.|| ]],
[[  ||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \  / |  `|| ]],
[[  ||    `'         || ||         `'    || ||    `'         || ||   | \  / |   || ]],
[[  ||            .===' `===.         .==='.`===.         .===' /==. |  \/  |   || ]],
[[  ||         .=='   \_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \/  |   || ]],
[[  ||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \/  |   || ]],
[[  ||   .=='    _-'          '-__\._-'         '-_./__-'         `' |. /|  |   || ]],
[[  ||.=='    _-'                                                     `' |  /==.|| ]],
[[  =='    _-'                        N E O V I M                         \/   `== ]],
[[  \   _-'                                                                `-_   / ]],
[[  `''                                                                      ``'   ]],

		}
      --
		-- Set menu
		dashboard.section.buttons.val = {}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

    dashboard.section.buttons.val = {
      dashboard.button("i", "Prázdný soubor", ":enew<CR>"),
      dashboard.button("b", "Procházet soubory", ":Telescope file_browser<CR>"),
      dashboard.button("f", "Najít soubor", ":Telescope find_files<CR>"),
      dashboard.button("s", "Prohledat soubory", ":Telescope live_grep<CR>"),
      dashboard.button("q", "Ukončit", ":q<CR>"),
    }

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
