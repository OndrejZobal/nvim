return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config=function()
            local highlight = {
                "Indent3",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "Indent1", { fg = "#9182A6" })
            vim.api.nvim_set_hl(0, "Indent2", { fg = "#837696" })
            vim.api.nvim_set_hl(0, "Indent3", { fg = "#655C71" })
        end)

        require("ibl").setup {
            indent = { highlight = highlight, char = "│" },
            whitespace = {
                highlight = highlight,
                remove_blankline_trail = false,
            },
            scope = { enabled = false },
        }
    end,
}
