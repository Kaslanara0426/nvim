vim.pack.add({

  -- lsp服务器和配置
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/neovim/nvim-lspconfig" },
  
  -- 语法树和高亮和跳转
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
  { src = "https://github.com/aaronik/treewalker.nvim" },

  -- 代码补全和代码片段库
  { src = "https://github.com/saghen/blink.lib" }, -- 代码补全
  { src = "https://github.com/Saghen/blink.cmp" }, -- 代码补全
  { src = "https://github.com/L3MON4D3/LuaSnip" }, -- 代码片段模板
  { src = "https://github.com/rafamadriz/friendly-snippets" }, -- 代码片段库
  
  -- 其他
  -- { src = "https://github.com/norcalli/nvim-colorizer.lua" }, -- 颜色代码显示色块
  -- { src = "https://github.com/catgoose/nvim-colorizer.lua" }, -- 颜色代码显示色块
  { src = "https://github.com/brenoprata10/nvim-highlight-colors" }, -- 颜色代码显示色块
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
    "css_variables"
  },
  automatic_installation = true,  -- 这个选项在 mason-lspconfig 中有效

  -- 如果你希望这些服务器被自动启用，就不要 exclude
  -- 如果确实需要排除某些服务器，请确保你在别处手动启用它们
  -- automatic_enable = {
  --   exclude = { "rust_analyzer" }  -- 按需排除
  -- }
})
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "clangd",
    "rust_analyzer",
    "css_variables"
  },
  automatic_enable = true,
})


-- treesitter
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('nvim-treesitter').install { 'rust', 'css', 'c', 'lua'}

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'lua', 'c', 'rust', "css" },
  callback = function() vim.treesitter.start() end,
})


-- 代码高亮
  -- 设置全局高亮组
  -- @comment             注释
  -- @function            函数名
  -- @function.call       函数调用
  -- @variable            变量
  -- @variable.parameter  函数参数
  -- @keyword             关键字（if、return 等）
  -- @string              字符串
  -- @number              数字
  -- @type                类型
  -- @constant            常量
  -- @operator            运算符
  -- @property            属性/字段

vim.api.nvim_set_hl(0, '@comment',            { fg = '#00A853', italic = true })
vim.api.nvim_set_hl(0, '@keyword',            { fg = '#FF79C6', bold = true })
vim.api.nvim_set_hl(0, '@string',             { fg = '#D19A66' })
vim.api.nvim_set_hl(0, '@function',           { fg = '#61AFEF', bold = true })
vim.api.nvim_set_hl(0, '@function.call',      { fg = '#61AFEF' })
vim.api.nvim_set_hl(0, '@variable',           { fg = '#ABB2BF' })
vim.api.nvim_set_hl(0, '@variable.parameter', { fg = '#D19A66', italic = true })
vim.api.nvim_set_hl(0, '@number',             { fg = '#BD93F9' })
vim.api.nvim_set_hl(0, '@type',               { fg = '#8BE9FD' })
vim.api.nvim_set_hl(0, '@constant',           { fg = '#BD93F9', bold = true })
vim.api.nvim_set_hl(0, '@operator',           { fg = '#ABB2BF' })
vim.api.nvim_set_hl(0, '@property',           { fg = '#8BE9FD' })


require('nvim-highlight-colors').setup({})
