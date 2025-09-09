return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local ok, mason = pcall(require, "mason")
    if not ok then
      return -- suppress error entirely
    end

    local mason_lspconfig_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
    local mason_tool_installer_ok, mason_tool_installer = pcall(require, "mason-tool-installer")

    -- Wrap everything in pcall so it never hard-crashes
    pcall(function()
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      if mason_lspconfig_ok then
        mason_lspconfig.setup({
          ensure_installed = {
            "ts_ls",
            "html",
            "cssls",
            "tailwindcss",
            "svelte",
            "lua_ls",
            "graphql",
            "emmet_ls",
            "prismals",
            "pyright",
          },
          automatic_installation = true,
        })
      end

      if mason_tool_installer_ok then
        mason_tool_installer.setup({
          ensure_installed = {
            "prettier",
            "stylua",
            "eslint_d",
          },
        })
      end
    end)
  end,
}
