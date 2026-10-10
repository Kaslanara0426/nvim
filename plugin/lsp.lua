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


vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' } -- 将 vim 声明为全局变量
      }
    }
  }
})

vim.lsp.config('clangd', {
  init_options = {
    -- 让 clangd 不自动补全尖括号
    clangd = {
      headerInsertion = "iwyu", -- 或者调整其他补全偏好
    }
  }
})

vim.lsp.config('clangd', {
  -- 注意：这里用的是 cmd 而不是 init_options
  cmd = {
    'clangd',
    '--completion-style=detailed', -- 强制使用最详细的补全粒度
    '--function-arg-placeholders=0', -- 禁用函数参数占位符
  },
})
