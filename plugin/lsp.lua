vim.pack.add({
  -- lsp服务器和配置
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
})


-- lsp服务器
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
})
-- lsp配置
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "rust_analyzer",
  },
  automatic_installation = true,  -- 这个选项在 mason-lspconfig 中有效

  -- 如果你希望这些服务器被自动启用，就不要 exclude
  -- 如果确实需要排除某些服务器，请确保你在别处手动启用它们
  -- automatic_enable = {
  --   exclude = { "rust_analyzer" }  -- 按需排除
  -- }
})


